<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<div id="head">
	<h1>
		<a href="index.html" style="font-size: 40px; color:white; margin-top: -35px; margin-left: -10px; font-family: YouYuan;">
		🌊 海 角 论 坛</a><br>
		<a style="margin-top: -280px; color:white;">    
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;hai    
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;jiao    
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;lun    
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;tan</a>
	</h1>
	<div class="headbox">
		<c:if test="${login_user == null}">
			<a href="#" class="register" data-toggle="modal" data-target="#registModal">注册</a>
			<a href="#" class="login" data-toggle="modal" data-target="#loginModal">登录</a>
		</c:if>
		<c:if test="${login_user != null}">
			<a class="login" onclick="tuichu()" data-target="#loginModal">登出</a>
		</c:if>
	</div>
</div>
<!-- nav -->
<div id="nav">
	<div class="nav-box fix">
		<ul>
			<li class="on"><a href="#">网站首页 </a></li>
			<li class="line"></li>
			<li><a href="#">热点新闻</a></li>
			<li class="line"></li>
			<li><a href="#">兼职招聘</a></li>
			<li class="line"></li>
			<li><a href="#">二手市场</a></li>
			<li class="line"></li>
			<li><a href="#">家有萌宠</a></li>
			<li class="line"></li>
			<li><a href="#">同城交友</a></li>
			<li class="line"></li>
			<li><a href="#">情感天地</a></li>
			<li class="line"></li>
			<li><a href="#">广告位展示</a></li>
			<c:if test="${login_user.account eq 'admin'}">
				<li class="line"></li>
				<li><a href="#">权限管理</a></li>
			</c:if>
		</ul>
	</div>
</div>
