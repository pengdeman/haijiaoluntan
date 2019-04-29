package com.haijiaoluntan.service;

import com.haijiaoluntan.pojo.Article;

/**
 * 文章表service层
 * 
 * @author haijiaoluntan
 */
public interface IArticleService {
	
	public void insert(Article article);
	
	public Article selectByPrimaryKey(Integer id);

	public void updateSelective(Article article);

	public void deleteByPrimaryKey(Integer id);
}
