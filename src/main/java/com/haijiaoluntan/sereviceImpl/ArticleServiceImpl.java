package com.haijiaoluntan.sereviceImpl;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.haijiaoluntan.dao.IArticleDao;
import com.haijiaoluntan.pojo.Article;
import com.haijiaoluntan.service.IArticleService;

/**
 * 文章service实现类层
 * 
 * @author haijiaoluntan
 */
@Service 
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

	/**
	 * 通过板块查询信息
	 */
	@Override
	public List<Article> queryByPlate(String plate, Integer pagenumber) {
		Article article = new Article();
		article.setPlate(plate);
		article.setPageNumber(pagenumber);
		return articleDao.queryByPlate(article);
	}

	/**
	 * 通过板块查询信息 带分页
	 */
	@Override
	public List<Article> queryByPlateAndLimit(String plate) {
		return articleDao.queryByPlateAndLimit(plate);
	}

}
