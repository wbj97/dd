package com.baizhi.service;

import com.baizhi.dao.BookDao;
import com.baizhi.entity.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class BookServiceImpl implements BookService {
    @Autowired
    BookDao bookDao;
    @Override
    public void insertBook(Book book) {
        book.setId(UUID.randomUUID().toString());
        System.out.println("book = " + book);
        bookDao.insertBook(book);
    }

    @Override
    public void removeBook(String id) {
        bookDao.deleteByPrimaryKey(id);
    }

    @Override
    public void modifyBook(Book book) {
        bookDao.updateBook(book);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Book queryById(String id) {
        Book book = bookDao.selectByPrimaryKey(id);
        return book;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Book> queryByAll() {
        List<Book> books = bookDao.selectAll();
        return books;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Book> queryByKey(String key, String content) {
        List<Book> books = bookDao.queryByKey(key, content);
        return books;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Book> queryByHot() {
        List<Book> books = bookDao.queryByHot();
        return books;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Book> queryByNew() {
        List<Book> books = bookDao.queryByNew();
        return books;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Book> queryByRecommend() {
        List<Book> books = bookDao.queryByRecommend();
        return books;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Book> queryByHotBoard() {
        List<Book> books = bookDao.queryByHotBoard();
        return books;
    }

    @Override
    public List<Book> querySplitOneTwoBook(String fid, String sid, Integer currentPage, Integer pageSize) {
        List<Book> books = bookDao.querySplitOneTwoBook(fid, sid, currentPage, pageSize);
        return books;
    }

    @Override
    public Integer querySplitCountBook(String fid, String sid,Integer pageSize) {
        Integer count = bookDao.querySplitCountBook(fid, sid);
        count = count%pageSize==0?count/pageSize:count/pageSize+1;
        return count;
    }

    @Override
    public Book queryDetailBook(String id) {
        Book book = bookDao.queryDetailBook(id);
        return book;
    }
}
