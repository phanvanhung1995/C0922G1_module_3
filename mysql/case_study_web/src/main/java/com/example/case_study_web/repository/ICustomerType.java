package com.example.case_study_web.repository;

import com.example.case_study_web.model.customer.CustomerType;

import java.util.List;

public interface ICustomerType {
    List<CustomerType> selectCustomerType();

}
