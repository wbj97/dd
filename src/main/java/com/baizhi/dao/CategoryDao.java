package com.baizhi.dao;

import com.baizhi.entity.Category;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.additional.insert.InsertListMapper;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface CategoryDao extends Mapper<Category>, InsertListMapper<Category> {
//    查询所有类别
    public List<Category> queryByCategory();
//查询该等级下的所有类别
    public List<Category> queryAllLevel(String level);
//查询该父类id下是否有值
    public Integer queryByCount(String id);
//   查询一级分类和二级分类
    public List<Category> queryOneOrTwoCategory(@Param("fid") String fid, @Param("sid") String sid);
//    查询所有一级分类包含二级分类
    public List<Category> queryOneHaveTwoCategory();
//    查询一级(包含二级)分类
    public Category queryOneTwoCategory(String fid);
}
