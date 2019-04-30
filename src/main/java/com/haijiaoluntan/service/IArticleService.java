package com.haijiaoluntan.service;

import java.util.List;

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

	/**
	 * 通过板块查信息
	 * @param type
	 */
	public List<Article> queryByPlate(String plate, Integer pagenumber);

	/**
	 * 通过板块查信息 带分页
	 * @param string
	 * @return
	 */
	public List<Article> queryByPlateAndLimit(String plate);
}
