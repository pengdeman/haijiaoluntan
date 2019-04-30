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
		//家有萌宠
		List<Article> jymcList = articleService.queryByPlateAndLimit(getPlate("3"));
		model.addAttribute("jymcList", jymcList);
		//同城交友
		List<Article> tcjyList = articleService.queryByPlateAndLimit(getPlate("4"));
		model.addAttribute("tcjyList", tcjyList);
		//情感天地
		List<Article> qgtdList = articleService.queryByPlateAndLimit(getPlate("5"));
		model.addAttribute("qgtdList", qgtdList);
		//广告位展示
		List<Article> ggwList = articleService.queryByPlateAndLimit(getPlate("6"));
		model.addAttribute("ggwList", ggwList);
		//兼职招聘
		List<Article> jzzpList = articleService.queryByPlateAndLimit(getPlate("1"));
		Article jjzpArticle = new Article();
		if(jzzpList.size() > 0) {
			jjzpArticle.setId(jzzpList.get(0).getId());
			jjzpArticle.setPictureUrl(jzzpList.get(0).getPictureUrl());
			jjzpArticle.setTitle(jzzpList.get(0).getTitle());
			//第一条数据
			model.addAttribute("jjzpArticle", jjzpArticle);
			//除第一条外的其他数据
			jzzpList.remove(0);
			model.addAttribute("jzzpList", jzzpList);
		}else {
			model.addAttribute("jjzpArticle", jjzpArticle);
			model.addAttribute("jzzpList", jzzpList);
		}
		//二手市场
		List<Article> esscList = articleService.queryByPlateAndLimit(getPlate("2"));
		Article esscArticle = new Article();
		if(esscList.size() > 0) {
			esscArticle.setId(esscList.get(0).getId());
			esscArticle.setPictureUrl(esscList.get(0).getPictureUrl());
			esscArticle.setTitle(esscList.get(0).getTitle());
			//第一条数据
			model.addAttribute("esscArticle", esscArticle);
			//除第一条外的其他数据
			esscList.remove(0);
			model.addAttribute("esscList", esscList);
		}else {
			model.addAttribute("esscArticle", esscArticle);
			model.addAttribute("esscList", esscList);
		}
		//热点新闻
		List<Article> rdxwList = articleService.queryByPlateAndLimit(getPlate("0"));
		Article rdxwArticle = new Article();
		if(rdxwList.size() > 0) {
			rdxwArticle.setId(rdxwList.get(0).getId());
			rdxwArticle.setPictureUrl(rdxwList.get(0).getPictureUrl());
			rdxwArticle.setTitle(rdxwList.get(0).getTitle());
			rdxwArticle.setComment(rdxwList.get(0).getComment());
			//第一条数据
			model.addAttribute("rdxwArticle", rdxwArticle);
			//除第一条外的其他数据
			rdxwList.remove(0);
			model.addAttribute("rdxwList", rdxwList);
		}else {
			model.addAttribute("rdxwArticle", rdxwArticle);
			model.addAttribute("rdxwList", rdxwList);
		}
		
		return "index";
	}
	
	/**
	 * 权限管理
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/permison")
	public String permison(HttpServletRequest request, Model model) {
		User user= (User) request.getSession().getAttribute("login_user");
    	if(user == null) {
    		model.addAttribute("messge", "登录过期，请重新登录！");
			return "index";
    	}
		model.addAttribute("type", "7");
		List<User> userList = userService.findAll();
		model.addAttribute("userList", userList);
		return "permison";
	}
	
	/**
	 * 设置用户板块
	 * @return
	 */
	@RequestMapping("/modifyplate")
	public String modifyPlate(HttpServletRequest request, Model model) {
		User user= (User) request.getSession().getAttribute("login_user");
    	if(user == null) {
    		model.addAttribute("messge", "登录过期，请重新登录！");
			return "index";
    	}
		String platem = request.getParameter("platem");
		String userid = request.getParameter("userid");
		User users = userService.getUserById(Integer.parseInt(userid));
		users.setPlate(platem);
		userService.updateSelective(users);
		return "redirect:/permison";
	}
	
	/**
	 * 删除账号
	 * @return
	 */
	@RequestMapping("/deleteuser")
	public String deleteUser(HttpServletRequest request) {
		String id = request.getParameter("id");
		userService.deleteByPrimaryKey(Integer.parseInt(id));
		return "redirect:/permison";
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
//    	String type = request.getParameter("type");
//    	String result = request.getParameter("result");
//    	String top = request.getParameter("top");
//    	String del = request.getParameter("del");
//    	if(result != null) {
//    		model.addAttribute("messge", "发布成功！");
//    		type = result;
//    	}
//    	if(top != null) {
//    		model.addAttribute("messge", "置顶成功！");
//    		type = top;
//    	}
//    	if(del != null) {
//    		model.addAttribute("messge", "删除成功！");
//    		type = del;
//    	}
//    	model.addAttribute("type", type);
//		String plate = getPlate(type);
//		model.addAttribute("plate", plate);
//    	List<Article> articleList = articleService.queryByPlate(plate);
//    	model.addAttribute("articleList", articleList);
    	return "picture_public";
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
     * 文字列表页面
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/textlist")
    public String textList(HttpServletRequest request, Model model) {
    	String type = request.getParameter("type");
    	String result = request.getParameter("result");
    	String top = request.getParameter("top");
    	String del = request.getParameter("del");
    	String cancel = request.getParameter("cancel");
    	if(result != null) {
    		model.addAttribute("messge", "发布成功！");
    		type = result;
    	}
    	if(top != null) {
    		model.addAttribute("messge", "置顶成功！");
    		type = top;
    	}
    	if(del != null) {
    		model.addAttribute("messge", "删除成功！");
    		type = del;
    	}
    	if(cancel != null) {
    		model.addAttribute("messge", "取消置顶成功！");
    		type = cancel;
    	}
    	model.addAttribute("type", type);
    	String plate = getPlate(type);
    	model.addAttribute("plate", plate);
    	
    	//分页相关
    	String pagenumber = request.getParameter("pagenumber");
    	String pagetype = request.getParameter("pagetype");
    	//页码 0 1 2 3 4
    	Integer pageNumber = 0;
    	//岂止页
    	Integer offSet = 0;
    	if(pagenumber != null){
    		//当前页码
    		Integer pagenum = Integer.parseInt(pagenumber);//0
    		//向前翻页
    		if("older".equals(pagetype)) {
    			offSet = (pagenum-1)*10;
    			pageNumber = pagenum - 1;
    		//向后翻页
    		}else if("newer".equals(pagetype)) {
    			offSet = (pagenum+1)*10;
    			pageNumber = pagenum + 1;
    		}
    	}
    	//查询本次分页信息
    	List<Article> articleList = articleService.queryByPlate(plate, offSet);
    	model.addAttribute("articleList", articleList);
    	
    	//查询下页是否有数据
        Integer nextpagenum = pagenumber==null?0:Integer.parseInt(pagenumber);
        Integer nextoffSet = (nextpagenum+2)*10;
        List<Article> nextarticleList = articleService.queryByPlate(plate, nextoffSet);
        if(nextarticleList.size() == 0) {
        	model.addAttribute("nextpage", 0);
        }
        
    	model.addAttribute("pageNumber", pageNumber);
    
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
    	article.setClickTimes(article.getClickTimes()+1);
    	articleService.updateSelective(article);
    	model.addAttribute("article", article);
    	return "detail";
    }
    
    /**
     * 取消置顶
     * @param request
     * @return
     */
    @RequestMapping("/canceltoparticle")
    public String cancelTopArticle(HttpServletRequest request, Model model) {
    	User user= (User) request.getSession().getAttribute("login_user");
    	if(user == null) {
    		model.addAttribute("messge", "登录过期，请重新登录！");
			return "index";
    	}
    	String id = request.getParameter("id");
    	Article article = articleService.selectByPrimaryKey(Integer.parseInt(id));
    	article.setTop("0");
    	articleService.updateSelective(article);
    	String plate = article.getPlate();
    	if("热点新闻".equals(plate)) {
			return "redirect:/textlist?cancel=0";
		}else if("兼职招聘".equals(plate)){
			return "redirect:/textlist?cancel=1";
		}else if("二手市场".equals(plate)){
			return "redirect:/textlist?cancel=2";
		}else if("家有萌宠".equals(plate)){
			return "redirect:/textlist?cancel=3";
		}else if("同城交友".equals(plate)){
			return "redirect:/textlist?cancel=4";
		}else if("情感天地".equals(plate)){
			return "redirect:/textlist?cancel=5";
		}else if("广告位展示".equals(plate)){
			return "redirect:/textlist?cancel=6";
		}
		return "redirect:/index";
    }
    
    /**
     * 置顶
     * @param request
     * @return
     */
    @RequestMapping("/toparticle")
    public String topArticle(HttpServletRequest request, Model model) {
    	User user= (User) request.getSession().getAttribute("login_user");
    	if(user == null) {
    		model.addAttribute("messge", "登录过期，请重新登录！");
			return "index";
    	}
    	String id = request.getParameter("id");
    	Article article = articleService.selectByPrimaryKey(Integer.parseInt(id));
    	article.setTop("1");
    	articleService.updateSelective(article);
    	String plate = article.getPlate();
    	if("热点新闻".equals(plate)) {
			return "redirect:/textlist?top=0";
		}else if("兼职招聘".equals(plate)){
			return "redirect:/textlist?top=1";
		}else if("二手市场".equals(plate)){
			return "redirect:/textlist?top=2";
		}else if("家有萌宠".equals(plate)){
			return "redirect:/textlist?top=3";
		}else if("同城交友".equals(plate)){
			return "redirect:/textlist?top=4";
		}else if("情感天地".equals(plate)){
			return "redirect:/textlist?top=5";
		}else if("广告位展示".equals(plate)){
			return "redirect:/textlist?top=6";
		}
		return "redirect:/index";
    }
    
    /**
     * 删除文章
     * @param request
     * @return
     */
    @RequestMapping("/deletearticle")
    public String deleteArticle(HttpServletRequest request) {
    	String id = request.getParameter("id");
    	Article article = articleService.selectByPrimaryKey(Integer.parseInt(id));
    	articleService.deleteByPrimaryKey(Integer.parseInt(id));
    	String plate = article.getPlate();
    	if("热点新闻".equals(plate)) {
			return "redirect:/textlist?del=0";
		}else if("兼职招聘".equals(plate)){
			return "redirect:/textlist?del=1";
		}else if("二手市场".equals(plate)){
			return "redirect:/textlist?del=2";
		}else if("家有萌宠".equals(plate)){
			return "redirect:/textlist?del=3";
		}else if("同城交友".equals(plate)){
			return "redirect:/textlist?del=4";
		}else if("情感天地".equals(plate)){
			return "redirect:/textlist?del=5";
		}else if("广告位展示".equals(plate)){
			return "redirect:/textlist?del=6";
		}
		return "redirect:/index";
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
		//新增发帖文章
		articleService.insert(article);
		//更新发帖等级
		user.setLevel(user.getLevel()+1);
		userService.updateSelective(user);
		//返回具体页面
		if("热点新闻".equals(plate)) {
			return "redirect:/textlist?result=0";
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
			return "redirect:/textlist?result=6";
		}
    	return "redirect:/index";
    }
	
}
