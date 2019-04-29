package com.haijiaoluntan.dao;

import com.haijiaoluntan.pojo.Article;

/**
 * 文章dao层
 * 
 * @author haijiaoluntan
 */
public interface IArticleDao {
	
	void insert(Article article);
	
	Article selectByPrimaryKey(Integer id);

	void updateSelective(Article article);

	void deleteByPrimaryKey(Integer id);
}
