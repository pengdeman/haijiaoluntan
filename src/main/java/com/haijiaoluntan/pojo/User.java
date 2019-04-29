package com.haijiaoluntan.pojo;

import java.util.Date;

/**
 * 用户表
 * @author haijiaoluntan
 */
public class User {
	//主键id
	private Long id;
	//登录账号
	private String account;
	//密码
	private String password;
	//用户名昵称
	private String name;
	//登录时间
	private Date loginTime;
	//用户等级
	private Integer level;
	//板块（哪个板块的版主）
	private String plate;
	//创建时间
	private Date createTime;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getLoginTime() {
		return loginTime;
	}

	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public String getPlate() {
		return plate;
	}

	public void setPlate(String plate) {
		this.plate = plate;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

}
