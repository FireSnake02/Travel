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
<link href="static/css/login.css" rel="stylesheet">
<link href="static/css/sweetalert.css" rel="stylesheet">

<title>登录及注册</title>
</head>

<body>
	<%@ include file="header.jsp"%>

	<section class="hero" id="home">
		<div class="container">
			<div class="row align-items-center py-8">
				<p class="tip"></p>
				<div class="cont">
					<form id="frmLogins" method="post" action="LoginServlet">
						<input type="hidden" id="operationType" name="operationType"
							value="" />
						<div class="form sign-in">
							<h2>欢迎回来</h2>
							<label> <span>* 电子邮箱</span> <input type="email"
								name="email" />
							</label> <label> <span> * 密码</span> <input type="password"
								name="password" />
							</label>
							<div class="get">
								<a class="forgot-pass" href="ForgetPasswordServlet">忘记密码？</a>
							</div>
							<button type="button" class="submit2"
								onclick="return login(this.form)">登录</button>
						</div>
						<div class="sub-cont">
							<div class="img">
								<div class="img__text m--up">
									<h2>新来的？</h2>
									<p>注册并发现更多朋友吧</p>
								</div>
								<div class="img__text m--in">
									<h2>登录?</h2>
									<p>如果您已经有帐户，只需登录即可。我们想念您！</p>
								</div>
								<div class="img__btn">
									<span class="m--up">注册</span> <span class="m--in">登录</span>
								</div>
							</div>
							<div class="form sign-up">
								<h2>欢迎注册</h2>
								<label> <span>* 电子邮箱</span> <input type="email"
									name="reemail" />
								</label> <label> <span>* 用户名</span> <input type="text"
									name="reusername" />
								</label><label> <span>* 密码</span> <input type="password"
									name="repassword" />
								</label><label> <span>* 确认密码</span> <input type="password"
									name="rerepassword" />
								</label>
								<button type="submit" class="submit"
									onclick="return register(this.form)">注册</button>
							</div>
						</div>
					</form>
				</div>
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
		document.querySelector('.img__btn').addEventListener(
				'click',
				function() {
					document.querySelector('.cont').classList
							.toggle('s--signup');
				});

		function login(form) {
			var email = form.email.value.trim();
			var password = form.password.value.trim();
			var emailCheck = /^[A-Za-z0-9]+([-._][A-Za-z0-9]+)*@[A-Za-z0-9]+(-[A-Za-z0-9]+)*(\.[A-Za-z]{2,6}|[A-Za-z]{2,4}\.[A-Za-z]{2,3})$/;

			if (email == "") {
				swal("请输入邮箱", "", "error");
				return false;
			} else if (!emailCheck.test(email)) {
				swal("邮箱格式不正确", "", "error");
				return false;
			} else if (password == "") {
				swal("请输入密码", "", "error");
				return false;
			} else {
				var frmLogins = document.getElementById("frmLogins");
				var operationType = document.getElementById("operationType");
				operationType.value = "login";
				frmLogins.submit();
			}
		}

		function register(form) {
			var reemail = form.reemail.value.trim();
			var reusername = form.reusername.value.trim();
			var repassword = form.repassword.value.trim();
			var rerepassword = form.rerepassword.value.trim();
			var emailCheck = /^[A-Za-z0-9]+([-._][A-Za-z0-9]+)*@[A-Za-z0-9]+(-[A-Za-z0-9]+)*(\.[A-Za-z]{2,6}|[A-Za-z]{2,4}\.[A-Za-z]{2,3})$/;
			var passwordCheck = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,10}$/;

			if (reemail == "") {
				swal("请输入邮箱", "", "error");
				return false;
			} else if (!emailCheck.test(reemail)) {
				swal("邮箱格式不正确", "", "error");
				return false;
			} else if (reusername == "") {
				swal("请输入用户名", "", "error");
				return false;
			} else if (repassword == "") {
				swal("请输入密码", "", "error");
				return false;
			} else if (rerepassword != repassword) {
				swal("两次输入密码不一致", "", "error");
				return false;
			} else if (!passwordCheck.test(repassword)) {
				swal("密码过于简单", "请符合强密码格式(必须包含大小写字母和数字的组合，可以使用特殊字符，长度在8-10之间)",
						"error");
				return false;
			} else {
				var frmLogins = document.getElementById("frmLogins");
				var operationType = document.getElementById("operationType");
				operationType.value = "register";
				frmLogins.submit();
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
