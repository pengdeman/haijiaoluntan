<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<div class="blogroll fix">
		<img src="images/blogroll.jpg">
		<select onchange=mbar(this)>
			<option>搜索相关网站</option>
			<option value="http://www.baidu.com/">百度</option>
			<option value="http://www.google.cn/">Google</option>
			<option value="https://www.sogou.com/">搜狗</option>
			<option value="https://cn.bing.com/">必应</option>
		</select>
		<select onchange=mbar(this)>
			<option>社交相关网站</option>
			<option value="http://www.pengyingjun.com">足迹</option>
			<option value="https://weibo.com/">新浪微博</option>
			<option value="https://www.douban.com/">豆瓣</option>
			<option value="https://www.zhihu.com/">知乎</option>
		</select>
		<select onchange=mbar(this)>
			<option>学习相关网站</option>
			<option value="https://class.hujiang.com/">沪江网</option>
			<option value="https://m.study.163.com/">网易云课堂</option>
			<option value="https://www.imooc.com/">慕课网</option>
			<option value="https://ke.qq.com/">腾讯课堂</option>
		</select>
	</div>
	
	<script type="text/javascript">
	function mbar(sobj) {
    	var docurl =sobj.options[sobj.selectedIndex].value;
        if (docurl != "") {
             open(docurl,'_blank');
             sobj.selectedIndex=0;
             sobj.blur();
        }
    }
 	</script>