package com.baizhi;

import com.baizhi.dao.BookDao;
import com.baizhi.dao.CategoryDao;
import com.baizhi.entity.Book;
import com.baizhi.entity.Category;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class DdApplicationTests {
    @Autowired
    CategoryDao categoryDao;
    @Autowired
    BookDao bookDao;
    @Test
    void contextLoads() {
//        List<Category> categories = categoryDao.queryAllLevel("1");
//        List<Category> categories = categoryDao.queryOneHaveTwoCategory();
//        System.out.println("categories = " + categories);
//        Category category = categoryDao.queryOneTwoCategory("1");
//        System.out.println("category = " + category);
//        List<Book> books = bookDao.queryByHot();
//        List<Book> books = bookDao.queryByRecommend();
//        List<Book> books = bookDao.queryByNew();
//        List<Book> books = bookDao.queryByHotBoard();
//        List<Book> books = bookDao.querySplitOneTwoBook("1", null, 1, 3);
//        System.out.println("books = " + books);
        Integer count = bookDao.querySplitCountBook("1  ", null);
        System.out.println("count = " + count);
    }

}
