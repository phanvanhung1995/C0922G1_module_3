package com.example.case_study_web;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class FuramaResort extends HttpServlet {


    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {


    }

    public void destroy() {
    }
}