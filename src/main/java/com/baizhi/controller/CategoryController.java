package com.baizhi.controller;

import com.baizhi.entity.Category;
import com.baizhi.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/category")
public class CategoryController {
    @Autowired
    CategoryService categoryService;
//查询所有类别
    @RequestMapping("queryByCategory")
    public String queryByCategory(HttpServletRequest request){
        List<Category> categories = categoryService.queryByCategory();
        request.setAttribute("list",categories);
        return "back/category/show";
    }
//添加类别
    @RequestMapping("insertCategory")
    public String insertCategory(String parentId,String cateName){
        Category category = new Category();
//        判断为添加几级类别
        if(parentId==null){
            category.setId(UUID.randomUUID().toString());
            category.setCount("0");
            category.setLevels("1");
            category.setParentId("0");
            category.setCateName(cateName);
        }else{
            category.setId(UUID.randomUUID().toString());
            category.setCount("0");
            category.setLevels("2");
            category.setCateName(cateName);
            category.setParentId(parentId);
        }
        categoryService.insertCategory(category);
        return "redirect:/category/queryByCategory";
    }
//查询所有一级类别
    @RequestMapping("queryAllLevel")
    public String queryAllLevel(HttpServletRequest request){
        List<Category> categories = categoryService.queryAllLevel("1");
        request.setAttribute("list",categories);
        return "back/category/add-second";
    }
//删除类别
    @RequestMapping("removeCategory")
    public String removeCategory(String id,String level,HttpServletRequest request){
        if(level.equals("2")){
            categoryService.removeCategory(id);
        }else{
//            判断该一级类别下的是否还有类别
            if(categoryService.queryByCount(id)==0){
                categoryService.removeCategory(id);
            }else{
                request.setAttribute("message","该类别下还有其他类别");
            }
        }
        return "forward:/category/queryByCategory";
    }

}
