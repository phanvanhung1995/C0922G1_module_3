package com.example.case_study_web.repository.impl;

import com.example.case_study_web.model.employee.Position;
import com.example.case_study_web.repository.BaseRepository;
import com.example.case_study_web.repository.IEmployeePositionRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PositionRepository implements IEmployeePositionRepository {
    @Override
    public List<Position> selectPosition() {
        List<Position> positionList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from position");
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("position_id");
                String name = resultSet.getString("position_name");
                Position position = new Position(id,name);
                positionList.add(position);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return positionList;
    }
}
