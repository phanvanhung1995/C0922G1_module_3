package com.example.ex_1.service.impl;

import com.example.ex_1.model.User;
import com.example.ex_1.repository.impl.UserRepository;
import com.example.ex_1.service.IUserService;

import java.util.List;

public class UserService implements IUserService {
    UserRepository userRepository = new UserRepository();

    @Override
    public void insertUser(User user) {
        userRepository.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return userRepository.selectUser(id);
    }

    @Override
    public List<User> selectAllUser() {
        return userRepository.selectAllUser();
    }

    @Override
    public boolean deleteUser(int id) {
        return userRepository.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) {
        return userRepository.updateUser(user);
    }
}
