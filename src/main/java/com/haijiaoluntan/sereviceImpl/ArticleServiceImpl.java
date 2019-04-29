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
	public List<Article> queryByPlate(String type) {
		String plate = getPlate(type);
		return articleDao.queryByPlate(plate);
	}

	private String getPlate(String type) {
		String plate = "";
		if("0".equals(type)) {
			plate = "热点新闻";
		}else if("1".equals(type)) {
			plate = "兼职招聘";
		}else if("2".equals(type)) {
			plate = "二手市场";
		}else if("3".equals(type)) {
			plate = "家有萌宠";
		}else if("4".equals(type)) {
			plate = "同城交友";
		}else if("5".equals(type)) {
			plate = "情感天地";
		}else if("6".equals(type)) {
			plate = "广告位展示";
		}
		return plate;
	}

	/**
	 * 通过板块查询信息 带分页
	 */
	@Override
	public List<Article> queryByPlateAndLimit(String type) {
		String plate = getPlate(type);
		return articleDao.queryByPlateAndLimit(plate);
	}

}
