package com.example.case_study_web.repository.impl;

import com.example.case_study_web.model.customer.Customer;
import com.example.case_study_web.repository.BaseRepository;
import com.example.case_study_web.repository.ICustomerRepository;

import java.nio.file.Watchable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private final String SELECT_ALL = "select * from customer";
    private final String SELECT_COUNT = "select count(*) from customer;";
    private final String SELECT_CUSTOMER_BY_ID = "select * from customer where customer_id =?";
    private final String INSERT_NEW_CUSTOMER = "insert into customer \n" +
            "values (? , \n" +
            "  ? , \n" +
            "  ? , \n" +
            "  ? , \n" +
            "  ? , \n" +
            "  ? , \n" +
            "  ? , \n" +
            "  ?, \n" +
            "  ? );";


    @Override
    public List<Customer> getSelectCustomer() {
        Customer customer = null;
        List<Customer> customerList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int customer_id = resultSet.getInt("customer_id");
                int customer_type_id = resultSet.getInt("customer_type_id");
                String customer_name = resultSet.getString("customer_name");
                String customer_date_of_birth = resultSet.getString("customer_date_of_birth");
                Boolean customer_gender = resultSet.getBoolean("customer_gender");
                String customer_id_card = resultSet.getString("customer_id_card");
                String customer_phone_number = resultSet.getString("customer_phone_number");
                String customer_email = resultSet.getString("customer_email");
                String customer_address = resultSet.getString("customer_address");
                customer = new Customer(customer_id, customer_type_id, customer_name, customer_date_of_birth, customer_gender
                        , customer_id_card, customer_phone_number, customer_email, customer_address);
                customerList.add(customer);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }

    @Override
    public Customer selectCustomerById(int id) {
        Customer customer = null;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CUSTOMER_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int customer_id = resultSet.getInt("customer_id");
                int customer_type_id = resultSet.getInt("customer_type_id");
                String customer_name = resultSet.getString("customer_name");
                String customer_date_of_birth = resultSet.getString("customer_date_of_birth");
                Boolean customer_gender = resultSet.getBoolean("customer_gender");
                String customer_id_card = resultSet.getString("customer_id_card");
                String customer_phone_number = resultSet.getString("customer_phone_number");
                String customer_email = resultSet.getString("customer_email");
                String customer_address = resultSet.getString("customer_address");
                customer = new Customer(customer_id, customer_type_id, customer_name, customer_date_of_birth, customer_gender
                        , customer_id_card, customer_phone_number, customer_email, customer_address);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return customer;
    }

    @Override
    public void insertCustomer(Customer customer) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_NEW_CUSTOMER);

            preparedStatement.setInt(1, customer.getId());
            preparedStatement.setInt(2, customer.getTypeId());
            preparedStatement.setString(3, customer.getName());
            preparedStatement.setString(4, customer.getDateOfBirth());
            preparedStatement.setBoolean(5, customer.getGender());
            preparedStatement.setString(6, customer.getIdCard());
            preparedStatement.setString(7, customer.getPhoneNumber());
            preparedStatement.setString(8, customer.getEmail());
            preparedStatement.setString(9, customer.getAddress());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private final String UPDATE_CUSTOMER = "\n" +
            "update customer set customer_type_id = ?,customer_name = ?," +
            "customer_date_of_birth=?,\n" + "customer_gender=?, customer_id_card=?," +
            "customer_phone_number=?,customer_email=?,\n" + "customer_address=? where customer_id=?";

    @Override
    public boolean updateCustomer(Customer customer) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CUSTOMER);
            preparedStatement.setInt(1, customer.getId());
            preparedStatement.setString(2, customer.getName());
            preparedStatement.setString(3, customer.getDateOfBirth());
            preparedStatement.setBoolean(4, customer.getGender());
            preparedStatement.setString(5, customer.getIdCard());
            preparedStatement.setString(6, customer.getPhoneNumber());
            preparedStatement.setString(7, customer.getEmail());
            preparedStatement.setString(8, customer.getAddress());
            preparedStatement.setInt(9, customer.getId());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private final String QUERY = "delete from customer where customer_id = ?";

    @Override
    public boolean deleteCustomer(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(QUERY);
            preparedStatement.setInt(1, id);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    private final String SEARCH_QUERY = "select * from customer c \n" +
            "\tjoin customer_type ct on c.customer_type_id = ct.customer_type_id \n" +
            "    where customer_name like ? and customer_gender = ?;";

    @Override
    public List<Customer> searchCustomer(String name, int gender) {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_QUERY);
            preparedStatement.setString(1,"%" + name + "%");
            preparedStatement.setInt(2,gender);;
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int customer_id = resultSet.getInt("customer_id");
                int customer_type_id = resultSet.getInt("customer_type_id");
                String customer_name = resultSet.getString("customer_name");
                String customer_date_of_birth = resultSet.getString("customer_date_of_birth");
                Boolean customer_gender = resultSet.getBoolean("customer_gender");
                String customer_id_card = resultSet.getString("customer_id_card");
                String customer_phone_number = resultSet.getString("customer_phone_number");
                String customer_email = resultSet.getString("customer_email");
                String customer_address = resultSet.getString("customer_address");
              Customer  customer = new Customer(customer_id, customer_type_id, customer_name, customer_date_of_birth, customer_gender
                        , customer_id_card, customer_phone_number, customer_email, customer_address);
              customerList.add(customer);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return customerList;
    }
}