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
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="submit" onclick="signinsubform()" class="btn btn-primary">登录</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal -->
</div>

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
				content : '提交中...',
				time : 5
			});
			$("#signin-form_id").submit();
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
	</script>
