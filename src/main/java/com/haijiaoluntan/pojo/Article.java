package com.haijiaoluntan.pojo;

import java.util.Date;

/**
 * 文章表
 * @author haijiaoluntan
 */
public class Article {
	
	//主键id
	private Long id;
	//文章名字
	private String title;
	//文章内容
	private String comment;
	//文章所属板块
	private String plate;
	//文章点击量
	private Integer clickTimes;
	//文章图片
	private String pictureUrl;
	//文章置顶
	private String top;
	//文章创建时间
	private Date createTime;
	//文章创建人名字
	private String createName;
	//文章创建人id
	private Long createId;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getPlate() {
		return plate;
	}

	public void setPlate(String plate) {
		this.plate = plate;
	}

	public Integer getClickTimes() {
		return clickTimes;
	}

	public void setClickTimes(Integer clickTimes) {
		this.clickTimes = clickTimes;
	}

	public String getPictureUrl() {
		return pictureUrl;
	}

	public void setPictureUrl(String pictureUrl) {
		this.pictureUrl = pictureUrl;
	}

	public String getTop() {
		return top;
	}

	public void setTop(String top) {
		this.top = top;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getCreateName() {
		return createName;
	}

	public void setCreateName(String createName) {
		this.createName = createName;
	}

	public Long getCreateId() {
		return createId;
	}

	public void setCreateId(Long createId) {
		this.createId = createId;
	}

}
