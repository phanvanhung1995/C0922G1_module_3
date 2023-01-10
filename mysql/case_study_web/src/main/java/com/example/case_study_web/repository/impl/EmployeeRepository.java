package com.example.case_study_web.repository.impl;

import com.example.case_study_web.model.employee.Employee;
import com.example.case_study_web.repository.BaseRepository;
import com.example.case_study_web.repository.IEmployeeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepository implements IEmployeeRepository {

    private final String SELECT_ALL = "select * from employee";
    @Override
    public List<Employee> getSelectEmployee() {
        List<Employee> employeeList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int employee_id = resultSet.getInt("employee_id");
                String employee_name = resultSet.getString("employee_name");
                String employee_date_of_birth = resultSet.getString("employee_date_of_birth");
                String employee_id_card = resultSet.getString("employee_id_card");
                double employee_salary = resultSet.getDouble("employee_salary");
                String employee_phone_number = resultSet.getString("employee_phone_number");
                String employee_email = resultSet.getString("employee_email");
                String employee_address = resultSet.getString("employee_address");
                int education_degree_id = resultSet.getInt("education_degree_id");
                int position_id = resultSet.getInt("position_id");
                int division_id = resultSet.getInt("division_id");

                Employee employee = new Employee(employee_id,employee_name,employee_date_of_birth,employee_id_card,employee_salary,employee_phone_number
                ,employee_email,employee_address,education_degree_id,position_id,division_id);
                employeeList.add(employee);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employeeList;
    }

    @Override
    public Employee selectEmployeeById(int id) {
        return null;
    }

    @Override
    public Employee insertEmployee(Employee Employee) {
        return null;
    }

    @Override
    public Employee updateEmployee(Employee Employee) {
        return null;
    }

    @Override
    public Employee deleteEmployee(Employee Employee) {
        return null;
    }
}
