package com.baizhi.service;

import com.baizhi.entity.Book;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookService {
    public void insertBook(Book book);

    public void removeBook(String id);

    public void modifyBook(Book book);

    public Book queryById(String id);

    public List<Book> queryByAll();

    public List<Book> queryByKey(String key,String content);

    //    根据销量查询8本图书
    public List<Book> queryByHot();
    //    根据出版时间查询8本图书
    public List<Book> queryByNew();
    //    随机查两本图书
    public List<Book> queryByRecommend();
    //    根据销量和出版时间查询8本图书
    public List<Book> queryByHotBoard();
    //    分页查一级二级书
    public List<Book> querySplitOneTwoBook(String fid, String sid, Integer currentPage, Integer pageSize);
    //    一共有多少书
    public Integer querySplitCountBook(String fid, String sid,Integer pageSize);
    //    查询一本书的详细信息
    public Book queryDetailBook(String id);
}
