package com.example.manegement_product.service.impl;

import com.example.manegement_product.model.Product;
import com.example.manegement_product.service.IProductService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductService implements IProductService {
    private static Map<Integer,Product> productMap = new HashMap<>();

    static {
        productMap.put(1, new Product(1, "John", 10, "111","Hanoi"));
        productMap.put(2, new Product(2, "Bill", 20, "222","Danang"));
        productMap.put(3, new Product(3, "Alex", 30, "333","Saigon"));
        productMap.put(4, new Product(4, "Adam", 40, "111","Beijin"));
        productMap.put(5, new Product(5, "Sophia", 50,"111", "Miami"));
        productMap.put(6, new Product(6, "Rose", 60,"111", "Newyork"));
    }
    @Override
    public List<Product> findAll() {
        return new ArrayList<>(productMap.values());
    }

    @Override
    public void save(Product product) {
        productMap.put(product.getId(),product);
    }

    @Override
    public Product findById(int id) {
        return productMap.get(id);
    }

    @Override
    public void update(int id, Product product) {
        productMap.put(id,product);
    }

    @Override
    public void remove(int id) {
        productMap.remove(id);
    }
    public List<Product> findByName(String name) {
        List<Product> products = new ArrayList<>();


        if (name == "") {
            return products;
        } else {
            for (Map.Entry<Integer, Product> entry : productMap.entrySet()) {
                if (entry.getValue().getName().contains(name)) {
                    products.add(entry.getValue());
                }
            }
        }
        return products;
    }

}
