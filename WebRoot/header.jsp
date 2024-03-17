<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<body>
	<!-- page wrapper section -->
	<div id="wrapper"></div>
	<!-- Header Part -->
	<header> <!-- menu Part -->
	<div
		class="navbar navbar-expand-lg py-lg-0 py-2 px-0 theme-box-shadow header"
		id="nav">
		<nav class="container"> <a class="navbar-brand py-0 m-0"
			href="#"> <img src="static/picture/brand.svg" class="img-fluid"
			alt="Brand Logo" title="Brand Logo">
		</a>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<c:choose>
				<c:when test="${not empty sessionScope.user_id}">
					<ul class="navbar-nav m-auto mb-2 mb-lg-0">
						<li class="nav-item nav-effect"><a class="nav-link"
							aria-current="page" href="#home"
							onclick="window.location.href='IndexServlet';">首页</a></li>
						<li class="nav-item nav-effect"><a class="nav-link"
							href="#whyus"
							onclick="window.location.href='ReserveManageServlet?headClick=1';">预订餐厅</a></li>
						<li class="nav-item nav-effect "><a class="nav-link"
							href="#hero"
							onclick="window.location.href='ReserveManageServlet?headClick=2';">预订宾馆</a></li>
						<li class="nav-item nav-effect"><a class="nav-link"
							href="#blog"
							onclick="window.location.href='ReserveManageServlet?headClick=3';">预订景点</a></li>
						<li class="nav-item nav-effect"><a class="nav-link"
							href="#contact"
							onclick="window.location.href='PersonInfoServlet';">个人信息</a></li>
					</ul>
					<div class="d-flex ms-2 justify-content-center">
						<a href="LogoutServlet"
							class="btn custom-btn-primary font-small fw-bold button-effect">退出登录</a>
					</div>
				</c:when>
				<c:otherwise>
					<ul class="navbar-nav m-auto mb-2 mb-lg-0">
						<li class="nav-item nav-effect"><a class="nav-link"
							aria-current="page" href="#home" onclick="loginCheck()">首页</a></li>
						<li class="nav-item nav-effect"><a class="nav-link"
							href="#whyus" onclick="loginCheck()">预订餐厅</a></li>
						<li class="nav-item nav-effect "><a class="nav-link"
							href="#hero" onclick="loginCheck()">预订宾馆</a></li>
						<li class="nav-item nav-effect"><a class="nav-link"
							href="#blog" onclick="loginCheck()">预订景点</a></li>
						<li class="nav-item nav-effect"><a class="nav-link"
							href="#contact" onclick="loginCheck()">个人信息</a></li>
					</ul>
					<div class="d-flex ms-2 justify-content-center">
						<a href="LoginServlet"
							class="btn custom-btn-primary font-small fw-bold button-effect">登录/注册</a>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		</nav>
	</div>
	</header>
	<script src="static/js/sweetalert-dev.js"></script>
	<script>
		function loginCheck() {
			swal("请先登录", "", "warning");
		}
	</script>
</body>
</html>
