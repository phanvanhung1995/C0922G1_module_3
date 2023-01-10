package com.example.case_study_web.repository;

import com.example.case_study_web.model.employee.Division;
import com.example.case_study_web.model.employee.Position;

import java.util.List;

public interface IDivisionRepository {
    public List<Division> selectDivision();
}
