package com.junxu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/articles")
public class ArticleController {
    @RequestMapping(value = "/article")
    public String getArticle(){
        return "article";
    }
}
