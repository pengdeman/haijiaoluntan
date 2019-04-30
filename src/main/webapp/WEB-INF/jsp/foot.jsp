<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!-- footer -->
<div class="footer">
	<p style="color: white;">© 2019 haijiaoluntan. All rights reserved.</p>
</div>

<!-- 注册模态框（Modal） -->
<div class="modal fade" id="registModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">注册</h4>
			</div>
			<div class="modal-body">
				<form class="form-group" action="<%=basePath%>register"
					id="regist-form_id" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<label>昵称</label> <input class="form-control" type="text"
							name="name" placeholder="给自己起一个帅气的名字吧">
					</div>
					<div class="form-group">
						<label>账号</label> <input class="form-control" type="text"
							name="account" placeholder="登录时的账号">
					</div>
					<div class="form-group">
						<label>密码</label> <input class="form-control" type="password"
							name="password" placeholder="至少6位字母或数字">
					</div>
					<div class="form-group">
						<label>头像</label> <input type="file" name="picurl"
							placeholder="上传您的头像" />
					</div>
					<br> <a href="" data-toggle="modal" data-dismiss="modal"
						data-target="#loginModal">已有账号？点我登录</a>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="submit" onclick="registsubform()"
					class="btn btn-primary">注册</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal -->
</div>


<!-- 登录模态框（Modal） -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">登录</h4>
			</div>
			<div class="modal-body">
				<form class="form-group" action="<%=basePath%>login" id="signin-form_id" method="post">
					<div class="form-group">
						<label>账号</label> <input class="form-control" type="text"
							name="login_account" placeholder="请输入账号">
					</div>
					<div class="form-group">
						<label>密码</label> <input class="form-control" type="password"
							name="login_password" placeholder="请输入密码">
					</div>
					<br> <a href="" data-toggle="modal" data-dismiss="modal"
						data-target="#registModal">还没有账号？点我注册</a>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="submit" onclick="signinsubform()" class="btn btn-primary">登录</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal -->
</div>

<!-- 发布信息模态框 -->
  <div class="modal fade" id="infoModal" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header" style="background-image: url('xingchen.jpg');background-repeat:no-repeat;background-size:100% 100%;-moz-background-size:100% 100%;">
          <button type="button" class="close" data-dismiss="modal"
aria-hidden="true">×
          </button>
          <h1 class="text-center" id="chenxingModalLabel">
            信息发布
          </h1>
        </div>
        <div class="modal-body">
          <form class="form-group" action="<%=basePath%>submitarticle" id="article-form_id" method="post" enctype="multipart/form-data">
            <div class="form-group">
				<label>信息标题</label> 
				<input class="form-control" type="text" name="title" placeholder="请输入标题">
			</div>
            <div class="form-group">
              <label>信息内容</label>
              <textarea class="form-control" type="text" name="comment" id="comment" style="width: 99.5%; min-height: 150px;"></textarea>
            </div>
            <div class="form-group">
              <label>板块设置</label>
                <div class="input-group">
                  <div class="input-group-btn">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                      选择板块
                      <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                      <li><a href="javascript:getbankuai('热点新闻')">热点新闻</a></li>
                      <li><a href="javascript:getbankuai('兼职招聘')">兼职招聘</a></li>
                      <li><a href="javascript:getbankuai('二手市场')">二手市场</a></li>
                      <li><a href="javascript:getbankuai('家有萌宠')">家有萌宠</a></li>
                      <li><a href="javascript:getbankuai('同城交友')">同城交友</a></li>
                      <li><a href="javascript:getbankuai('情感天地')">情感天地</a></li>
                      <li><a href="javascript:getbankuai('广告位展示')">广告位展示</a></li>
                    </ul>
                  </div><!-- /btn-group -->
                  <input type="text" class="form-control" id="plate" name="plate">
                </div><!-- /input-group -->
            </div>
            <div class="form-group">
              <label>文章图片</label>
              <input type="file" class="file" name="pictureurl"/>
            </div>
          </form>
        </div>
        <div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="submit" onclick="infosubform()" class="btn btn-primary">发布</button>
			</div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->
  
  
  <!-- 指定板块 -->
  <div class="modal fade" id="plateModal" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header" style="background-image: url('xingchen.jpg');background-repeat:no-repeat;background-size:100% 100%;-moz-background-size:100% 100%;">
          <button type="button" class="close" data-dismiss="modal"
aria-hidden="true">×
          </button>
          <h1 class="text-center" id="chenxingModalLabel">
            设置用户板块
          </h1>
        </div>
        <div class="modal-body">
          <form class="form-group" action="<%=basePath%>modifyplate" id="plate-form_id" method="post">
            <div class="form-group">
				<label>昵称：</label> 
				<label id="username"></label> 
			</div>
			<input type="hidden" id="userid" name="userid" value="">
            <div class="form-group">
              <label>板块设置</label>
                <div class="input-group">
                  <div class="input-group-btn">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                      选择板块
                      <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                      <li><a href="javascript:getbankuaim('热点新闻')">热点新闻</a></li>
                      <li><a href="javascript:getbankuaim('兼职招聘')">兼职招聘</a></li>
                      <li><a href="javascript:getbankuaim('二手市场')">二手市场</a></li>
                      <li><a href="javascript:getbankuaim('家有萌宠')">家有萌宠</a></li>
                      <li><a href="javascript:getbankuaim('同城交友')">同城交友</a></li>
                      <li><a href="javascript:getbankuaim('情感天地')">情感天地</a></li>
                      <li><a href="javascript:getbankuaim('广告位展示')">广告位展示</a></li>
                    </ul>
                  </div><!-- /btn-group -->
                  <input type="text" class="form-control" id="platem" name="platem">
                </div><!-- /input-group -->
            </div>
          </form>
        </div>
        <div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="submit" onclick="platesubform()" class="btn btn-primary">修改</button>
			</div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->

<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/jquery-common.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="layer/mobile/layer.js"></script>

<script type="text/javascript">
		$(function() {
			messge = '${messge}';
			if (messge != '') {
				alert(messge);
			}
			/*热点新闻*/
			$("#img").jdtab()
			/*广告位展示*/
			$(".showlist").tab({
				g : 2,
				lg : 5,
				boxmargin : 10,
				btnshow : true
			})
		})

	   /**
		* 赋值
		*/
		function fuzhi(name, id){
			$("#username").html(name);
			$("#userid").val(id);
		}
		
		/**
       * 信息发布
       */
      function infosubform() {
		  if ($("input[name='title']").val().length == 0) {
	          alert("请填写信息标题。");
	          return;
	      }
		  if ($("#comment").val().length == 0) {
              alert("请填写信息内容。");
              return;
          }
          if ($("input[name='plate']").val().length == 0) {
              alert("请选择一个板块。");
              return;
          }
          if ($("input[name='pictureurl']").val().length == 0) {
              alert("请选择一个图片。");
              return;
          }
          layer.open({
              type: 2
              ,content: '发布中...'
              ,time: 5
          });
          $("#article-form_id").submit();
      }
		
		/**
		 * 登录
		 */
		function signinsubform() {
			if ($("input[name='login_account']").val().length == 0) {
				alert("请输入账号。");
				return;
			}
			if ($("input[name='login_password']").val().length == 0) {
				alert("请输入密码。");
				return;
			}
			layer.open({
				type : 2,
				content : '登录中...',
				time : 5
			});
			$("#signin-form_id").submit();
		}
		
		/**
		 * 修改用户负责板块
		 */
		function platesubform(){
			if ($("input[name='platem']").val().length == 0) {
	             alert("请选择一个板块。");
	             return;
	         }
			layer.open({
	              type: 2
	              ,content: '发布中...'
	              ,time: 5
	          });
	          $("#plate-form_id").submit();
		}

		/**
	       * 选择板块
	       */
	      function getbankuai(mes){
	          $("#plate").val(mes);
	      }
		
	      /**
	       * 选择板块
	       */
	      function getbankuaim(mes){
	          $("#platem").val(mes);
	      }
		
		/**
		 * 注册
		 */
		function registsubform() {
			if ($("input[name='name']").val().length == 0) {
				alert("请输入昵称。");
				return;
			}
			if ($("input[name='account']").val().length == 0) {
				alert("请输入账号。");
				return;
			}
			if ($("input[name='password']").val().length == 0) {
				alert("请输入密码。");
				return;
			}
			if ($("input[name='picurl']").val().length == 0) {
				alert("请上传头像。");
				return;
			}
			layer.open({
				type : 2,
				content : '提交中...',
				time : 5
			});
			$("#regist-form_id").submit();
		}
		
		/**
	     * 登出
	     */
	    function tuichu(){
	        window.location.href="<%=basePath%>loginout";
	    }
		
		/**
	     * 删除
	     */
		function deletearticle(id){
			window.location.href="<%=basePath%>deletearticle?id="+id;
		}
		
		/**
	     * 置顶
	     */
		function toparticle(id){
			window.location.href="<%=basePath%>toparticle?id="+id;
		}
		
		/**
		* 取消置顶
		*/
		function canceltoparticle(id){
			window.location.href="<%=basePath%>canceltoparticle?id="+id;
		}
		
		/**
		* 删除账号
		*/
		function deleteuser(id){
			window.location.href="<%=basePath%>deleteuser?id="+id;
		}
		
		/**
		* 广告位详情
		*/
		function ggw(id){
			window.location.href="<%=basePath%>godetails?id="+id;
		}
	</script>
