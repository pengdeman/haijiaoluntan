package com.haijiaoluntan.dao;

import java.util.List;
import com.haijiaoluntan.pojo.User;

/**
 * 用户dao层
 * 
 * @author haijiaoluntan
 */
public interface IUserDao {
	int deleteByPrimaryKey(Integer id);

    int insert(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User user);

	User findUserByAccountAndPassword(User user);

	List<User> findName(User record);

	List<User> findAll();
}