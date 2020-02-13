package com.baizhi.controller;

import com.baizhi.dao.BookDao;
import com.baizhi.entity.Book;
import com.baizhi.entity.Category;
import com.baizhi.service.BookService;
import com.baizhi.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/book")
public class BookController {
    @Autowired
    BookService bookService;
    @Autowired
    CategoryService categoryService;
//查询所有图书
    @RequestMapping("/queryByAll")
    public String queryByAll(HttpServletRequest request){
        List<Book> books = bookService.queryByAll();
        request.setAttribute("list",books);
        return "back/book/show";
    }
//    查询所有类别
    @RequestMapping("queryByAllCategory")
    public String queryByAllCategory(HttpServletRequest request,String id){
        if(id==null){
            List<Category> categories = categoryService.queryByAllCategory();
            request.setAttribute("list1",categories);
            return "back/book/add";
        }else{
            List<Category> categories = categoryService.queryByAllCategory();
            request.setAttribute("list1",categories);
            return "forward:/book/queryById";
        }

    }
//添加图书
    @RequestMapping("insertBook")
    public String insert(Book book){
        System.out.println(book);
        bookService.insertBook(book);
        return "redirect:/book/queryByAll";
    }
//修改图书
    @RequestMapping("modifyBook")
    public String modifyBook(Book book,MultipartFile imgFile,HttpSession session) throws IOException {
        //获取服务器绝对路径
        String realPath = session.getServletContext().getRealPath("/upload/imgFile");
        //确定目标文件夹是否存在
        File file = new File(realPath);
        if(!file.exists()){
            file.mkdirs();
        }
        //防止重名
        String name = imgFile.getOriginalFilename()+"_"+new Date().getTime();
        //上传
        imgFile.transferTo(new File(realPath,name));
        //文件上传结束
        book.setSrc(name);
        bookService.modifyBook(book);
        return "redirect:/book/queryByAll";
    }
//删除图书
    @RequestMapping("removeBook")
    public String removeBook(String id){
        bookService.removeBook(id);
        return "redirect:/book/queryByAll";
    }
//查询当前id下的图书
    @RequestMapping("queryById")
    public String queryById(String id,HttpServletRequest request){
        Book book = bookService.queryById(id);
        request.setAttribute("book",book);
        return "back/book/update";
    }
//    模糊查询图书
    @RequestMapping("queryByKey")
    public String queryByKey(String key,String content,HttpServletRequest request){
        System.out.println("key = " + key);
        System.out.println("content = " + content);
        List<Book> books = bookService.queryByKey(key, content);
        request.setAttribute("list",books);
        System.out.println("books = " + books);
        return "back/book/show";
    }
//    上传图书
    @RequestMapping("insert")
        public String insert(Book book, MultipartFile imgFile, HttpSession session) throws IOException {
        //获取服务器绝对路径
        String realPath = session.getServletContext().getRealPath("/upload/imgFile");
        //确定目标文件夹是否存在
        File file = new File(realPath);
        if(!file.exists()){
            file.mkdirs();
        }
        //防止重名
        String name = imgFile.getOriginalFilename()+"_"+new Date().getTime();
        //上传
        imgFile.transferTo(new File(realPath,name));
        //文件上传结束
        book.setSrc(name);
        bookService.insertBook(book);
        return "redirect:/book/queryByAll";
    }
    @RequestMapping("main")
    public String main(HttpServletRequest request){
        List<Category> categories = categoryService.queryOneHaveTwoCategory();
        request.setAttribute("list",categories);
        List<Book> bookHot = bookService.queryByHot();
        request.setAttribute("bookHot",bookHot);
        List<Book> bookNew = bookService.queryByNew();
        request.setAttribute("bookNew",bookNew);
        List<Book> bookHotBoard = bookService.queryByHotBoard();
        request.setAttribute("bookHotBoard",bookHotBoard);
        List<Book> bookRecommend = bookService.queryByRecommend();
        request.setAttribute("bookRecommend",bookRecommend);
        return "/front/main/main";
    }

    //    二级页面
    @RequestMapping("queryOneTwoCategory")
    public String queryOneTwoCategory(HttpServletRequest request,String fid,String sid,Integer currentPage,Integer pageSize){
        if(currentPage==null){
            currentPage = 1;
        }
        pageSize = 3;
        request.setAttribute("currentPage",currentPage);
        Integer totalPage = bookService.querySplitCountBook(fid, sid, pageSize);
        request.setAttribute("totalPage",totalPage);
        Category category = categoryService.queryOneTwoCategory(fid);
        request.setAttribute("category",category);
        List<Book> books = bookService.querySplitOneTwoBook(fid, sid, currentPage, pageSize);
        request.setAttribute("list",books);
        request.setAttribute("fid",fid);
        request.setAttribute("sid",sid);
        return "/front/main/book_list1";
    }

    @RequestMapping("queryDetailBook")
    public String queryDetailBook(String id,HttpServletRequest request){
        Book book = bookService.queryDetailBook(id);
        request.setAttribute("book",book);
        return "front/main/book_detail";
    }
}
