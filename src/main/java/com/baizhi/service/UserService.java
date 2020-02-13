package com.baizhi.service;

import com.baizhi.entity.User;

import java.util.List;

public interface UserService {
    public void insertUser(User user);

    public void removePLUser(String[] id);

    public void removeUser(String id);

    public void modifyUser(User user);

    public User queryById(String id);

    public List<User> queryByAll();

}
