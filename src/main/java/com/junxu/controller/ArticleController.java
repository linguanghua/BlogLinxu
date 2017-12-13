package com.junxu.controller;

import com.junxu.mapper.ArticleMapper;
import com.junxu.po.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping(value = "/articles")
public class ArticleController {

    @Autowired
    ArticleMapper articleMapper;

    @RequestMapping(value = "/article")
    public String getArticle(ModelMap modelMap){
        List<Article> articleList = articleMapper.findAllArticles();
        modelMap.addAttribute("articles",articleList);
        return "article";
    }
}
