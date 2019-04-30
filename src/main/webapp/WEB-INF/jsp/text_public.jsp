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
	<div class="newslist-left">	
		<div class="newslist-box">
			<div class="boxtitle fix">
				<h6>个人中心</h6>
				<span></span>
			</div>
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
							<tr>
								<td style="white-space: nowrap;"><strong>签名:</strong></td>
								<td colspan="3">纸上得来终觉浅，觉知此时要躬行。</td>
							</tr>
						</table>
					</div>	
					<c:if test="${login_user != null}">
						<div style="text-align: center; margin-bottom: 10px;">
          					<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#infoModal">发布信息</button>
        				</div>
					</c:if>
		</div>
	</div>
	<div class="newslist-right">
		<div class="bread">
			当前位置：<a>首页</a> - 
			<c:if test="${type eq 0}">
			热点新闻
			</c:if>
			<c:if test="${type eq 1}">
			兼职招聘
			</c:if>
			<c:if test="${type eq 2}">
			二手市场
			</c:if>
			<c:if test="${type eq 3}">
			家有萌宠
			</c:if>
			<c:if test="${type eq 4}">
			同城交友
			</c:if>
			<c:if test="${type eq 5}">
			情感天地
			</c:if>
			<c:if test="${type eq 6}">
			广告位展示
			</c:if>
		</div>
		<ul class="newslist-ul fix">
			<c:forEach items="${articleList}" var="item">
				<li>
					<c:if test="${login_user != null}">
						<c:if test="${login_user.account eq 'admin' || login_user.plate eq plate}">
							<span>
								<label onclick="deletearticle(${item.id })">删除</label> | 
								<c:if test="${item.top eq '1'}">
									<label onclick="canceltoparticle(${item.id })" style="color: red;">取消置顶</label>
								</c:if>
								<c:if test="${item.top != '1'}">
									<label onclick="toparticle(${item.id })">置顶</label> 
								</c:if>
							</span>
						</c:if>
					</c:if>
					<span style="margin-left: 30px;"> [<fmt:formatDate value="${item.createTime }" pattern="yyyy-MM-dd"></fmt:formatDate>]</span>
					<a href="<%=basePath%>godetails?id=${item.id }" target="_blank"><c:if test="${item.top eq '1'}"><img width="15px;" style="margin-bottom: 5px;" src="images/huo.png"><label style="color: red;">[置顶]</label>&nbsp;&nbsp;</c:if> ${item.title }</a>
				</li>
			</c:forEach>
		</ul>
		<!--  disabled -->
		<ul class="pager">
			<c:if test="${pageNumber == 0}">
				<li class="previous disabled"><a>&larr; Older</a></li>
			</c:if>
			<c:if test="${pageNumber != 0}">
				<li class="previous"><a href="<%=basePath%>textlist?type=${type}&pagenumber=${pageNumber}&pagetype=older">&larr; Older</a></li>
			</c:if>
			<c:if test="${nextpage == 0}">
				<li class="next disabled"><a>Newer &rarr;</a></li>
			</c:if>
			<c:if test="${nextpage != 0}">
				<li class="next"><a href="<%=basePath%>textlist?type=${type}&pagenumber=${pageNumber}&pagetype=newer">Newer &rarr;</a></li>
			</c:if>
		</ul>
	</div>
</div>
<!-- footer -->
<%@ include file="foot.jsp"%>
</body>
</html>
