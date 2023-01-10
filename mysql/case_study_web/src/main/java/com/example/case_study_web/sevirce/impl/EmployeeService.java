package com.example.case_study_web.sevirce.impl;

import com.example.case_study_web.model.employee.Division;
import com.example.case_study_web.model.employee.EducationDegree;
import com.example.case_study_web.model.employee.Employee;
import com.example.case_study_web.model.employee.Position;
import com.example.case_study_web.repository.impl.DivisionRepository;
import com.example.case_study_web.repository.impl.EducationDegreeRepository;
import com.example.case_study_web.repository.impl.PositionRepository;
import com.example.case_study_web.repository.impl.EmployeeRepository;
import com.example.case_study_web.sevirce.IEmployeeService;

import java.util.List;

public class EmployeeService implements IEmployeeService {
    EmployeeRepository employeeRepository = new EmployeeRepository();
    PositionRepository employeePositionRepository = new PositionRepository();
    DivisionRepository divisionRepository = new DivisionRepository();
    EducationDegreeRepository educationDegreeRepository = new EducationDegreeRepository();
    @Override
    public List<Employee> getSelectEmployee() {
        return employeeRepository.getSelectEmployee();
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

    @Override
    public List<Position> selectPosition() {
        return employeePositionRepository.selectPosition();
    }

    @Override
    public List<Division> selectDivision() {
        return divisionRepository.selectDivision();
    }

    @Override
    public List<EducationDegree> selectEducationDegree() {
        return educationDegreeRepository.selectEducationDegree();
    }
}
