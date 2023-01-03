package com.example.manegement_product.service;

import com.example.manegement_product.model.Product;

import java.beans.Customizer;
import java.util.List;

public interface IProductService {
    List<Product> finAll();

    void save(Product product);

    Product findById(int id);

    void update(int id,Product product);

    void remove(int id);

}
