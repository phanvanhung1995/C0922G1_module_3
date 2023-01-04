package com.example.ex_1.service;

import com.example.ex_1.model.User;

import java.util.List;

public interface IUserService {
    public void insertUser(User user);

    public User selectUser(int id);

    public List<User> selectAllUser();

    public boolean deleteUser(int id);

    public boolean updateUser(User user);
}
