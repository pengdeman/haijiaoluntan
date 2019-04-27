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
			当前位置：<a href="#">首页</a> - 新闻中心 
		</div>
		<ul class="newslist-ul fix">
			<li>
				<span> [ 2015-11-09 ]</span>
				<a href="#">刘玉明出席农产品地理标志品牌宣传推介活动</a>
			</li>
			<li>
				<span> [ 2015-11-09 ]</span>
				<a href="#">全国百家合作社百个农产品品牌发布 山东六家合作社入选</a>
			</li>
			<li>
				<span> [ 2015-11-09 ]</span>
				<a href="#">第十三届中国国际农产品交易会在福州开幕   </a>
			</li>
			<li>
				<span> [ 2015-11-09 ]</span>
				<a href="#">刘玉明审查山东展区并慰问工作人员</a>
			</li>
			<li>
				<span> [ 2015-11-09 ]</span>
				<a href="#">屈冬玉副部长审查第十三届农交会布展情况</a>
			</li>
			<li>
				<span> [ 2015-11-09 ]</span>
				<a href="#">山东省第三批无公害农产品集中审核暨现场核查工作在菏泽、济宁市进行</a>
			</li>
			<li>
				<span> [ 2015-11-09 ]</span>
				<a href="#">山东展团在第十六届中国绿色食品博览会再获佳绩 </a>
			</li>
			<li>
				<span> [ 2015-11-09 ]</span>
				<a href="#">刘玉明第二次调度第十三届全国农交会我省展团筹备工作 </a>
			</li>
			<li>
				<span> [ 2015-11-09 ]</span>
				<a href="#">省农业专家顾问团分团长会议在济南召开   </a>
			</li>
			<li>
				<span> [ 2015-11-09 ]</span>
				<a href="#">全省第一期果树行业关键技术培训班在临朐举办</a>
			</li>
		</ul>
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
