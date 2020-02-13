package com.baizhi.dao;

import com.baizhi.entity.Book;
import com.baizhi.entity.Category;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.additional.insert.InsertListMapper;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface BookDao extends Mapper<Book> , InsertListMapper<Book> {
//    模糊查询图书
    public List<Book> queryByKey(@Param("key") String key,@Param("content") String content);
//添加图书
    public void insertBook(Book book);
//    修改图书
    public void updateBook(Book book);
//    根据销量查询8本图书
    public List<Book> queryByHot();
//    根据出版时间查询8本图书
    public List<Book> queryByNew();
//    随机查两本图书
    public List<Book> queryByRecommend();
//    根据销量和出版时间查询8本图书
    public List<Book> queryByHotBoard();
//    分页查一级二级书
    public List<Book> querySplitOneTwoBook(@Param("fid") String fid,@Param("sid")String sid,@Param("currentPage")Integer currentPage,@Param("pageSize")Integer pageSize);
//    一共有多少书
    public Integer querySplitCountBook(@Param("fid") String fid,@Param("sid") String sid);
//    查询一本书的详细信息
    public Book queryDetailBook(String id);
}

