<%@page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="ThemesLay">

<link href="static/css/main.css" rel="stylesheet">
<link href="static/css/jquery-ui.css" rel="stylesheet">
<link href="static/css/sweetalert.css" rel="stylesheet">
<link href="static/css/forget-password.css" rel="stylesheet">

<title>个人信息修改</title>

</head>

<body>
	<%@ include file="header.jsp"%>

	<section class="hero" id="home">
		<div class="container">
			<div class="row align-items-center py-8">
				<div class="col-12 col-lg-8 m-auto text-center">
					<h4 class="display-4 fw-bold theme-text-secondary mb-3">
						个人 <span class="high-text">信息</span> 修改
					</h4>
					<p class="mb-3 theme-text-accent-one lh-lg">您可以轻松更新您的个人资料，包括用户名、邮箱、电话号码等信息，确保您的信息始终保持最新和准确。</p>
				</div>

				<form id="updateInfo" method="post" action="PersonInfoServlet">
					<input type="hidden" id="phone_number"
						value="${sessionScope.phone_number}"> <input type="hidden"
						id="operationType" name="operationType" value="" />
					<div class="modal_content" style="margin-top:-50px;">
						<div>
							<label for="userName">用户名：</label><br /> <input id="email"
								name="userName" type="text" autocomplete="off"
								placeholder="请输入用户名" value="${user.getUsername()}">
						</div>
						<div>
							<label for="email">邮箱号：</label><br />
							<div class="code1">
								<input id="email" name="email" type="text" autocomplete="off"
									placeholder="请输入邮箱号" value="${user.getEmail()}">
							</div>
						</div>
						<div>
							<label for="password">密码：</label><br />
							<div class="code1">
								<input id="email" name="password" type="password"
									autocomplete="off" placeholder="请输入密码"
									value="${user.getPassword()}">
							</div>
						</div>
						<div>
							<label for="rePassword">确认密码：</label><br />
							<div class="code1">
								<input id="email" name="rePassword" type="password"
									autocomplete="off" placeholder="请输入确认密码"
									value="${user.getPassword()}">
							</div>
						</div>
						<div>
							<label for="phone">手机号：</label><br />
							<div class="code1">
								<input id="email" name="phone" type="text" autocomplete="off"
									placeholder="请输入手机号" value="${user.getPhone_number()}">
							</div>
						</div>
						<div>
							<label for="verification">验证码：</label><br />
							<div class="code1">
								<input id="email" name="verification" type="text"
									autocomplete="off" placeholder="请输入验证码"><input
									id="btnSendCode1" type="submit" class="btn btn-default"
									value="获取验证码" onClick="return sendMessage(this.form)" />
							</div>
						</div>
						<button class="btn custom-btn-primary button-effect px-3 px-lg-5"
							type="submit" id="button-addon2"
							onclick="return updateInfo(this.form)">
							<i class="bi bi-send-check me-1"></i> <span>提交</span>
						</button>
					</div>
				</form>
			</div>
		</div>
	</section>

	<%@ include file="footer.jsp"%>

	<script src="static/js/bootstrap.bundle.min.js"></script>
	<script src="static/js/jquery.min.js"></script>
	<script src="static/js/owl.carousel.min.js"></script>
	<script src="static/js/jquery-ui.js"></script>
	<script src="static/js/jquery.magnific-popup.min.js"></script>
	<script src="static/js/main.js"></script>
	<script src="static/js/sweetalert-dev.js"></script>

	<script>
		swal("信息变更规则", "如果修改了手机号，必须输入验证码才能变更成功，反之不需要。", "info");
		window.history.replaceState(null, null, window.location.href);

		function updateInfo(form) {
			var userName = document.getElementsByName('userName')[0].value
					.trim();
			var email = document.getElementsByName('email')[0].value.trim();
			var password = document.getElementsByName('password')[0].value
					.trim();
			var rePassword = document.getElementsByName('rePassword')[0].value
					.trim();
			var phone = document.getElementsByName('phone')[0].value.trim();
			var oldPhone = document.getElementById('phone_number').value;
			var verification = document.getElementsByName('verification')[0].value
					.trim();
			var emailCheck = /^[A-Za-z0-9]+([-._][A-Za-z0-9]+)*@[A-Za-z0-9]+(-[A-Za-z0-9]+)*(\.[A-Za-z]{2,6}|[A-Za-z]{2,4}\.[A-Za-z]{2,3})$/;
			var phoneCheck = /^1[3456789]\d{9}$/;
			var passwordCheck = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,10}$/;

			if (userName == "") {
				swal("请输入用户名", "", "error");
				return false;
			} else if (email == "") {
				swal("请输入邮箱", "", "error");
				return false;
			} else if (!emailCheck.test(email)) {
				swal("邮箱格式不正确", "", "error");
				return false;
			} else if (password == "") {
				swal("请输入密码", "", "error");
				return false;
			} else if (rePassword != password) {
				swal("两次输入密码不一致", "", "error");
				return false;
			} else if (!passwordCheck.test(password)) {
				swal("密码过于简单", "请符合强密码格式(必须包含大小写字母和数字的组合，可以使用特殊字符，长度在8-10之间)",
						"error");
				return false;
			} else if (phone == "") {
				swal("请输入手机号", "", "error");
				return false;
			} else if (!phoneCheck.test(phone)) {
				swal("手机号格式不正确", "", "error");
				return false;
			} else if (oldPhone != phone && verification == "") {
				swal("请输入验证码", "", "error");
				return false;
			} else {
				var updateInfo = document.getElementById("updateInfo");
				var operationType = document.getElementById("operationType");
				operationType.value = "update";
				updateInfo.submit();
			}
		}

		function sendMessage(form) {
			var phone = document.getElementsByName('phone')[0].value.trim();
			var phoneCheck = /^1[3456789]\d{9}$/;
			var oldPhone = document.getElementById('phone_number').value;

			if (phone == "") {
				swal("请输入手机号", "", "error");
				return false;
			} else if (!phoneCheck.test(phone)) {
				swal("手机号格式不正确", "", "error");
				return false;
			} else if (oldPhone == phone) {
				swal("手机号与原手机号一致", "", "error");
				return false;
			} else {
				var updateInfo = document.getElementById("updateInfo");
				var operationType = document.getElementById("operationType");
				operationType.value = "sendMessage";
				updateInfo.submit();
			}
		}
	</script>

	<c:if test="${not empty errorMsg}">
		<script>
			swal("${errorMsg}", "", "error");
			window.history.replaceState(null, null, window.location.href);
		</script>
	</c:if>

	<c:if test="${not empty successMsg}">
		<script>
			swal("${successMsg}", "", "success");
			window.history.replaceState(null, null, window.location.href);
		</script>
	</c:if>
</body>

</html>