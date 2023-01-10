package com.example.case_study_web.sevirce;

import com.example.case_study_web.model.customer.Customer;
import com.example.case_study_web.model.customer.CustomerType;

import java.util.List;

public interface ICustomerService {
    List<Customer> getSelectCustomer();

    Customer selectCustomerById(int id);

    void insertCustomer(Customer customer);

    boolean updateCustomer(Customer customer);
    boolean deleteCustomer(int id);

    List<CustomerType> selectCustomerType();
    List<Customer> searchCustomer(String name, int gender);

}
