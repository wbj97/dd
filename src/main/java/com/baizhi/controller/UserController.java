package com.baizhi.controller;

import com.baizhi.dao.UserDao;
import com.baizhi.entity.User;
import com.baizhi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController  {
    @Autowired
    UserService userService;
//    查所有用户
    @RequestMapping("/queryByAll")
    public String queryByAll(HttpServletRequest request){
        List<User> users = userService.queryByAll();
        request.setAttribute("list",users);
        return "back/user/show";
    }
//修改用户状态
    @RequestMapping("modifyUserStatus")
    public String modifyUserStatus(String id){
        User user = userService.queryById(id);
        if(user.getStatus().equals("0"))
            user.setStatus("1");
        else if(user.getStatus().equals("1"))
            user.setStatus("0");
        userService.modifyUser(user);
        return "redirect:/user/queryByAll";
    }
}
