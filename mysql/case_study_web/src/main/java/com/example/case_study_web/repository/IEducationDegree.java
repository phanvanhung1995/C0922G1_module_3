package com.example.case_study_web.repository;

import com.example.case_study_web.model.employee.Division;
import com.example.case_study_web.model.employee.EducationDegree;

import java.util.List;

public interface IEducationDegree {
    public List<EducationDegree> selectEducationDegree();
}
