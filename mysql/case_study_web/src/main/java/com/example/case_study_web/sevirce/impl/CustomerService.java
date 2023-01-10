package com.example.case_study_web.sevirce.impl;

import com.example.case_study_web.model.customer.Customer;
import com.example.case_study_web.model.customer.CustomerType;
import com.example.case_study_web.repository.impl.CustomerRepository;
import com.example.case_study_web.repository.impl.CustomerTypeRepository;
import com.example.case_study_web.sevirce.ICustomerService;

import java.util.List;

public class CustomerService implements ICustomerService {
    CustomerRepository customerRepository = new CustomerRepository();
    CustomerTypeRepository customerTypeRepository = new CustomerTypeRepository();
    @Override
    public List<Customer> getSelectCustomer() {
       return customerRepository.getSelectCustomer();

    }

    @Override
    public Customer selectCustomerById(int id) {
        return customerRepository.selectCustomerById(id);
    }

    @Override
    public void insertCustomer(Customer customer) {
        customerRepository.insertCustomer(customer);
    }

    @Override
    public boolean updateCustomer(Customer customer) {
        return customerRepository.updateCustomer(customer);
    }

    @Override
    public boolean deleteCustomer(int id) {
        return customerRepository.deleteCustomer(id);
    }

    @Override
    public List<CustomerType> selectCustomerType() {
        return customerTypeRepository.selectCustomerType();
    }

    @Override
    public List<Customer> searchCustomer(String name, int gender) {
        return customerRepository.searchCustomer(name,gender);
    }
}
