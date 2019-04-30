package com.haijiaoluntan.sereviceImpl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.haijiaoluntan.dao.IUserDao;
import com.haijiaoluntan.pojo.User;
import com.haijiaoluntan.service.IUserService;

/**
 * 用户service实现类层
 * 
 * @author haijiaoluntan
 */
@Service  
public class UserServiceImpl implements IUserService {  
	
    @Resource  
    private IUserDao userDao;  
    
    /**
     * 通过用户id查询用户信息
     * @param userId
     * @return
     */
    @Override  
    public User getUserById(int userId) {  
        return this.userDao.selectByPrimaryKey(userId);  
    }
    
    /**
     * 通过登录账号和密码查询用户信息
     * @param account
     * @param password
     * @return
     */
	@Override
	public User findUserByAccountAndPassword(String account, String password) {
		User user = new User();
		user.setAccount(account);
		user.setPassword(password);
		return this.userDao.findUserByAccountAndPassword(user);
	}
	
	/**
	 * 通过用户名查询用户信息
	 * @param userName
	 * @param mail
	 * @return
	 */
	@Override
	public List<User> findName(String name, String account) {
		User user = new User();
		user.setName(name);
		user.setAccount(account);
		return this.userDao.findName(user);
	}
	
	/**
	 * 插入用户信息
	 * @param user
	 */
	@Override
	public void insert(User user) {
		this.userDao.insert(user);
	}
	
	/**
	 * 更新用户信息
	 * @param user
	 */
	@Override
	public void updateSelective(User user) {
		this.userDao.updateByPrimaryKeySelective(user);
	}
	
	/**
	 * 查询用户列表
	 * @return
	 */
	@Override
	public List<User> findAll() {
		return this.userDao.findAll();
	}

	/**
	 * 删除用户
	 */
	@Override
	public void deleteByPrimaryKey(int id) {
		userDao.deleteByPrimaryKey(id);
	}  
} 