package com.baizhi.service;

import com.baizhi.dao.UserDao;
import com.baizhi.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.List;
@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;
    @Override
    public void insertUser(User user) {
        userDao.insert(user);
    }

    @Override
    public void removePLUser(String[] id) {
        userDao.deleteByIdList(Arrays.asList(id));
    }

    @Override
    public void removeUser(String id) {
        userDao.deleteByPrimaryKey(id);
    }

    @Override
    public void modifyUser(User user) {
        userDao.updateByPrimaryKeySelective(user);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public User queryById(String id) {
        User user = userDao.selectByPrimaryKey(id);
        return user;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<User> queryByAll() {
        List<User> users = userDao.selectAll();
        return users;
    }
}
