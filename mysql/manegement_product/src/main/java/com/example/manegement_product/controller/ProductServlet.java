package com.example.manegement_product.controller;

import com.example.manegement_product.model.Product;
import com.example.manegement_product.service.impl.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/ProductServlet")
public class ProductServlet extends HttpServlet {
    ProductService productService = new ProductService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) {
            action ="";
        }

        switch (action) {
            case "create" :
                break;
            case "edit" :
                break;
            case "delete":
                break;
            case "view" :
                break;
            case "seach" :
                break;
            default:
                listProduct(request,response);
                break;
        }
    }

    private void listProduct(HttpServletRequest request, HttpServletResponse response) {
        List<Product> productList = productService.finAll();

        request.setAttribute("products",productList);
        try {
            request.getRequestDispatcher("/list.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action ="";
        }

        switch (action) {
            case "create" :
                break;
            case "edit" :
                break;
            case "delete":
                break;
            case "view" :
                break;
            case "seach" :
                break;
            default:
                break;
        }
    }
}
