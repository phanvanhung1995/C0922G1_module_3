package controller;

import model.Customer;
import service.impl.CustomerServiceimpl;

import javax.accessibility.AccessibleRelation;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/CustomerServlet")
public class CustomerServlet extends HttpServlet {
    private CustomerServiceimpl customerServiceimpl = new CustomerServiceimpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                showDeleteFroem(request,response);
                break;
            case "view":
                viewCustomerForm(request,response);
                break;
            default:
                listCustomer(request, response);
                break;
        }
    }

    private void viewCustomerForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerServiceimpl.findById(id);
        RequestDispatcher dispatcher ;
        if (customer ==null) {
            dispatcher = request.getRequestDispatcher("/error-404.jsp");
        } else {
            request.setAttribute("customer",customer);
            dispatcher = request.getRequestDispatcher("/view.jsp");
            try {
                dispatcher.forward(request,response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }

    }

    private void showDeleteFroem(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerServiceimpl.findById(id);
        RequestDispatcher dispatcher;

        if (customer == null) {
            dispatcher = request.getRequestDispatcher("/error-404.jsp");
        } else {
            request.setAttribute("customer",customer);
            dispatcher = request.getRequestDispatcher("/delete.jsp");
            try {
                dispatcher.forward(request,response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        RequestDispatcher dispatcher;
        Customer customer = customerServiceimpl.findById(id);
        if (customer == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("customer", customer);
            dispatcher = request.getRequestDispatcher("/edit.jsp");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("/create.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void listCustomer(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> list = customerServiceimpl.findAll();
        request.setAttribute("customers", list);
        try {
            request.getRequestDispatcher("list.jsp").forward(request, response);
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
                createCustomer(request, response);
                break;
            case "edit":
                updateCustomer(request, response);
                break;
            case "delete":
                deleteCustomer(request,response);
                break;
            default:
                listCustomer(request, response);
                break;
        }
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerServiceimpl.findById(id);
        RequestDispatcher dispatcher ;

        if (customer == null) {
            dispatcher = request.getRequestDispatcher("/error-404.jsp");
        } else {
            customerServiceimpl.remove(id);
            try {
                response.sendRedirect("/CustomerServlet");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");

        Customer customer = customerServiceimpl.findById(id);
        RequestDispatcher dispatcher;

        if (customer == null) {
            dispatcher = request.getRequestDispatcher("/error-404.jsp");
        } else {
            customer.setName(name);
            customer.setEmail(email);
            customer.setAddress(address);
            customerServiceimpl.update(id,customer);
            request.setAttribute("customer",customer);
            dispatcher = request.getRequestDispatcher("/edit.jsp");
            try {
                dispatcher.forward(request,response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int id = (int) (Math.random() * 10000);
        Customer customer = new Customer(id, name, email, address);
        customerServiceimpl.save(customer);
        try {
            request.getRequestDispatcher("/create.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
