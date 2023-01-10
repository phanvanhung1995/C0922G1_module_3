package com.example.case_study_web.sevirce;

import com.example.case_study_web.model.employee.Division;
import com.example.case_study_web.model.employee.EducationDegree;
import com.example.case_study_web.model.employee.Employee;
import com.example.case_study_web.model.employee.Position;

import java.util.List;

public interface IEmployeeService {
    List<Employee> getSelectEmployee();

    Employee selectEmployeeById(int id);

    Employee insertEmployee(Employee Employee);

    Employee updateEmployee(Employee Employee);
    Employee deleteEmployee(Employee Employee);

    public List<Position> selectPosition();
    public List<Division> selectDivision();
    List<EducationDegree> selectEducationDegree();
}
