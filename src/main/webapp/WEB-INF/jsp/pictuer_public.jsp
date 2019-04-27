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
<link href="css/css.css" type="text/css" rel="stylesheet" />
</head>

<body>
<!-- 头 -->
<%@ include file="head.jsp"%>
<!-- 主体 -->
<div id="wrap" class="fix">
	<div class="newslist-left">	
		<div class="newslist-box">
			<div class="boxtitle fix">
				<h6>协会信息</h6>
				<span></span>
			</div>
			<ul>
				<li>
					<a href="#">我国继续实施棉花目标价格改革试点</a>
				</li>
				<li>
					<a href="#">“十三五”我国水利扶贫重点出台</a>
				</li>
				<li>
					<a href="#">农业部打造农产品宅连配云商平台</a>
				</li>
				<li>
					<a href="#">玉米效益下滑 多条出路减损</a>
				</li>
				<li>
					<a href="#">十三五将加大户籍改革 管理目标</a>
				</li>
				<li>
					<a href="#">农业部副部长：全力落实各项支农政策</a>
				</li>
				<li>
					<a href="#">培养农村电商人才 鼓励创业就业</a>
				</li>
				<li>
					<a href="#">十八届五中全会日期确定</a>
				</li>
			</ul>	
		</div>
		<div class="newslist-box">	
			<div class="boxtitle fix">
				<h6>协会信息</h6>
				<span></span>
			</div>
			<ul>
				<li>
					<a href="#">我国继续实施棉花目标价格改革试点</a>
				</li>
				<li>
					<a href="#">“十三五”我国水利扶贫重点出台</a>
				</li>
				<li>
					<a href="#">农业部打造农产品宅连配云商平台</a>
				</li>
				<li>
					<a href="#">玉米效益下滑 多条出路减损</a>
				</li>
				<li>
					<a href="#">十三五将加大户籍改革 管理目标</a>
				</li>
				<li>
					<a href="#">农业部副部长：全力落实各项支农政策</a>
				</li>
				<li>
					<a href="#">培养农村电商人才 鼓励创业就业</a>
				</li>
				<li>
					<a href="#">十八届五中全会日期确定</a>
				</li>
			</ul>
		</div>
	</div>
	<div class="newslist-right">
		<div class="bread">
			当前位置：<a href="#">首页</a> - 分支机构 
		</div>
		<div class="cp-mes">
			<div class="cp-list">
				<h6>便携式气象站设备</h6>
				<img src="images/img/img.jpg">
				<div>设备可应用于温室大棚、大田种植和动物养殖等农业生产环境现场信息的实时采集与无线上报，并提供了农业生产环境异常状况的报警功能，能够为农业生产经营管理者实现农业生产现场远程监测、异常状况预警与快速处理提供支撑条件。设备分为便携式微型气象站温和便携式小型气象站两种型号，便携式微型气象站可应用于全国各地的... <a href="#">详情</a></div>
			</div>
			<div class="cp-list">
				<h6>便携式气象站设备</h6>
				<img src="images/img/img.jpg">
				<div>设备可应用于温室大棚、大田种植和动物养殖等农业生产环境现场信息的实时采集与无线上报，并提供了农业生产环境异常状况的报警功能，能够为农业生产经营管理者实现农业生产现场远程监测、异常状况预警与快速处理提供支撑条件。设备分为便携式微型气象站温和便携式小型气象站两种型号，便携式微型气象站可应用于全国各地的... <a href="#">详情</a></div>
			</div>
			<div class="cp-list">
				<h6>便携式气象站设备</h6>
				<img src="images/img/img.jpg">
				<div>设备可应用于温室大棚、大田种植和动物养殖等农业生产环境现场信息的实时采集与无线上报，并提供了农业生产环境异常状况的报警功能，能够为农业生产经营管理者实现农业生产现场远程监测、异常状况预警与快速处理提供支撑条件。设备分为便携式微型气象站温和便携式小型气象站两种型号，便携式微型气象站可应用于全国各地的... <a href="#">详情</a></div>
			</div>
		</div>
		<div class="page">
			总共<span>55</span>页 当前第<span>1</span>/<span>55</span>页
			<a href="#">首页</a>
			<a href="#">上一页</a>
			<a href="#">下一页</a>
			<a href="#">尾页</a>
			<span>8</span>篇文章/页
			<select>
				<option>跳至</option>
				<option>1</option>
				<option>2</option>
				<option>3</option>
				<option>4</option>
				<option>5</option>
			</select>
		</div>
	</div>
</div>
<!-- footer -->
<%@ include file="foot.jsp"%>
</body>
</html>
