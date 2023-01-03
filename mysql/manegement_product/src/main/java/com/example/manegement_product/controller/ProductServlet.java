package com.example.manegement_product.controller;

import com.example.manegement_product.model.Product;
import com.example.manegement_product.service.impl.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.beans.Customizer;
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
                showCreateForm(request,response);
                break;
            case "edit" :
                showEditForm(request,response);
                break;
            case "delete":
                showDeleteForm(request,response);
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

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);

        if (product == null) {
            request.getRequestDispatcher("/err-404.jsp");
        } else {
            try {
                request.getRequestDispatcher("/view/delete.jsp").forward(request,response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);

        if (product == null) {
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
            request.getRequestDispatcher("/view/createProduct.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void listProduct(HttpServletRequest request, HttpServletResponse response) {
        List<Product> productList = productService.finAll();

        request.setAttribute("products",productList);
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
            action ="";
        }

        switch (action) {
            case "create" :
                createProduct(request,response);
                break;
            case "edit" :
                editProduct(request,response);
                break;
            case "delete":
                deleteProduct(request,response);
                break;
            case "view" :
                break;
            case "seach" :
                break;
            default:
                break;
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);

        if (product == null) {
            request.getRequestDispatcher("/err-404.jsp");
        } else {
            productService.remove(id);
            try {
                request.getRequestDispatcher("/view/delete.jsp").forward(request,response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String manufacturer = request.getParameter("manufacturer");
        float price = Float.parseFloat(request.getParameter("price"));

        Product product = productService.findById(id);

        if (product == null) {
            request.getRequestDispatcher("/err-404.jsp");
        } else {
            product.setName(name);
            product.setPrice(price);
            product.setDescription(description);
            product.setManufacturer(manufacturer);
            productService.update(id,product);
            request.setAttribute("product",product);
            request.setAttribute("message", "product information was updated");
            try {
                request.getRequestDispatcher("/view/edit.jsp").forward(request,response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        Float price = Float.valueOf(request.getParameter("price"));
        String description = request.getParameter("description");
        String manufacturer = request.getParameter("manufacturer");
        int id = (int)(Math.random() * 10000);
        Product product = new Product(id,name,price,description,manufacturer);
        productService.save(product);
        request.setAttribute("message", "New product was created");
        try {
            request.getRequestDispatcher("/view/createProduct.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
