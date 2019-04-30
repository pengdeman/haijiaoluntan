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
<base href="<%=basePath%>">
<title>海角论坛</title>
<link href="bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet">
<link href="css/css.css" type="text/css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="layer/mobile/need/layer.css" />
<style>
      .fakeimg {
        height: 160px;
        background: #aaa;
        background-repeat:no-repeat;
        background-size:100% 100%;
        -moz-background-size:100% 100%;
      }
</style>
</head>
<body>
<!-- 头 -->
<%@ include file="head.jsp"%>
<!-- 主体 -->
<div id="wrapp" class="fix">
	<!-- 新闻-图片 -->
	<div class="fix bd rdxw">
		<div id="img" class="bd">
			<div class="imgbox">
				<!-- 大图 -->
				<div class="imgbig">
					<ul>
						<li>
							<a href="<%=basePath%>godetails?id=${rdxwArticle.id }">
								<img src="pic/${rdxwArticle.pictureUrl }" alt="${rdxwArticle.title }">
							</a>
						</li>
						<c:forEach items="${rdxwList }" var="item">
							<li>
								<a href="<%=basePath%>godetails?id=${item.id }">
									<img src="pic/${item.pictureUrl }"  alt="${item.title }">
								</a>
							</li>
						</c:forEach>
					</ul>
				</div>	
				<!-- 小图 -->	
				<div class="imgsmall">
					<ul>
						<li class="on">
							<img src="pic/${rdxwArticle.pictureUrl }">
						</li>
						<c:forEach items="${rdxwList }" var="item">
							<li class="on">
								<img src="pic/${item.pictureUrl }">
							</li>
						</c:forEach>
					</ul>
				</div>
				<!-- 图片描述 -->
				<div class="img-title">
					<p></p>
				</div>
				<span class="btn-left imgbtn"><img src="images/left.png"></span>
				<span class="btn-right imgbtn"><img src="images/right.png"></span>
			</div>
		</div>
		<!-- 热点新闻 -->
		<div class="hot-news">
			<div class="hotNews-title">
				<h6>热点新闻</h6>
				<a href="<%=basePath%>textlist?type=0">更多</a>
			</div>
			<div class="hotNews-txt">
				<div class="hotNews-top">
					<div class="news-img bd">
						<a href="<%=basePath%>godetails?id=${rdxwArticle.id }"><img src="pic/${rdxwArticle.pictureUrl }"></a>
					</div>
					<h6><a href="<%=basePath%>godetails?id=${rdxwArticle.id }">${rdxwArticle.title }</a></h6>
					<p>${rdxwArticle.comment }</p>
				</div>
				<ul>
					<c:forEach items="${rdxwList }" var="item">
						<li>
							<span><fmt:formatDate value="${item.createTime }" pattern="yyyy-MM-dd"></fmt:formatDate></span>
							<a href="<%=basePath%>godetails?id=${item.id }"target="_blank">${item.title}</a>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<!-- 个人信息 -->
	<div class="tzdl">
		<!-- 个人信息 -->
		<div class="notice-box">
			<img src="images/notice_1.png">
				<div class="notice-main bd">
					<div>
						<c:if test="${login_user == null }">
							<div class="fakeimg" style="background-image: url('images/wxr.png');"></div>
						</c:if>
						<c:if test="${login_user != null }">
							<c:if test="${login_user.account eq 'admin' }">
								<div class="fakeimg" style="background-image: url('images/admin.png');"></div>
							</c:if>
							<c:if test="${login_user.account != 'admin' }">
								<div class="fakeimg" style="background-image: url('pic/${login_user.picurl }');"></div>
							</c:if>
						</c:if>
					</div>
					<div class="panel panel-default">
						<table class="table">
							<tr>
								<td colspan="4" style="text-align: center;">
									<span class="glyphicon glyphicon-user"></span> 
									<c:if test="${login_user == null}">
										<strong>匿名游客</strong>&nbsp;&nbsp;
                					</c:if> 
                					<c:if test="${login_user != null}">
										<strong>${login_user.name}</strong>&nbsp;&nbsp;
                					</c:if> 
                				</td>
							</tr>
							<tr>
								<c:if test="${login_user != null}">
									<c:if test="${login_user.account eq 'admin'}">
										<td style="white-space: nowrap;"><strong>等级:</strong></td>
										<td>9999+</td>
										<td style="white-space: nowrap;"><strong>版主:</strong></td>
										<td style="white-space: nowrap;">超级版主</td>
									</c:if>
									<c:if test="${login_user.account != 'admin'}">
										<td style="white-space: nowrap;"><strong>等级:</strong></td>
										<td>${login_user.level}</td>
										<c:if test="${login_user.plate == null }">
											<td style="white-space: nowrap;"><strong>版主:</strong></td>
											<td>无</td>
										</c:if>
										<c:if test="${login_user.plate != null }">
											<td style="white-space: nowrap;"><strong>版主:</strong></td>
											<td>${login_user.plate}</td>
										</c:if>
									</c:if>
								</c:if>
								<c:if test="${login_user == null}">
									<td style="white-space: nowrap;"><strong>等级:</strong></td>
									<td>无</td>
									<td style="white-space: nowrap;"><strong>版主:</strong></td>
									<td>无</td>
								</c:if>
							</tr>
							<!--  <tr>
								<td style="white-space: nowrap;"><strong>签名:</strong></td>
								<td colspan="3">纸上得来终觉浅，觉知此时要躬行。</td>
							</tr>-->
						</table>
					</div>
				</div>
			</div>
	</div>
	<!-- 兼职招聘 -->
	<div class="hydt bd">
		<div class="boxtitle fix">
			<h6>兼职招聘</h6>
			<a href="<%=basePath%>textlist?type=1">更多</a>
			<span></span>
		</div>
		<div class="box-padding fix">
			<div class="hydt-l">
				<img src="pic/${jjzpArticle.pictureUrl }" style="width: 160px; height: 120px;">
				<a href="<%=basePath%>godetails?id=${jjzpArticle.id }" target="_blank">${jjzpArticle.title }</a>
			</div>
			<ul>
				<c:forEach items="${jzzpList }" var="item">
					<li><a href="<%=basePath%>godetails?id=${item.id }" target="_blank">${item.title}</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<!-- 二手市场 -->
	<div class="hydt bd" style="float:right">
		<div class="boxtitle fix">
			<h6>二手市场</h6>
			<a href="<%=basePath%>textlist?type=2">更多</a>
			<span></span>
		</div>
		<div class="box-padding fix">
			<div class="hydt-l">
				<img src="pic/${esscArticle.pictureUrl }" style="width: 160px; height: 120px;">
				<a href="<%=basePath%>godetails?id=${esscArticle.id }" target="_blank">${esscArticle.title }</a>
			</div>
			<ul>
				<c:forEach items="${esscList}" var="item">
					<li><a href="<%=basePath%>godetails?id=${item.id }" target="_blank">${item.title}</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<!-- 广告位展示 -->
	<div class="eprise-show fix bd">
		<h6><br>广<br>告<br>位<br>展<br>示</h6>
		<div class="showbox fix">
			<div class="showlist">
				<ul>	
					<c:forEach items="${ggwList}" var="item">
						<li onclick="ggw(${item.id })">
							<img src="pic/${item.pictureUrl }" style="width: 175px; height: 120px;">
							<p style="overflow: hidden; text-overflow:ellipsis; white-space: nowrap;">${item.title }</p>
						</li>
					</c:forEach>
				</ul>
			</div>
			<a href="javascript:;" class="prve listbtn"></a>
			<a href="javascript:;" class="next listbtn"></a>
		</div>
	</div>
	<div class="box-list3 fix">
		<!-- 家有萌宠 -->
		<div class="box-list bd">			
			<div class="boxtitle fix">
				<h6>家有萌宠</h6>
				<a href="<%=basePath%>textlist?type=3">更多</a>
				<span></span>
			</div>
			<ul>
				<c:forEach items="${jymcList }" var="item">
					<li><a href="<%=basePath%>godetails?id=${item.id }" target="_blank">${item.title }</a></li>
				</c:forEach>
			</ul>
		</div>
		<!-- 同城交友 -->
		<div class="box-list bd" style="margin-left: 19px;">			
			<div class="boxtitle fix">
				<h6>同城交友</h6>
				<a href="<%=basePath%>textlist?type=4">更多</a>
				<span></span>
			</div>
			<ul>
				<c:forEach items="${tcjyList }" var="item">
					<li><a href="<%=basePath%>godetails?id=${item.id }" target="_blank">${item.title }</a></li>
				</c:forEach>
			</ul>
		</div>
		<!-- 情感天地 -->
		<div class="box-list bd" style="margin-left: 19px;">			
			<div class="boxtitle fix">
				<h6>情感天地</h6>
				<a href="<%=basePath%>textlist?type=5">更多</a>
				<span></span>
			</div>
			<ul>
				<c:forEach items="${qgtdList }" var="item">
					<li><a href="<%=basePath%>godetails?id=${item.id }" target="_blank">${item.title }</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<!-- 友情链接 -->
	<%@ include file="link.jsp"%>
</div>
<!-- footer -->
<%@ include file="foot.jsp"%>
</body>
</html>
