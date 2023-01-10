package com.example.case_study_web.controller.customer;

import com.example.case_study_web.model.customer.Customer;
import com.example.case_study_web.model.employee.Division;
import com.example.case_study_web.model.employee.EducationDegree;
import com.example.case_study_web.model.employee.Employee;
import com.example.case_study_web.model.employee.Position;
import com.example.case_study_web.sevirce.impl.EmployeeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "EmployeeServlet", value = "/EmployeeServlet")
public class EmployeeServlet extends HttpServlet {
    EmployeeService employeeService = new EmployeeService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":

                break;
            case "edit":

                break;
            case "delete":

                break;
            case "sortByName":

                break;
            default:
                listEmployee(request, response);
                break;

        }
    }

    private void listEmployee(HttpServletRequest request, HttpServletResponse response) {
        List<Employee> employeeList = employeeService.getSelectEmployee();
        List<Position> positionList = employeeService.selectPosition();
        List<Division> divisionList = employeeService.selectDivision();
        List<EducationDegree> educationDegreeList = employeeService.selectEducationDegree();


        request.setAttribute("employeeList",employeeList);
        request.setAttribute("positionList",positionList);
        request.setAttribute("divisionList",divisionList);
        request.setAttribute("educationDegreeList",educationDegreeList);
        try {
            request.getRequestDispatcher("/view/employee/employee.jsp").forward(request,response);
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

                break;
            case "edit":

                break;
            case "delete":

                break;
            case "sortByName":

                break;
            default:
                break;

        }
    }
}
