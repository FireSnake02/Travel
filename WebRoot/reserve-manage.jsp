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

<title>预定管理</title>

</head>

<body>
	<%@ include file="header.jsp"%>
	<section class="news py-5" id="blogs">
		<div class="container">
			<form id="recommendationManage" method="post"
				action="ReserveManageServlet">
				<input type="hidden" id="index" name="index" value="" /> <input
					type="hidden" id="headClick" name="headClick" value="${headClick}" />
				<c:choose>
					<c:when
						test="${(headClick == '1' && empty restaurant) || (headClick == '2' && empty hotel) || (headClick == '3' && empty attraction)}">
						<div class="row mt-5"
							style="justify-content: center;align-items: center;height:60vh;">
							<h1 style="color: dimgray;text-align: center;">暂无预定信息</h1>
						</div>
					</c:when>

					<c:when test="${headClick == '1'}">
						<div class="row my-5">
							<div class="col-12 text-center">
								<h3 class="display-4 fw-bold theme-text-secondary mb-3">
									预定 <span class="high-text">餐厅</span> 管理
								</h3>
								<p class="font-small theme-text-accent-one mb-0">预定管理页面提供便捷的预订管理服务，让您轻松安排行程。</p>
							</div>
						</div>
						<div class="row mt-5">
							<c:forEach items="${restaurant}" var="item">
								<div class="col-12 col-lg-6 mb-4">
									<div class="news-card row g-0">
										<div class="col-12 col-lg-6">
											<div
												class="theme-box-shadow theme-border-radius overflow-hidden position-relative">
												<figure class="mb-0 img-effect" style="height:250px;">
													<img src="${item.image_url}" class="img-fluid"
														style="width: 100%;height:100%;" alt="news articles">
												</figure>
												<div class="tags position-absolute">
													<div class="flood-effect">
														<a href="javascript:void(0)" class="font-small"><i
															class="bi bi-calendar4-week me-2"></i>预约时间：${item.start_date}</a>
													</div>
												</div>
											</div>
										</div>
										<div class="p-2 p-lg-2 p-xl-4 col-12 col-lg-6">
											<h2 class="fs-5 fw-bold mb-3">餐厅名：${item.name}</h2>
											<p class="theme-text-accent-one mb-3">地址：${item.address}</p>
											<p class="theme-text-accent-one mb-3">评分：${item.rating}</p>
											<p class="theme-text-accent-one mb-3">联系电话：${item.phone_number}</p>
											<div class="d-flex">
												<a href="javascript:void(0)"
													class="btn theme-border theme-border-radius font-small fw-bold button-effect"
													onclick="return cancel(${item.restaurant_id})">取消预定<i
													class="bi bi-arrow-right ms-2"></i></a>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</c:when>

					<c:when test="${headClick == '2'}">
						<div class="row my-5">
							<div class="col-12 text-center">
								<h3 class="display-4 fw-bold theme-text-secondary mb-3">
									预定 <span class="high-text">宾馆</span> 管理
								</h3>
								<p class="font-small theme-text-accent-one mb-0">预定管理页面提供便捷的预订管理服务，让您轻松安排行程。</p>
							</div>
						</div>
						<div class="row mt-5">
							<c:forEach items="${hotel}" var="item">
								<div class="col-12 col-lg-6 mb-4">
									<div class="news-card row g-0">
										<div class="col-12 col-lg-6">
											<div
												class="theme-box-shadow theme-border-radius overflow-hidden position-relative">
												<figure class="mb-0 img-effect" style="height:250px;">
													<img src="${item.image_url}" class="img-fluid"
														style="width: 100%;height:100%;" alt="news articles">
												</figure>
												<div class="tags position-absolute">
													<div class="flood-effect">
														<a href="javascript:void(0)" class="font-small"><i
															class="bi bi-calendar4-week me-2"></i>预约时间：${item.start_date}</a>
													</div>
												</div>
											</div>
										</div>
										<div class="p-2 p-lg-2 p-xl-4 col-12 col-lg-6">
											<h2 class="fs-5 fw-bold mb-3">宾馆名：${item.name}</h2>
											<p class="theme-text-accent-one mb-3">地址：${item.address}</p>
											<p class="theme-text-accent-one mb-3">评分：${item.rating}</p>
											<p class="theme-text-accent-one mb-3">联系电话：${item.phone_number}</p>
											<div class="d-flex">
												<a href="javascript:void(0)"
													class="btn theme-border theme-border-radius font-small fw-bold button-effect"
													onclick="return cancel(${item.hotel_id})">取消预定<i
													class="bi bi-arrow-right ms-2"></i></a>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</c:when>

					<c:when test="${headClick == '3'}">
						<div class="row my-5">
							<div class="col-12 text-center">
								<h3 class="display-4 fw-bold theme-text-secondary mb-3">
									预定 <span class="high-text">景点</span> 管理
								</h3>
								<p class="font-small theme-text-accent-one mb-0">预定管理页面提供便捷的预订管理服务，让您轻松安排行程。</p>
							</div>
						</div>
						<div class="row mt-5">
							<c:forEach items="${attraction}" var="item">
								<div class="col-12 col-lg-6 mb-4">
									<div class="news-card row g-0">
										<div class="col-12 col-lg-6">
											<div
												class="theme-box-shadow theme-border-radius overflow-hidden position-relative">
												<figure class="mb-0 img-effect" style="height:250px;">
													<img src="${item.image_url}" class="img-fluid"
														alt="news articles" style="width: 100%;height:100%;">
												</figure>
												<div class="tags position-absolute">
													<div class="flood-effect">
														<a href="javascript:void(0)" class="font-small"><i
															class="bi bi-calendar4-week me-2"></i>预约时间：${item.start_date}</a>
													</div>
												</div>
											</div>
										</div>
										<div class="p-2 p-lg-2 p-xl-4 col-12 col-lg-6">
											<h2 class="fs-5 fw-bold mb-3">景点名：${item.name}</h2>
											<p class="theme-text-accent-one mb-3">地址：${item.address}</p>
											<p class="theme-text-accent-one mb-3">开放时间：${item.open_time}</p>
											<p class="theme-text-accent-one mb-3">
												票价：
												<c:choose>
													<c:when test="${item.entrance_fee == 0.0}">免费</c:when>
													<c:otherwise>${item.entrance_fee}</c:otherwise>
												</c:choose>
											</p>
											<div class="d-flex">
												<a href="javascript:void(0)"
													class="btn theme-border theme-border-radius font-small fw-bold button-effect"
													onclick="return cancel(${item.attraction_id})">取消预定<i
													class="bi bi-arrow-right ms-2"></i></a>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</c:when>
				</c:choose>
			</form>
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
		function cancel(number) {
			var recommendationManage = document
					.getElementById("recommendationManage");
			var index = document.getElementById("index");
			index.value = number;
			recommendationManage.submit();
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
