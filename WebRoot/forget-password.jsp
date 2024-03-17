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

<title>忘记密码</title>
</head>

<body>
	<%@ include file="header.jsp"%>

	<section class="hero" id="home">
		<div class="container">
			<div class="row align-items-center py-8">
				<form id="frmForget" method="post" action="ForgetPasswordServlet" style="margin-top:20px;">
					<div class="col-12 col-lg-8 m-auto text-center">
						<h4 class="display-4 fw-bold theme-text-secondary mb-3">
							找回<span class="high-text"> 密码</span>
						</h4>
						<p class="mb-3 theme-text-accent-one lh-lg">用户输入注册邮箱和手机号，接收密码</p>
					</div>
					<div class="modal_content" style="margin-top:-60px;">
						<div>
							<label for="email">邮箱号：</label><br /> <input id="email"
								name="email" type="text" autocomplete="off"
								placeholder="请输入已注册的邮箱号">
						</div>
						<div>
							<label for="phone1">绑定手机号：</label><br />
							<div class="code1">
								<input id="phone1" name="phone" type="text" autocomplete="off"
									placeholder="请输入已绑定的手机号"> <input id="btnSendCode1"
									type="button" class="btn btn-default" value="获取密码"
									onClick="sendMessage1()" />
							</div>
						</div>
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
		swal("找回规则", "输入邮箱和绑定的手机号，点击获取密码后可获得密码短信", "info");
		window.history.replaceState(null, null, window.location.href);

		function sendMessage1() {
			//向后台发送处理数据
			var frmForget = document.getElementById("frmForget");
			frmForget.submit();
		}
	</script>

	<c:if test="${not empty successMsg}">
		<script>
			swal("${successMsg}", "", "success");
			window.history.replaceState(null, null, window.location.href);
		</script>
	</c:if>

	<c:if test="${not empty errorMsg}">
		<script>
			swal("${errorMsg}", "", "error");
			window.history.replaceState(null, null, window.location.href);
		</script>
	</c:if>

</body>

</html>