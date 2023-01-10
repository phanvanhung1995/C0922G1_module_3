package com.example.case_study_web.repository;

import com.example.case_study_web.model.customer.CustomerType;
import com.example.case_study_web.model.employee.Position;

import java.util.List;

public interface IEmployeePositionRepository {
    public List<Position> selectPosition();
}
