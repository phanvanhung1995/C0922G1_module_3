package com.example.case_study_web.controller.customer;

import com.example.case_study_web.model.customer.Customer;
import com.example.case_study_web.model.customer.CustomerType;
import com.example.case_study_web.sevirce.impl.CustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/CustomerServlet")
public class CustomerServlet extends HttpServlet {
    CustomerService customerService = new CustomerService();

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
                break;
            case "search":
                searchCustomer(request, response);
                break;
            case "delete":
                deleteCustomer(request, response);
                break;
            default:
                listCustomer(request, response);
                break;
        }
    }

    private void searchCustomer(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        int gender = Integer.parseInt(request.getParameter("gender"));

        List<Customer> customerList = customerService.searchCustomer(name,gender);
        request.setAttribute("customerList",customerList);
        try {
            request.getRequestDispatcher("/view/view_customer/customer.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }


    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        List<CustomerType> customerTypeList = customerService.selectCustomerType();
        request.setAttribute("customerTypeList", customerTypeList);
        try {
            request.getRequestDispatcher("/view/view_customer/CreateNewCustomer.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void listCustomer(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList = customerService.getSelectCustomer();
        List<CustomerType> customerTypeList = customerService.selectCustomerType();
        request.setAttribute("customerList", customerList);
        request.setAttribute("customerTypeList", customerTypeList);
        try {
            request.getRequestDispatcher("/view/view_customer/customer.jsp").forward(request, response);
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
                customerCreate(request, response);
                break;
            case "edit":
                editCustomer(request, response);
                break;
            case "sortByName":
                break;
            case "search":
                searchCustomer(request, response);
                break;
            default:
                listCustomer(request, response);
                break;

        }
    }

    private void editCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        int typeId = Integer.parseInt(request.getParameter("typeId"));
        String name = request.getParameter("name");
        String dateOfBirth = request.getParameter("dateOfBirth");
        boolean gender = request.getParameter("gender").isEmpty();
        String idCard = request.getParameter("idCard");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Customer customer = new Customer(id, typeId, name, dateOfBirth, gender, idCard, phoneNumber, email, address);

        String mess = "sửa thành công";
        boolean check = customerService.updateCustomer(customer);
        if (!check) {
            mess = "sửa không thành công";
        }
        List<Customer> customerList = customerService.getSelectCustomer();


        request.setAttribute("customer", customer);
        request.setAttribute("mess", mess);
        request.setAttribute("customerList", customerList);
        try {
            request.getRequestDispatcher("/view/view_customer/customer.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        int idDelete = Integer.parseInt(request.getParameter("idDelete"));
        String mess = "xóa thành công";
        boolean check = customerService.deleteCustomer(idDelete);
        if (!check) {
            mess = "xóa không thành công";
        }
        request.setAttribute("mess", mess);
        listCustomer(request, response);
    }

    private void customerCreate(HttpServletRequest request, HttpServletResponse response) {
        int typeId = Integer.parseInt(request.getParameter("typeId"));
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String dateOfBirth = request.getParameter("dateOfBirth");
        boolean gender = request.getParameter("gender").isEmpty();
        String idCard = request.getParameter("idCard");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Customer customer = new Customer(id, typeId, name, dateOfBirth, gender, idCard, phoneNumber, email, address);
        customerService.insertCustomer(customer);
        request.setAttribute("customer", customer);
        try {
            request.getRequestDispatcher("/view/view_customer/CreateNewCustomer.jsp").forward(request, response);

        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
