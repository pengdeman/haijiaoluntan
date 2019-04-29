package com.haijiaoluntan.sereviceImpl;

import javax.annotation.Resource;

import com.haijiaoluntan.dao.IArticleDao;
import com.haijiaoluntan.pojo.Article;
import com.haijiaoluntan.service.IArticleService;

public class ArticleServiceImpl implements IArticleService{

	@Resource  
    private IArticleDao articleDao;
	
	/**
	 * 插入文章
	 */
	@Override
	public void insert(Article article) {
		articleDao.insert(article);
	}

	/**
	 * 查询文章信息
	 */
	@Override
	public Article selectByPrimaryKey(Integer id) {
		return articleDao.selectByPrimaryKey(id);
	}

	/**
	 * 更新点击量
	 */
	@Override
	public void updateSelective(Article article) {
		articleDao.updateSelective(article);
	}

	/**
	 * 删除某个文章
	 */
	@Override
	public void deleteByPrimaryKey(Integer id) {
		articleDao.deleteByPrimaryKey(id);
	}

}
