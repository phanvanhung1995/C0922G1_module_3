package com.example.ex_1.service;

import com.example.ex_1.model.User;

import java.util.List;

public interface IUserService {
    public void insertUser(User user);

    public User selectUser(int id);

    public List<User> selectAllUser();

    public boolean deleteUser(int id);

    public boolean updateUser(User user);
    public List<User> selectUser(String country);
    public List<User> sortByName();
    public User getUserById(int id);
    public void insertUserStore(User user);
    List<User> getSelectUser();
    boolean updateUserStore(User user);
    boolean deleteUserStore(int id);
    void addUserTransaction(User user, int[] permisions);
}
