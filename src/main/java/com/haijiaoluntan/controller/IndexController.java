package com.haijiaoluntan.controller;

import java.util.Arrays;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import com.haijiaoluntan.pojo.User;
import com.haijiaoluntan.service.IUserService;
import com.haijiaoluntan.utils.NormalUtils;

@Controller
@RequestMapping("/")
public class IndexController {
	
	@Resource
	private IUserService userService;

	/**
	 * 首页展示
	 * @param request
	 * @return
	 */
	@RequestMapping("/index")
	public String index(HttpServletRequest request){
		return "index";
	}
	
	/**
	 * 用户注册
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/register")
	public String register(HttpServletRequest request, Model model) {
		MultipartHttpServletRequest reques = (MultipartHttpServletRequest) request;
		//昵称
		String name = request.getParameter("name");
		//邮箱
		String account = request.getParameter("account");
		//密码
		String password = request.getParameter("password");
		//校验昵称不能为数字
		boolean isNum = name.matches("[0-9]+");
		if(isNum){
			model.addAttribute("messge", "您的大名不能都为数字！");
			return "index";
		}
		List<User> userList = userService.findName(name, account);
		if(userList.size()>0){
			model.addAttribute("messge", "昵称或账号已存在，请重新输入！");
			return "index";
		}
		User user = new User();
		user.setName(name);
		user.setLevel(0);
		user.setAccount(account);
		user.setPassword(password);
		user.setLoginTime(new Date());
		user.setCreateTime(new Date());
		String[] types = {"JPG", "PNG", "JPEG", "GIF", "JEPG"};
		try {
			String[] newfileName = NormalUtils.syqpicdownUrl(reques, "picurl","picName");
			if (newfileName != null) {
				//判断图片类型
		        if (!Arrays.asList(types).contains(newfileName[0].substring(newfileName[0].lastIndexOf(".")+1).toUpperCase())) {
		        	model.addAttribute("messge", "头像照片格式只支持png、jpg！");
					return "index";
		        }
		        user.setPicurl(newfileName[1]);
			} else {
				model.addAttribute("messge", "请上传您的头像！");
				return "index";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		userService.insert(user);
		return "redirect:/index";
	}
	
	/**
	 * 用户登录
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping("/login")
	public String login(HttpServletRequest request, HttpServletResponse response, Model model) {
		String account = request.getParameter("login_account");
		String password = request.getParameter("login_password");
		User user = userService.findUserByAccountAndPassword(account, password);
		if(user != null) {
			//更新登录时间
			user.setLoginTime(new Date());
			userService.updateSelective(user);
			HttpSession session = request.getSession();
	        session.setAttribute("login_user", user);
	        return "redirect:/index";
		}else {
			model.addAttribute("messge", "密码或登录名错误，请检查后重新输入！");
			return "index";
		}
	}
	
	/**
     * 登出
     * @param request
     * @return
     */
    @RequestMapping("/loginout")
    public String loginout(HttpServletRequest request){
        request.getSession().removeAttribute("login_user");
        return "redirect:/index";
    }
	
}
