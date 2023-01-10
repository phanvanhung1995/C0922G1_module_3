package com.example.case_study_web.repository;

import com.example.case_study_web.model.customer.Customer;

import javax.jws.soap.SOAPBinding;
import java.util.List;

public interface ICustomerRepository {

    List<Customer> getSelectCustomer();

    Customer selectCustomerById(int id);

    void insertCustomer(Customer customer);

    boolean updateCustomer(Customer customer);
    boolean deleteCustomer(int id);

    List<Customer> searchCustomer(String name, int gender);


}
