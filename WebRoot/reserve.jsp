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

<title>确认信息</title>

</head>

<body>
	<%@ include file="header.jsp"%>

	<section class="hero" id="home">
		<div class="container">
			<div class="row align-items-center py-8">
				<div class="col-12 col-lg-8 m-auto text-center">
					<h4 class="display-4 fw-bold theme-text-secondary mb-3">
						请 <span class="high-text">确认</span> 预定信息
					</h4>
					<p class="mb-3 theme-text-accent-one lh-lg">请仔细核对以上信息，确保无误后点击确认按钮完成预订</p>
				</div>

				<form id="reserve" method="post" action="ReserveServlet">
					<input type="hidden" id="operationType" name="operationType"
						value="" />
					<div class="modal_content" style="margin-top:-50px;">
						<c:choose>
							<c:when test="${sessionScope.reserveType == 1}">
								<div>
									<label for="userName">餐厅名：</label><br /> <input id="email"
										name="userName" type="text" autocomplete="off"
										value="${reserveRestaurantName}" readonly>
								</div>
								<div>
									<label for="email">地址：</label><br />
									<div class="code1">
										<input id="email" name="email" type="text" autocomplete="off"
											value="${reserveRestaurantAddress}" readonly>
									</div>
								</div>
							</c:when>
							<c:when test="${sessionScope.reserveType == 2}">
								<div>
									<label for="userName">宾馆名：</label><br /> <input id="email"
										name="userName" type="text" autocomplete="off"
										value="${reserveHotelName}" readonly>
								</div>
								<div>
									<label for="email">地址：</label><br />
									<div class="code1">
										<input id="email" name="email" type="text" autocomplete="off"
											value="${reserveHotelAddress}" readonly>
									</div>
								</div>
							</c:when>
							<c:when test="${sessionScope.reserveType == 3}">
								<div>
									<label for="userName">景点名：</label><br /> <input id="email"
										name="userName" type="text" autocomplete="off"
										value="${reserveAttractionName}" readonly>
								</div>
								<div>
									<label for="email">地址：</label><br />
									<div class="code1">
										<input id="email" name="email" type="text" autocomplete="off"
											value="${reserveAttractionAddress}" readonly>
									</div>
								</div>
							</c:when>
						</c:choose>
						<div>
							<label for="password">预约时间：</label><br />
							<div class="code1">
								<input id="email" name="password" type="text" autocomplete="off"
									value="<%=session.getAttribute("start_date")%>" readonly>
							</div>
						</div>
						<div>
							<label for="phone">手机号：</label><br />
							<div class="code1">
								<input id="email" name="phone" type="text" autocomplete="off"
									value="<%=session.getAttribute("phone_number")%>" readonly>
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
							onclick="return confirm(this.form)">
							<i class="bi bi-send-check me-1"></i> <span>确认</span>
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
		function sendMessage(form) {
			var reserve = document.getElementById("reserve");
			var operationType = document.getElementById("operationType");
			operationType.value = "sendMessage";
			reserve.submit();
		}

		function confirm(form) {
			var verification = document.getElementsByName('verification')[0].value
					.trim();
			if (verification == "") {
				swal("请输入验证码", "", "error");
				return false;
			} else {
				var reserve = document.getElementById("reserve");
				var operationType = document.getElementById("operationType");
				operationType.value = "confirm";
				reserve.submit();
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
