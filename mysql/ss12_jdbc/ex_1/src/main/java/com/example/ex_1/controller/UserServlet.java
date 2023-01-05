package com.example.ex_1.controller;

import com.example.ex_1.model.User;
import com.example.ex_1.service.impl.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/UserServlet")
public class UserServlet extends HttpServlet {
    UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                showCreateForm(request,response);
                break;
            case "edit":
                showEditForm(request,response);
                break;
            case "delete":
                showDeleteUser(request,response);
                break;
            case "sortByName" :
                sortByName(request,response);
            default:
                listUser(request, response);
                break;
        }
    }

    private void searchByCountryForm(HttpServletRequest request, HttpServletResponse response) {
        String country = request.getParameter("country");
        List<User> userList = userService.selectUser(country);
        request.setAttribute("users",userList);
        request.setAttribute("country",country);
        try {
            request.getRequestDispatcher("/view/search.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showDeleteUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userService.selectUser(id);

        if (user == null) {
            request.getRequestDispatcher("/err-404.jsp");
        } else {
            request.setAttribute("id",id);
            request.setAttribute("user",user);
            try {
                request.getRequestDispatcher("/view/delete.jsp").forward(request,response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userService.getUserById(id);

        if (user == null) {
            request.getRequestDispatcher("/err-404.jsp");
        } else {
            try {
                request.getRequestDispatcher("/view/edit.jsp").forward(request,response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("view/create.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }

    }

    private void listUser(HttpServletRequest request, HttpServletResponse response) {
        List<User> userList = userService.selectAllUser();
        request.setAttribute("userList",userList);

        try {
            request.getRequestDispatcher("/view/list.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                createUser(request,response);
                break;
            case "edit":
                editUser(request,response);
                break;
            case "delete":
                deleteUser(request,response);
                break;
            case "searchByCountry":
                searchByCountryForm(request,response);
            case "sortByName" :
                sortByName(request,response);
            default:
                break;
        }
    }

    private void sortByName(HttpServletRequest request, HttpServletResponse response) {
        List<User> userList = userService.sortByName();
        request.setAttribute("userList",userList);

        try {
            request.getRequestDispatcher("/view/list.jsp").forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userService.selectUser(id);

        if (user == null) {
            request.getRequestDispatcher("/err-404.jsp");
        } else {
            request.setAttribute("id",id);
            request.setAttribute("user",user);
            userService.deleteUser(id);
            try {
                request.getRequestDispatcher("/view/delete.jsp").forward(request,response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }

    }

    private void editUser(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country =request.getParameter("country");
        int id = Integer.parseInt(request.getParameter("id"));

        User user = userService.selectUser(id);
        if (user == null) {
            request.getRequestDispatcher("/err-404.jsp");
        } else {
            user.setName(name);
            user.setEmail(email);
            user.setCountry(country);

            userService.updateUser(user);
            try {
                request.getRequestDispatcher("/view/edit.jsp").forward(request,response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void createUser(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        int id = Integer.parseInt(request.getParameter("id"));
        User user = new User(id,name,email,country);
        userService.insertUserStore(user);
        try {
            request.getRequestDispatcher("/view/create.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
