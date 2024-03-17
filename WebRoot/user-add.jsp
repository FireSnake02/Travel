<%@page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html class="x-admin-sm">
<head>
<meta charset="UTF-8">
<title>用户添加</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="stylesheet" href="./css/font.css">
<link rel="stylesheet" href="./css/xadmin.css">

</head>
<body>
	<div class="layui-fluid">
		<div class="layui-row">
			<form id="frmAdd" class="layui-form" method="post"
				action="UserAddServlet">
				<div class="layui-form-item">
					<label for="L_email" class="layui-form-label"> <span
						class="x-red">*</span>邮箱
					</label>
					<div class="layui-input-inline">
						<input type="text" name="email" autocomplete="off"
							class="layui-input">
					</div>
					<div class="layui-form-mid layui-word-aux">
						<span class="x-red">*</span>将会成为您唯一的登入名
					</div>
				</div>
				<div class="layui-form-item">
					<label for="L_username" class="layui-form-label"> <span
						class="x-red">*</span>用户名
					</label>
					<div class="layui-input-inline">
						<input type="text" name="username" autocomplete="off"
							class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label for="L_pass" class="layui-form-label"> <span
						class="x-red">*</span>密码
					</label>
					<div class="layui-input-inline">
						<input type="password" name="password" autocomplete="off"
							class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label for="L_repass" class="layui-form-label"> <span
						class="x-red">*</span>确认密码
					</label>
					<div class="layui-input-inline">
						<input type="password" name="repassword" autocomplete="off"
							class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label for="L_username" class="layui-form-label"> <span
						class="x-red">*</span>手机号
					</label>
					<div class="layui-input-inline">
						<input type="text" name="phone" autocomplete="off"
							class="layui-input">
					</div>
					<div class="layui-form-mid layui-word-aux">
						<span class="x-red">*</span>可选填
					</div>
				</div>
				<div class="layui-form-item">
					<label for="L_username" class="layui-form-label"> <span
						class="x-red">*</span>用户权限
					</label>
					<div class="layui-input-inline">
						<select class="form-control" name="role" id="role">
							<option value="" selected="selected">--请选择--</option>
							<option value="管理员">管理员</option>
							<option value="普通用户">普通用户</option>
						</select>
					</div>
				</div>
				<div class="layui-form-item">
					<label for="L_repass" class="layui-form-label"></label>
					<button type="submit" class="layui-btn"
						onclick="return addUser(this.form)">添加</button>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript" src="./lib/layui/layui.js"
		charset="utf-8"></script>
	<script type="text/javascript" src="./js/xadmin.js"></script>
	<script>
		layui.use([ 'form', 'layer', 'jquery' ], function() {
			$ = layui.jquery;
		});

		function addUser(form) {
			var email = form.email.value.trim();
			var username = form.username.value.trim();
			var password = form.password.value.trim();
			var repassword = form.repassword.value.trim();
			var phone = form.phone.value.trim();
			var role = form.role.value.trim();
			var emailCheck = /^[A-Za-z0-9]+([-._][A-Za-z0-9]+)*@[A-Za-z0-9]+(-[A-Za-z0-9]+)*(\.[A-Za-z]{2,6}|[A-Za-z]{2,4}\.[A-Za-z]{2,3})$/;
			var passwordCheck = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,10}$/;
			var phoneCheck = /^1[3456789]\d{9}$/;

			if (email == "") {
				alert("请输入邮箱");
				return false;
			} else if (!emailCheck.test(email)) {
				alert("邮箱格式不正确");
				return false;
			} else if (username == "") {
				alert("请输入用户名");
				return false;
			} else if (password == "") {
				alert("请输入密码");
				return false;
			} else if (repassword != password) {
				alert("两次输入密码不一致");
				return false;
			} else if (!passwordCheck.test(password)) {
				alert("密码过于简单, 请符合强密码格式(必须包含大小写字母和数字的组合，可以使用特殊字符，长度在8-10之间)");
				return false;
			} else if (phone != "" && !phoneCheck.test(phone)) {
				alert("手机号格式不正确");
				return false;
			} else if (role == "") {
				alert("请选择用户权限");
				return false;
			} else {
				var frmAdd = document.getElementById("frmAdd");
				frmAdd.submit();
			}
		}
	</script>

	<c:if test="${not empty errorMsg}">
		<script>
			alert("${errorMsg}");
			window.history.replaceState(null, null, window.location.href);
		</script>
	</c:if>
</body>

</html>