package com.example.case_study_web.repository.impl;

import com.example.case_study_web.model.employee.Division;
import com.example.case_study_web.model.employee.Position;
import com.example.case_study_web.repository.BaseRepository;
import com.example.case_study_web.repository.IDivisionRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DivisionRepository implements IDivisionRepository {
    @Override
    public List<Division> selectDivision() {
        List<Division> divisionList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from division");
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("division_id");
                String name = resultSet.getString("division_name");
                Division division = new Division(id, name);
                divisionList.add(division);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return divisionList;
    }
}
