package com.example.case_study_web.repository.impl;

import com.example.case_study_web.model.employee.EducationDegree;
import com.example.case_study_web.model.employee.Position;
import com.example.case_study_web.repository.BaseRepository;
import com.example.case_study_web.repository.IEducationDegree;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EducationDegreeRepository implements IEducationDegree {
    @Override
    public List<EducationDegree> selectEducationDegree() {
            List<EducationDegree> educationDegreeList = new ArrayList<>();
            Connection connection = BaseRepository.getConnectDB();
            try {
                PreparedStatement preparedStatement = connection.prepareStatement("select * from education_degree");
                ResultSet resultSet = preparedStatement.executeQuery();

                while (resultSet.next()) {
                    int id = resultSet.getInt("education_degree_id");
                    String name = resultSet.getString("education_degree_name");
                    EducationDegree educationDegree = new EducationDegree(id,name);
                    educationDegreeList.add(educationDegree);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return educationDegreeList;
    }
}
