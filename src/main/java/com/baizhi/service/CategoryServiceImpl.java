package com.baizhi.service;

import com.baizhi.dao.CategoryDao;
import com.baizhi.entity.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    CategoryDao categoryDao;
    @Override
    public void insertCategory(Category category) {
        categoryDao.insert(category);
    }

    @Override
    public void removeCategory(String id) {
        categoryDao.deleteByPrimaryKey(id);
    }

    @Override
    public void modifyCategory(Category category) {

    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Category queryById(String id) {
        return null;
    }




    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Category> queryByCategory() {
        List<Category> categories = categoryDao.queryByCategory();
        return categories;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Category> queryAllLevel(String level) {
        List<Category> categories = categoryDao.queryAllLevel(level);
        return categories;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Integer queryByCount(String id) {
        Integer count = categoryDao.queryByCount(id);
        return count;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Category> queryByAllCategory() {
        List<Category> categories = categoryDao.selectAll();
        return categories;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Category> queryOneHaveTwoCategory() {
        List<Category> categories = categoryDao.queryOneHaveTwoCategory();
        return categories;
    }

    @Override
    public Category queryOneTwoCategory(String fid) {
        Category category = categoryDao.queryOneTwoCategory(fid);
        return category;
    }
}
