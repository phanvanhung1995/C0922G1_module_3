package com.example.case_study_web.repository.impl;

import com.example.case_study_web.model.customer.CustomerType;
import com.example.case_study_web.repository.BaseRepository;
import com.example.case_study_web.repository.ICustomerType;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerTypeRepository implements ICustomerType {
    @Override
    public List<CustomerType> selectCustomerType() {
        List<CustomerType> customerTypeList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from customer_type");
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("customer_type_id");
                String name = resultSet.getString("customer_type_name");
                CustomerType customerType = new CustomerType(id,name);
                customerTypeList.add(customerType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerTypeList;
    }
}
