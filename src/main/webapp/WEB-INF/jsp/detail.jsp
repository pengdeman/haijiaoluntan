<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    String path = request.getContextPath();
    String basePath =
            request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                    + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>🌊海角论坛</title>
<link href="bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet">
<link href="css/css.css" type="text/css" rel="stylesheet" />
</head>

<body>
<!-- 头 -->
<%@ include file="head.jsp"%>
<!-- 主体 -->
<div id="wrapp" class="fix">
	<div class="news-main">
		<div class="bread">
			当前位置：<a>首页</a> - 详情展示 
		</div>
		<div class="news-article">
			<h6>${article.title }</h6>
			<p class="time"><span>时间： <fmt:formatDate value="${article.createTime }" pattern="yyyy-MM-dd"></fmt:formatDate></span><span>发布人：${article.createName }</span></p>
			
			<img style="width: 600px; height: 300px;" src="pic/${article.pictureUrl }">
			<br>
			<br>
			<p>
				${article.comment }
			</p>
		</div>
	</div>
</div>
<!-- footer -->
<%@ include file="foot.jsp"%>
</body>
</html>
