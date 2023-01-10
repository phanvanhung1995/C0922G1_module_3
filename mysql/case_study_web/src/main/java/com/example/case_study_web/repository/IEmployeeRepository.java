package com.example.case_study_web.repository;

import com.example.case_study_web.model.customer.Customer;
import com.example.case_study_web.model.employee.Employee;

import java.util.List;

public interface IEmployeeRepository {

    List<Employee> getSelectEmployee();

    Employee selectEmployeeById(int id);

    Employee insertEmployee(Employee Employee);

    Employee updateEmployee(Employee Employee);
    Employee deleteEmployee(Employee Employee);

}
