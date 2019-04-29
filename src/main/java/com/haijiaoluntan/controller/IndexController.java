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

import com.haijiaoluntan.pojo.Article;
import com.haijiaoluntan.pojo.User;
import com.haijiaoluntan.service.IArticleService;
import com.haijiaoluntan.service.IUserService;
import com.haijiaoluntan.utils.NormalUtils;

@Controller
@RequestMapping("/")
public class IndexController {
	
	@Resource
	private IUserService userService;
	@Resource
	private IArticleService articleService;

	/**
	 * 首页展示
	 * @param request
	 * @return
	 */
	@RequestMapping("/index")
	public String index(HttpServletRequest request, Model model){
		model.addAttribute("type", "8");
		//家有萌宠、同城交友、情感天地
		List<Article> jymcList = articleService.queryByPlateAndLimit("3");
		List<Article> tcjyList = articleService.queryByPlateAndLimit("4");
		List<Article> qgtdList = articleService.queryByPlateAndLimit("5");
		model.addAttribute("jymcList", jymcList);
		model.addAttribute("tcjyList", tcjyList);
		model.addAttribute("qgtdList", qgtdList);
		
		
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
    
    /**
     * 图片列表页面
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/picturelist")
    public String pictureList(HttpServletRequest request, Model model) {
    	String type = request.getParameter("type");
    	String result = request.getParameter("result");
    	model.addAttribute("type", type);
    	if(result != null) {
    		model.addAttribute("messge", "发布成功！");
    		model.addAttribute("type", result);
    		type = result;
    	}
    	List<Article> articleList = articleService.queryByPlate(type);
    	model.addAttribute("articleList", articleList);
    	return "picture_public";
    }
    
    /**
     * 文字列表页面
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/textlist")
    public String textList(HttpServletRequest request, Model model) {
    	String type = request.getParameter("type");
    	String result = request.getParameter("result");
    	model.addAttribute("type", type);
    	if(result != null) {
    		model.addAttribute("messge", "发布成功！");
    		model.addAttribute("type", result);
    		type = result;
    	}
    	List<Article> articleList = articleService.queryByPlate(type);
    	model.addAttribute("articleList", articleList);
    	return "text_public";
    }
    
    /**
     * 跳到文章详情
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/godetails")
    public String goDetails(HttpServletRequest request, Model model) {
    	String id = request.getParameter("id");
    	Article article = articleService.selectByPrimaryKey(Integer.parseInt(id));
    	model.addAttribute("article", article);
    	return "detail";
    }
    
    /**
     * 信息发布
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/submitarticle")
    public String submitarticle(HttpServletRequest request, Model model) {
    	User user= (User) request.getSession().getAttribute("login_user");
    	if(user == null) {
    		model.addAttribute("messge", "未登录不能发布！");
			return "index";
    	}
    	MultipartHttpServletRequest reques = (MultipartHttpServletRequest) request;
    	String title = request.getParameter("title");//标题
        String comment = request.getParameter("comment");//文字
        String plate = request.getParameter("plate");//板块
        Article article = new Article();
        article.setClickTimes(0);
        article.setComment(comment);
        article.setPlate(plate);
        article.setTitle(title);
        article.setTop("0");
        article.setCreateTime(new Date());
        article.setCreateId(user.getId());
        article.setCreateName(user.getName());
        String[] types = {"JPG", "PNG", "JPEG", "GIF", "JEPG"};
		try {
			String[] newfileName = NormalUtils.syqpicdownUrl(reques, "pictureurl","");
			if (newfileName != null) {
				//判断图片类型
		        if (!Arrays.asList(types).contains(newfileName[0].substring(newfileName[0].lastIndexOf(".")+1).toUpperCase())) {
		        	model.addAttribute("messge", "照片格式只支持png、jpg、jpeg、gif！");
					return "index";
		        }
		        article.setPictureUrl(newfileName[1]);
			} else {
				model.addAttribute("messge", "发布信息失败，请上传您的照片！");
				return "index";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		articleService.insert(article);
		if("热点新闻".equals(plate)) {
			return "redirect:/picturelist?result=0";
		}else if("兼职招聘".equals(plate)){
			return "redirect:/textlist?result=1";
		}else if("二手市场".equals(plate)){
			return "redirect:/textlist?result=2";
		}else if("家有萌宠".equals(plate)){
			return "redirect:/textlist?result=3";
		}else if("同城交友".equals(plate)){
			return "redirect:/textlist?result=4";
		}else if("情感天地".equals(plate)){
			return "redirect:/textlist?result=5";
		}else if("广告位展示".equals(plate)){
			return "redirect:/picturelist?result=6";
		}
    	return "redirect:/index";
    }
	
}
