package com.haijiaoluntan.dao;

import java.util.List;

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

	List<Article> queryByPlate(String plate);

	List<Article> queryByPlateAndLimit(String plate);
}
