package com.baizhi.service;

import com.baizhi.entity.Book;
import com.baizhi.entity.Category;

import java.util.List;

public interface CategoryService {
    public void insertCategory(Category category);

    public void removeCategory(String id);

    public void modifyCategory(Category category);

    public Category queryById(String id);

    public List<Category> queryByCategory();

    public List<Category> queryAllLevel(String level);

    public Integer queryByCount(String id);

    public List<Category> queryByAllCategory();
    //    查询所有一级分类包含二级分类
    public List<Category> queryOneHaveTwoCategory();
    //    查询一级(包含二级)分类
    public Category queryOneTwoCategory(String fid);
}
