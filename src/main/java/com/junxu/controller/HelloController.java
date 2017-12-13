package com.junxu.controller;

import com.junxu.mapper.UserMapper;
import com.junxu.po.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.lang.String;
import java.util.HashMap;
import java.util.Map;


@Controller
@RequestMapping(value = "/hello",method = RequestMethod.GET)
public class HelloController {
    @Autowired
    UserMapper userMapper;

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(User user, ModelMap modelMap){
        modelMap.addAttribute("msg","Hello World!");
        Map<String,Object> map = new HashMap<>();
        map.put("uname",user.getUsername());
        map.put("psw",user.getPassword());

        User user1 = userMapper.checkUserIsExist(map);
        if (user1!=null){
            System.out.println(user1.getUsername());
        }
        return "index";
    }

    @RequestMapping(value = "register",method = RequestMethod.GET)
    public String register(){
        return "register";
    }
}
