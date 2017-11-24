package com.junxu.controller;

import com.junxu.mapper.UserMapper;
import com.junxu.po.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.lang.String;
import java.util.HashMap;
import java.util.Map;


@Controller
@RequestMapping(value = "/hello",method = RequestMethod.GET)
public class HelloController {
    @Autowired
    UserMapper userMapper;
    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String printHello(User user,ModelMap modelMap){
        modelMap.addAttribute("msg","Hello World!");
        Map<String,Object> map = new HashMap<>();
        map.put("username",user.getUsername());
        map.put("password",user.getPassword());

        User user1 = userMapper.checkUserIsExist(map);
        System.out.println(user1.getUsername());
        return "indexHello";
    }
    @RequestMapping(value = "login",method = RequestMethod.GET)
    public String login(){
        return "login";
    }

    @RequestMapping(value = "register",method = RequestMethod.GET)
    public String register(){
        return "register";
    }
}
