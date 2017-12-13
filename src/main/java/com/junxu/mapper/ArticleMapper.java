package com.junxu.mapper;

import com.junxu.po.Article;
import com.junxu.po.User;

import java.util.List;
import java.util.Map;

public interface ArticleMapper {
    List<Article> findAllArticles();
}
