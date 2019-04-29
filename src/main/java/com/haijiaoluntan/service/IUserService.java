package com.haijiaoluntan.service;

import java.util.List;
import org.springframework.transaction.annotation.Transactional;
import com.haijiaoluntan.pojo.User;

/**
 * 用户表service层
 * 
 * @author haijiaoluntan
 */
@Transactional
public interface IUserService {
	
	public User getUserById(int userId);

	public User findUserByAccountAndPassword(String loginName, String password);

	public List<User> findName(String loginName);

	public void insert(User lg);  
	
	public void updateSelective(User user);

	public List<User> findAll();
}
