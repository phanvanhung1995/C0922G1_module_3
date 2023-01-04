package com.example.ex_1.repository;

import com.example.ex_1.model.User;

import javax.jws.soap.SOAPBinding;
import java.util.List;

public interface IUsersRepository {

    public void insertUser(User user);

    public User selectUser(int id);

    public List<User> selectAllUser();

    public boolean deleteUser(int id);

    public boolean updateUser(User user);
}
