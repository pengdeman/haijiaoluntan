<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath =
            request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                    + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>
<head>
<base href="<%=basePath%>">
<title>海角论坛</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="404/error_all.css?t=201303212934">
</head>
<body class="error-404">
<div id="doc_main">
	
	<section class="bd clearfix">
		<div class="module-error">
			<div class="error-main clearfix">
				<div class="label"></div>
				<div class="info">
					<h3 class="title">啊哦，你所访问的页面不存在了。</h3>
					<div class="reason">
						<p>可能的原因：</p>
						<p>0.系统数据异常了😢。</p>
						<p>1.你长得太漂亮，页面害羞了😳。</p>
						<p>2.手抖打错了😓。</p>
						<p>3.链接过了保质期💔。</p>
					</div>
					<div class="oper">
						<p><a href="javascript:history.go(-1);">返回上一级页面&gt;</a></p>
						<p><a href="<%=basePath%>">回到网站首页&gt;</a></p>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>

</body></html>
