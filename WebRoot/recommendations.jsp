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
<link href="static/css/recommendations.css" rel="stylesheet">
<link href="static/css/recommendations2.css" rel="stylesheet">
<link href="static/css/stars.css" rel="stylesheet">

<title>智能推荐</title>
</head>

<body>
	<%@ include file="header.jsp"%>

	<section class="hero" id="home">
		<div class="container">
			<div class="row align-items-center py-8">
				<div class="row my-5">
					<div class="col-12 text-center">
						<h3 class="display-4 fw-bold theme-text-secondary mb-3">
							<%=session.getAttribute("destination")%>
							<span class="high-text">天气</span> 一览
						</h3>
						<p class="font-small theme-text-accent-one mb-0">获取最新的天气信息和预测，帮助您计划出行和活动。</p>
					</div>
				</div>
				<div class="row mb-5">
					<span class=" center-line"></span>
					<div class="col-12 col-lg-4 mb-4 mb-lg-0">
						<div class="text-center feature-card">
							<span class="d-flex circle"> <svg class="hurricane-svg"
									version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg"
									xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
									viewBox="-437 254.4 85 52.6"
									style="enable-background:new -437 254.4 85 52.6;"
									xml:space="preserve">
									<path class="cloud"
										d="M-361.9,280.5c1.4,0,2.6,0.7,3.4,1.7h1.1c0.4-8.2-5.9-10.8-5.9-10.8c-2.2-1.5-5.4-1-5.4-1c-0.1-4.1-2.9-7.4-2.9-7.4c-4.7-5.5-10.3-4.9-10.3-4.9c-7.4-0.2-11,5.9-11,5.9c-5.6-4-14.3-2.6-18.2,3.1c-0.7,1.1-1.3,2.2-1.8,3.4c0,0.1-0.3,1.2-0.4,1.2c3.5-0.6,6.6,1.6,6.6,1.6s1.1-1.1,1.2-1.3c2.4-2.4,5.6-3.6,9-3.2c4.4,0.5,8.5,3,9.9,7.4c0.1,0.2,0.8,2.4,0.6,2.4c5.3,0.1,7.3,3.6,7.3,3.6h13.4C-364.5,281.2-363.3,280.5-361.9,280.5z" />
									<polyline class="lightening"
										points="-382.8,284.2 -387.9,290.9 -380.6,291.2 -387.9,302 "></polyline>
										<path class="line" d="M-426.9,294.4l-5.1,7.3"></path>
										<path class="line" d="M-420.8,294.4l-5.1,7.3"></path>
										<path class="line" d="M-415.4,294.4l-5.1,7.3"></path>
										<path class="line" d="M-409.9,294.4l-5.1,7.3"></path>
										<path class="line" d="M-404.5,294.4l-5.1,7.3"></path>
										<path class="line" d="M-399.1,294.4l-5.1,7.3"></path>
										<path class="line" d="M-393.7,294.4l-5.1,7.3"></path>
										<path class="line" d="M-388.2,294.4l-5.1,7.3"></path>
										<g>
										<path class="little-path path-1" d="M-374.8,287.2h10.6"></path>
										<path class="little-path path-2" d="M-373.8,289.3h10.9"></path>
										<path class="big-path"
										d="M-376,288.3c0,0,14,0,14,0c1.7,0,3.1-1.4,3.3-3.1c0-0.5,0-1-0.3-1.4c-0.9-2.3-4.1-2.7-5.6-0.7c-0.4,0.6-0.7,1.3-0.7,1.9" />
									<path class="little-path path-3"
										d="M-364.1,285c0-1.2,1-2.2,2.2-2.2s2.2,1,2.2,2.2c0,1.2-1,2.2-2.2,2.2"></path>
										</g>
										</svg>
							</span>
							<h3 class="fs-2 pt-5 pb-4 mb-0">
								<span class="timer" data-from="0"
									data-to="<%=session.getAttribute("temperature")%>"
									data-speed="4000"><%=session.getAttribute("temperature")%></span>
								°C
							</h3>
							<p class="mb-3 theme-text-accent-one font-small px-5">别忘了留意气温变化哦，随身携带外套或遮阳伞，保持舒适。</p>
						</div>
					</div>
					<div class="col-12 col-lg-4 mb-4 mb-lg-0">
						<div class="text-center feature-card">
							<span class="d-flex circle"> <svg version="1.1"
									class="clear-sky-svg" xmlns="http://www.w3.org/2000/svg"
									xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
									viewBox="0 0 72.3 52.6"
									style="enable-background:new 0 0 72.3 52.6;"
									xml:space="preserve">
							<g>
							<path class="sun"
										d="M50.8,25.7c0,7.9-6.4,14.4-14.4,14.4s-14.4-6.4-14.4-14.4s6.4-14.4,14.4-14.4S50.8,17.8,50.8,25.7z" />
							<path class="line big-path line-1" d="M54.5,25.8h6" />
							<path class="line big-path line-2" d="M12.4,25.8h6" />
							<path class="line big-path line-3" d="M36.5,44.3v6" />
							<path class="line big-path line-4" d="M36.5,8.2v-6" />
							<path class="line big-path line-5" d="M23,38.8l-4.8,4.8" />
							<path class="line big-path line-6" d="M54.9,8.9L50,13.8" />
							<path class="line big-path line-7" d="M50,38.8l4.4,4.4" />
							<path class="line big-path line-8" d="M18.8,9.6l4.2,4.2" />
							</g>
							</svg>
							</span>
							<h3 class="fs-2 pt-5 pb-4 mb-0">
								<span class="timer" data-from="0"
									data-to="<%=session.getAttribute("temperature")%>"
									data-speed="4000"></span> 风力
							</h3>
							<p class="mb-3 theme-text-accent-one font-small px-5">请留意风力变化，出门前记得带伞或加衣，保持安全。</p>
						</div>
					</div>
					<div class="col-12 col-lg-4 mb-4 mb-lg-0">
						<div class="text-center feature-card">
							<span class="d-flex circle"> <svg version="1.1"
									class="windy-svg" id="Layer_1"
									xmlns="http://www.w3.org/2000/svg"
									xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
									viewBox="-447 254.4 64 52.6"
									style="enable-background:new -447 254.4 64 52.6;"
									xml:space="preserve">
							<g id="Layer_1_1_">
							<g>
							<path class="st0 little-path path-1" d="M-429.2,276.8h6.3" />
							<path class="big-path big-path-1"
										d="M-438.1,279.3c0,0,20.5,0,20.6,0c4.1,0,7.4-3.4,7.7-7.4c0.1-1.1-0.1-2.3-0.6-3.3c-2.2-5.4-9.8-6.3-13.3-1.7c-1,1.3-1.6,3-1.7,4.6" />
							<path class="little-path path-2"
										d="M-422.6,271.7c0-2.8,2.3-5.1,5.1-5.1s5.1,2.3,5.1,5.1c0,2.8-2.3,5.1-5.1,5.1" />
							</g>
							<g>
							<path class="little-path path-3" d="M-434.1,284.9h30.4" />
							<path class="little-path path-4" d="M-410.6,280h8.7" />
							<path class="big-path big-path-2"
										d="M-442.9,282.7h44c3.6,0,6.6,3,6.8,6.5c0.1,1-0.1,2-0.5,3c-2,4.8-8.7,5.5-11.8,1.5c-0.9-1.2-1.4-2.6-1.5-4.1" />
									<path class="little-path path-5"
										d="M-403.4,289.4c0,2.5,2,4.5,4.5,4.5s4.5-2,4.5-4.5s-2-4.5-4.5-4.5" />
							</g>
							</g>
							</svg>
							</span>
							<h3 class="fs-2 pt-5 pb-4 mb-0">
								<span class="timer" data-from="0"
									data-to="<%=session.getAttribute("temperature")%>"
									data-speed="4000"></span> 湿度
							</h3>
							<p class="mb-3 theme-text-accent-one font-small px-5">注意保持身体干燥，多喝水，注意保湿。</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<form id="recommendations" class="row g-2 align-self-center"
		method="post" action="RecommendationServlet">
		<input type="hidden" id="phone_number"
			value="${sessionScope.phone_number}"> <input type="hidden"
			id="operationType" name="operationType" value="" />
		<section class="special-deal pb-5" id="featuredFlights">
			<div class="container">
				<div class="row my-5">
					<div class="row align-items-center py-8">
						<div class="col-12 col-lg-6">
							<h4 class="display-4 theme-text-secondary fw-bold mb-3">
								美味多样 <span class="high-text">餐厅</span>
							</h4>
							<p class="theme-text-accent-one mb-0">探寻城市美食，不可错过的精选餐厅，让您的味蕾在这里得到满足。从传统美食到创新料理，每家餐厅都独具特色，为您带来一场独特的美食之旅。</p>
						</div>
					</div>
				</div>
				<!-- promotional Slider -->
				<div class="row">
					<div class="col-12">
						<div class="owl-carousel owl-theme" id="carouselOffer">
							<!-- repetable element -->
							<div class="item">
								<div class="col-12 mb-3">
									<div class="d-flex flex-column">
										<div class="head">
											<span class="d-inline-flex location"><i
												class="bi bi-geo-alt"></i></span> <span
												class="d-inline-flex pb-2 font-small theme-text-accent-one"><%=session.getAttribute("destination")%>
											</span>
										</div>
										<span class="mb-0 pb-2 theme-text-secondary">${restaurantNames[0]}</span>
										<div
											class="picHeight overflow-hidden hoverShine theme-border-radius-top">
											<figure class="mb-0 img-effect" style="height:250px;">
												<img src="${restaurantimageUrls[0]}" class="img-fluid"
													style="width: 100%;height:100%;" alt="Deals One"
													title="Deals One">
											</figure>
											<div class="airline-tags position-absolute">
												<div class="flood-effect airline-icon">
													<a href="#" class="font-small px-2">${restaurantTels[0]}</a>
												</div>
											</div>
										</div>
										<div
											class="d-flex flex-row justify-content-between position-relative py-3 mb-0">
											<span class="wrap"> <span
												class="d-flex theme-text-accent-one"> <span
													class="fw-bold price theme-text-secondary">地址：${restaurantaddresses[0]}
												</span>
											</span> <c:choose>
													<c:when test="${restaurantratings[0] > 4.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${restaurantratings[0] > 4.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:when test="${restaurantratings[0] > 3.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${restaurantratings[0] > 3.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:when test="${restaurantratings[0] > 2.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${restaurantratings[0] > 2.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:when test="${restaurantratings[0] > 1.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${restaurantratings[0] > 1.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:when test="${restaurantratings[0] > 0.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${restaurantratings[0] > 0.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:otherwise>
														<span class="text-yellow"> 暂无评价 </span>
													</c:otherwise>
												</c:choose>
											</span>
											<button type="submit"
												class="btn custom-btn-primary font-small fw-bold button-effect"
												onclick="return reserve(1)">预定</button>
										</div>
									</div>
								</div>
							</div>
							<!-- repetable element -->
							<div class="item">
								<div class="col-12 mb-3">
									<div class="d-flex flex-column">
										<div class="head">
											<span class="d-inline-flex location"><i
												class="bi bi-geo-alt"></i></span> <span
												class="d-inline-flex pb-2 font-small theme-text-accent-one"><%=session.getAttribute("destination")%></span>
										</div>
										<span class="mb-0 pb-2 theme-text-secondary">${restaurantNames[1]}</span>
										<div
											class="picHeight overflow-hidden hoverShine theme-border-radius-top">
											<figure class="mb-0 img-effect" style="height:250px;">
												<img src="${restaurantimageUrls[1]}" class="img-fluid"
													style="width: 100%;height:100%;" alt="Deals One"
													title="Deals One">
											</figure>
											<div class="airline-tags position-absolute">
												<div class="flood-effect airline-icon">
													<a href="#" class="font-small px-2">${restaurantTels[1]}</a>
												</div>
											</div>
										</div>
										<div
											class="d-flex flex-row justify-content-between position-relative py-3 mb-0">
											<span class="wrap"> <span
												class="d-flex theme-text-accent-one"> <span
													class="fw-bold price theme-text-secondary">地址：${restaurantaddresses[1]}
												</span>
											</span> <c:choose>
													<c:when test="${restaurantratings[1] > 4.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${restaurantratings[1] > 4.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:when test="${restaurantratings[1] > 3.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${restaurantratings[1] > 3.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:when test="${restaurantratings[1] > 2.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${restaurantratings[1] > 2.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:when test="${restaurantratings[1] > 1.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${restaurantratings[1] > 1.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:when test="${restaurantratings[1] > 0.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${restaurantratings[1] > 0.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:otherwise>
														<span class="text-yellow"> 暂无评价 </span>
													</c:otherwise>
												</c:choose>
											</span>
											<button type="submit"
												class="btn custom-btn-primary font-small fw-bold button-effect"
												onclick="return reserve(2)">预定</button>
										</div>
									</div>
								</div>
							</div>
							<!-- repetable element -->
							<div class="item">
								<div class="col-12 mb-3">
									<div class="d-flex flex-column">
										<div class="head">
											<span class="d-inline-flex location"><i
												class="bi bi-geo-alt"></i></span> <span
												class="d-inline-flex pb-2 font-small theme-text-accent-one"><%=session.getAttribute("destination")%></span>
										</div>
										<span class="mb-0 pb-2 theme-text-secondary">${restaurantNames[2]}</span>
										<div
											class="picHeight overflow-hidden hoverShine theme-border-radius-top">
											<figure class="mb-0 img-effect" style="height:250px;">
												<img src="${restaurantimageUrls[2]}" class="img-fluid"
													style="width: 100%;height:100%;" alt="Deals One"
													title="Deals One">
											</figure>
											<div class="airline-tags position-absolute">
												<div class="flood-effect airline-icon">
													<a href="#" class="font-small px-2">${restaurantTels[2]}</a>
												</div>
											</div>
										</div>
										<div
											class="d-flex flex-row justify-content-between position-relative py-3 mb-0">
											<span class="wrap"> <span
												class="d-flex theme-text-accent-one"> <span
													class="fw-bold price theme-text-secondary">地址：${restaurantaddresses[2]}
												</span>
											</span> <c:choose>
													<c:when test="${restaurantratings[2] > 4.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${restaurantratings[2] > 4.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:when test="${restaurantratings[2] > 3.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${restaurantratings[2] > 3.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:when test="${restaurantratings[2] > 2.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${restaurantratings[2] > 2.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:when test="${restaurantratings[2] > 1.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${restaurantratings[2] > 1.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:when test="${restaurantratings[2] > 0.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${restaurantratings[2] > 0.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:otherwise>
														<span class="text-yellow"> 暂无评价 </span>
													</c:otherwise>
												</c:choose>
											</span>
											<button type="submit"
												class="btn custom-btn-primary font-small fw-bold button-effect"
												onclick="return reserve(3)">预定</button>
										</div>
									</div>
								</div>
							</div>
							<!-- repetable element -->
							<div class="item">
								<div class="col-12 mb-3">
									<div class="d-flex flex-column">
										<div class="head">
											<span class="d-inline-flex location"><i
												class="bi bi-geo-alt"></i></span> <span
												class="d-inline-flex pb-2 font-small theme-text-accent-one"><%=session.getAttribute("destination")%></span>
										</div>
										<span class="mb-0 pb-2 theme-text-secondary">${restaurantNames[3]}</span>
										<div
											class="picHeight overflow-hidden hoverShine theme-border-radius-top">
											<figure class="mb-0 img-effect" style="height:250px;">
												<img src="${restaurantimageUrls[3]}" class="img-fluid"
													style="width: 100%;height:100%;" alt="Deals One"
													title="Deals One">
											</figure>
											<div class="airline-tags position-absolute">
												<div class="flood-effect airline-icon">
													<a href="#" class="font-small px-2">${restaurantTels[3]}</a>
												</div>
											</div>
										</div>
										<div
											class="d-flex flex-row justify-content-between position-relative py-3 mb-0">
											<span class="wrap"> <span
												class="d-flex theme-text-accent-one"> <span
													class="fw-bold price theme-text-secondary">地址：${restaurantaddresses[3]}
												</span>
											</span> <c:choose>
													<c:when test="${restaurantratings[3] > 4.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${restaurantratings[3] > 4.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:when test="${restaurantratings[3] > 3.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${restaurantratings[3] > 3.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:when test="${restaurantratings[3] > 2.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${restaurantratings[3] > 2.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:when test="${restaurantratings[3] > 1.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${restaurantratings[3] > 1.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:when test="${restaurantratings[3] > 0.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${restaurantratings[3] > 0.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:otherwise>
														<span class="text-yellow"> 暂无评价 </span>
													</c:otherwise>
												</c:choose>
											</span>
											<button type="submit"
												class="btn custom-btn-primary font-small fw-bold button-effect"
												onclick="return reserve(4)">预定</button>
										</div>
									</div>
								</div>
							</div>
							<!-- repetable element -->
							<div class="item">
								<div class="col-12 mb-3">
									<div class="d-flex flex-column">
										<div class="head">
											<span class="d-inline-flex location"><i
												class="bi bi-geo-alt"></i></span> <span
												class="d-inline-flex pb-2 font-small theme-text-accent-one"><%=session.getAttribute("destination")%></span>
										</div>
										<span class="mb-0 pb-2 theme-text-secondary">${restaurantNames[4]}</span>
										<div
											class="picHeight overflow-hidden hoverShine theme-border-radius-top">
											<figure class="mb-0 img-effect" style="height:250px;">
												<img src="${restaurantimageUrls[4]}" class="img-fluid"
													style="width: 100%;height:100%;" alt="Deals One"
													title="Deals One">
											</figure>
											<div class="airline-tags position-absolute">
												<div class="flood-effect airline-icon">
													<a href="#" class="font-small px-2">${restaurantTels[4]}</a>
												</div>
											</div>
										</div>
										<div
											class="d-flex flex-row justify-content-between position-relative py-3 mb-0">
											<span class="wrap"> <span
												class="d-flex theme-text-accent-one"> <span
													class="fw-bold price theme-text-secondary">地址：${restaurantaddresses[4]}
												</span>
											</span> <c:choose>
													<c:when test="${restaurantratings[4] > 4.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${restaurantratings[4] > 4.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:when test="${restaurantratings[4] > 3.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${restaurantratings[4] > 3.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:when test="${restaurantratings[4] > 2.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${restaurantratings[4] > 2.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:when test="${restaurantratings[4] > 1.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${restaurantratings[4] > 1.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:when test="${restaurantratings[4] > 0.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${restaurantratings[4] > 0.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:otherwise>
														<span class="text-yellow"> 暂无评价 </span>
													</c:otherwise>
												</c:choose>
											</span>
											<button type="submit"
												class="btn custom-btn-primary font-small fw-bold button-effect"
												onclick="return reserve(5)">预定</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<section class="special-deal pb-5" id="featuredFlights">
			<div class="container">
				<div class="row my-5">
					<div class="row align-items-center py-8">
						<div class="col-12 col-lg-6">
							<h4 class="display-4 theme-text-secondary fw-bold mb-3">
								舒适安静 <span class="high-text">宾馆</span>
							</h4>
							<p class="theme-text-accent-one mb-0">在这座城市中的精品酒店，融合了现代设计和传统风情，提供舒适宁静的住宿体验。无论您是探索城市还是休闲度假，这里都是您放松身心、感受城市魅力的理想选择。</p>
						</div>
					</div>
				</div>
				<!-- promotional Slider -->
				<div class="row">
					<div class="col-12">
						<div class="owl-carousel owl-theme" id="carouselReview">
							<!-- repetable element -->
							<div class="item">
								<div class="col-12 mb-3">
									<div class="d-flex flex-column">
										<div class="head">
											<span class="d-inline-flex location"><i
												class="bi bi-geo-alt"></i></span> <span
												class="d-inline-flex pb-2 font-small theme-text-accent-one"><%=session.getAttribute("destination")%>
											</span>
										</div>
										<span class="mb-0 pb-2 theme-text-secondary">${hotelNames[0]}</span>
										<div
											class="picHeight overflow-hidden hoverShine theme-border-radius-top">
											<figure class="mb-0 img-effect" style="height:250px;">
												<img src="${hotelimageUrls[0]}" class="img-fluid"
													style="width: 100%;height:100%;" alt="Deals One"
													title="Deals One">
											</figure>
											<div class="airline-tags position-absolute">
												<div class="flood-effect airline-icon">
													<a href="#" class="font-small px-2">${hotelTels[0]}</a>
												</div>
											</div>
										</div>
										<div
											class="d-flex flex-row justify-content-between position-relative py-3 mb-0">
											<span class="wrap"> <span
												class="d-flex theme-text-accent-one"> <span
													class="fw-bold price theme-text-secondary">地址：${hoteladdresses[0]}
												</span>
											</span> <c:choose>
													<c:when test="${hotelratings[0] > 4.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${hotelratings[0] > 4.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:when test="${hotelratings[0] > 3.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${hotelratings[0] > 3.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:when test="${hotelratings[0] > 2.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${hotelratings[0] > 2.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:when test="${hotelratings[0] > 1.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${hotelratings[0] > 1.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:when test="${hotelratings[0] > 0.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${hotelratings[0] > 0.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:otherwise>
														<span class="text-yellow"> 暂无评价 </span>
													</c:otherwise>
												</c:choose>
											</span>
											<button type="submit"
												class="btn custom-btn-primary font-small fw-bold button-effect"
												onclick="return reserve(6)">预定</button>
										</div>
									</div>
								</div>
							</div>
							<!-- repetable element -->
							<div class="item">
								<div class="col-12 mb-3">
									<div class="d-flex flex-column">
										<div class="head">
											<span class="d-inline-flex location"><i
												class="bi bi-geo-alt"></i></span> <span
												class="d-inline-flex pb-2 font-small theme-text-accent-one"><%=session.getAttribute("destination")%></span>
										</div>
										<span class="mb-0 pb-2 theme-text-secondary">${hotelNames[1]}</span>
										<div
											class="picHeight overflow-hidden hoverShine theme-border-radius-top">
											<figure class="mb-0 img-effect" style="height:250px;">
												<img src="${hotelimageUrls[1]}" class="img-fluid"
													style="width: 100%;height:100%;" alt="Deals One"
													title="Deals One">
											</figure>
											<div class="airline-tags position-absolute">
												<div class="flood-effect airline-icon">
													<a href="#" class="font-small px-2">${hotelTels[1]}</a>
												</div>
											</div>
										</div>
										<div
											class="d-flex flex-row justify-content-between position-relative py-3 mb-0">
											<span class="wrap"> <span
												class="d-flex theme-text-accent-one"> <span
													class="fw-bold price theme-text-secondary">地址：${hoteladdresses[1]}
												</span>
											</span> <c:choose>
													<c:when test="${hotelratings[1] > 4.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${hotelratings[1] > 4.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:when test="${hotelratings[1] > 3.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${hotelratings[1] > 3.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:when test="${hotelratings[1] > 2.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${hotelratings[1] > 2.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:when test="${hotelratings[1] > 1.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${hotelratings[1] > 1.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:when test="${hotelratings[1] > 0.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${hotelratings[1] > 0.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:otherwise>
														<span class="text-yellow"> 暂无评价 </span>
													</c:otherwise>
												</c:choose>
											</span>
											<button type="submit"
												class="btn custom-btn-primary font-small fw-bold button-effect"
												onclick="return reserve(7)">预定</button>
										</div>
									</div>
								</div>
							</div>
							<!-- repetable element -->
							<div class="item">
								<div class="col-12 mb-3">
									<div class="d-flex flex-column">
										<div class="head">
											<span class="d-inline-flex location"><i
												class="bi bi-geo-alt"></i></span> <span
												class="d-inline-flex pb-2 font-small theme-text-accent-one"><%=session.getAttribute("destination")%></span>
										</div>
										<span class="mb-0 pb-2 theme-text-secondary">${hotelNames[2]}</span>
										<div
											class="picHeight overflow-hidden hoverShine theme-border-radius-top">
											<figure class="mb-0 img-effect" style="height:250px;">
												<img src="${hotelimageUrls[2]}" class="img-fluid"
													style="width: 100%;height:100%;" alt="Deals One"
													title="Deals One">
											</figure>
											<div class="airline-tags position-absolute">
												<div class="flood-effect airline-icon">
													<a href="#" class="font-small px-2">${hotelTels[2]}</a>
												</div>
											</div>
										</div>
										<div
											class="d-flex flex-row justify-content-between position-relative py-3 mb-0">
											<span class="wrap"> <span
												class="d-flex theme-text-accent-one"> <span
													class="fw-bold price theme-text-secondary">地址：${hoteladdresses[2]}
												</span>
											</span> <c:choose>
													<c:when test="${hotelratings[2] > 4.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${hotelratings[2] > 4.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:when test="${hotelratings[2] > 3.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${hotelratings[2] > 3.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:when test="${hotelratings[2] > 2.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${hotelratings[2] > 2.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:when test="${hotelratings[2] > 1.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${hotelratings[2] > 1.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:when test="${hotelratings[2] > 0.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${hotelratings[2] > 0.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:otherwise>
														<span class="text-yellow"> 暂无评价 </span>
													</c:otherwise>
												</c:choose>
											</span>
											<button type="submit"
												class="btn custom-btn-primary font-small fw-bold button-effect"
												onclick="return reserve(8)">预定</button>
										</div>
									</div>
								</div>
							</div>
							<!-- repetable element -->
							<div class="item">
								<div class="col-12 mb-3">
									<div class="d-flex flex-column">
										<div class="head">
											<span class="d-inline-flex location"><i
												class="bi bi-geo-alt"></i></span> <span
												class="d-inline-flex pb-2 font-small theme-text-accent-one"><%=session.getAttribute("destination")%></span>
										</div>
										<span class="mb-0 pb-2 theme-text-secondary">${hotelNames[3]}</span>
										<div
											class="picHeight overflow-hidden hoverShine theme-border-radius-top">
											<figure class="mb-0 img-effect" style="height:250px;">
												<img src="${hotelimageUrls[3]}" class="img-fluid"
													style="width: 100%;height:100%;" alt="Deals One"
													title="Deals One">
											</figure>
											<div class="airline-tags position-absolute">
												<div class="flood-effect airline-icon">
													<a href="#" class="font-small px-2">${hotelTels[3]}</a>
												</div>
											</div>
										</div>
										<div
											class="d-flex flex-row justify-content-between position-relative py-3 mb-0">
											<span class="wrap"> <span
												class="d-flex theme-text-accent-one"> <span
													class="fw-bold price theme-text-secondary">地址：${hoteladdresses[3]}
												</span>
											</span> <c:choose>
													<c:when test="${hotelratings[3] > 4.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${hotelratings[3] > 4.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:when test="${hotelratings[3] > 3.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${hotelratings[3] > 3.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:when test="${hotelratings[3] > 2.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${hotelratings[3] > 2.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:when test="${hotelratings[3] > 1.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${hotelratings[3] > 1.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:when test="${hotelratings[3] > 0.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${hotelratings[3] > 0.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:otherwise>
														<span class="text-yellow"> 暂无评价 </span>
													</c:otherwise>
												</c:choose>
											</span>
											<button type="submit"
												class="btn custom-btn-primary font-small fw-bold button-effect"
												onclick="return reserve(9)">预定</button>
										</div>
									</div>
								</div>
							</div>
							<!-- repetable element -->
							<div class="item">
								<div class="col-12 mb-3">
									<div class="d-flex flex-column">
										<div class="head">
											<span class="d-inline-flex location"><i
												class="bi bi-geo-alt"></i></span> <span
												class="d-inline-flex pb-2 font-small theme-text-accent-one"><%=session.getAttribute("destination")%></span>
										</div>
										<span class="mb-0 pb-2 theme-text-secondary">${hotelNames[4]}</span>
										<div
											class="picHeight overflow-hidden hoverShine theme-border-radius-top">
											<figure class="mb-0 img-effect" style="height:250px;">
												<img src="${hotelimageUrls[4]}" class="img-fluid"
													style="width: 100%;height:100%;" alt="Deals One"
													title="Deals One">
											</figure>
											<div class="airline-tags position-absolute">
												<div class="flood-effect airline-icon">
													<a href="#" class="font-small px-2">${hotelTels[4]}</a>
												</div>
											</div>
										</div>
										<div
											class="d-flex flex-row justify-content-between position-relative py-3 mb-0">
											<span class="wrap"> <span
												class="d-flex theme-text-accent-one"> <span
													class="fw-bold price theme-text-secondary">地址：${hoteladdresses[4]}
												</span>
											</span> <c:choose>
													<c:when test="${hotelratings[4] > 4.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${hotelratings[4] > 4.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:when test="${hotelratings[4] > 3.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${hotelratings[4] > 3.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:when test="${hotelratings[4] > 2.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i> <i
															class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${hotelratings[4] > 2.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
															<i class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:when test="${hotelratings[4] > 1.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${hotelratings[4] > 1.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i> <i class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:when test="${hotelratings[4] > 0.5}">
														<span class="text-yellow"> <i
															class="bi bi-star-fill"></i>
														</span>
													</c:when>
													<c:when test="${hotelratings[4] > 0.0}">
														<span class="text-yellow"> <i
															class="bi bi-star-half"></i>
														</span>
													</c:when>
													<c:otherwise>
														<span class="text-yellow"> 暂无评价 </span>
													</c:otherwise>
												</c:choose>
											</span>
											<button type="submit"
												class="btn custom-btn-primary font-small fw-bold button-effect"
												onclick="return reserve(10)">预定</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<section class="special-deal pb-5" id="featuredFlights">
			<div class="container">
				<div class="row my-5">
					<div class="row align-items-center py-8">
						<div class="col-12 col-lg-6">
							<h4 class="display-4 theme-text-secondary fw-bold mb-3">
								风景优美 <span class="high-text">景点</span>
							</h4>
							<p class="theme-text-accent-one mb-0">探索古老的历史博物馆，漫步风景如画的公园，感受现代艺术的魅力画廊，品尝地道美食，体验当地文化和传统手工艺品。城市的每个角落都充满着独特的魅力，等待着您的发现和探索。</p>
						</div>
					</div>
				</div>
				<!-- promotional Slider -->
				<div class="row">
					<div class="col-12">
						<div class="owl-carousel owl-theme" id="carouselPromo">
							<!-- repetable element -->
							<div class="item">
								<div class="col-12 mb-3">
									<div class="d-flex flex-column">
										<div class="head">
											<span class="d-inline-flex location"><i
												class="bi bi-geo-alt"></i></span> <span
												class="d-inline-flex pb-2 font-small theme-text-accent-one"><%=session.getAttribute("destination")%>
											</span>
										</div>
										<span class="mb-0 pb-2 theme-text-secondary">${attractionNames[0]}</span>
										<div
											class="picHeight overflow-hidden hoverShine theme-border-radius-top">
											<figure class="mb-0 img-effect" style="height:250px;">
												<img src="${attractionimageUrls[0]}" class="img-fluid"
													style="width: 100%;height:100%;" alt="Deals One"
													title="Deals One">
											</figure>
											<div class="airline-tags position-absolute">
												<div class="flood-effect airline-icon">
													<a href="#" class="font-small px-2">开放时间：${attractionOpenTime[0]}</a>
												</div>
											</div>
										</div>
										<div
											class="d-flex flex-row justify-content-between position-relative py-3 mb-0">
											<span class="wrap"> <span
												class="d-flex theme-text-accent-one"> <span
													class="fw-bold price theme-text-secondary">地址：${attractionAddress[0]}
												</span>
											</span> <span class="text-yellow">
													票价：${attractionTicketPrice[0]} </span>
											</span>
											<button type="submit"
												class="btn custom-btn-primary font-small fw-bold button-effect"
												onclick="return reserve(11)">预定</button>
										</div>
									</div>
								</div>
							</div>
							<!-- repetable element -->
							<div class="item">
								<div class="col-12 mb-3">
									<div class="d-flex flex-column">
										<div class="head">
											<span class="d-inline-flex location"><i
												class="bi bi-geo-alt"></i></span> <span
												class="d-inline-flex pb-2 font-small theme-text-accent-one"><%=session.getAttribute("destination")%></span>
										</div>
										<span class="mb-0 pb-2 theme-text-secondary">${attractionNames[1]}</span>
										<div
											class="picHeight overflow-hidden hoverShine theme-border-radius-top">
											<figure class="mb-0 img-effect" style="height:250px;">
												<img src="${attractionimageUrls[1]}" class="img-fluid"
													style="width: 100%;height:100%;" alt="Deals One"
													title="Deals One">
											</figure>
											<div class="airline-tags position-absolute">
												<div class="flood-effect airline-icon">
													<a href="#" class="font-small px-2">开放时间：${attractionOpenTime[1]}</a>
												</div>
											</div>
										</div>
										<div
											class="d-flex flex-row justify-content-between position-relative py-3 mb-0">
											<span class="wrap"> <span
												class="d-flex theme-text-accent-one"> <span
													class="fw-bold price theme-text-secondary">地址：${attractionAddress[1]}
												</span>
											</span> <span class="text-yellow">
													票价：${attractionTicketPrice[1]} </span>
											</span>
											<button type="submit"
												class="btn custom-btn-primary font-small fw-bold button-effect"
												onclick="return reserve(12)">预定</button>
										</div>
									</div>
								</div>
							</div>
							<!-- repetable element -->
							<div class="item">
								<div class="col-12 mb-3">
									<div class="d-flex flex-column">
										<div class="head">
											<span class="d-inline-flex location"><i
												class="bi bi-geo-alt"></i></span> <span
												class="d-inline-flex pb-2 font-small theme-text-accent-one"><%=session.getAttribute("destination")%></span>
										</div>
										<span class="mb-0 pb-2 theme-text-secondary">${attractionNames[2]}</span>
										<div
											class="picHeight overflow-hidden hoverShine theme-border-radius-top">
											<figure class="mb-0 img-effect" style="height:250px;">
												<img src="${attractionimageUrls[2]}" class="img-fluid"
													style="width: 100%;height:100%;" alt="Deals One"
													title="Deals One">
											</figure>
											<div class="airline-tags position-absolute">
												<div class="flood-effect airline-icon">
													<a href="#" class="font-small px-2">开放时间：${attractionOpenTime[2]}</a>
												</div>
											</div>
										</div>
										<div
											class="d-flex flex-row justify-content-between position-relative py-3 mb-0">
											<span class="wrap"> <span
												class="d-flex theme-text-accent-one"> <span
													class="fw-bold price theme-text-secondary">地址：${attractionAddress[2]}
												</span>
											</span> <span class="text-yellow">
													票价：${attractionTicketPrice[2]} </span>
											</span>
											<button type="submit"
												class="btn custom-btn-primary font-small fw-bold button-effect"
												onclick="return reserve(13)">预定</button>
										</div>
									</div>
								</div>
							</div>
							<!-- repetable element -->
							<div class="item">
								<div class="col-12 mb-3">
									<div class="d-flex flex-column">
										<div class="head">
											<span class="d-inline-flex location"><i
												class="bi bi-geo-alt"></i></span> <span
												class="d-inline-flex pb-2 font-small theme-text-accent-one"><%=session.getAttribute("destination")%></span>
										</div>
										<span class="mb-0 pb-2 theme-text-secondary">${attractionNames[3]}</span>
										<div
											class="picHeight overflow-hidden hoverShine theme-border-radius-top">
											<figure class="mb-0 img-effect" style="height:250px;">
												<img src="${attractionimageUrls[3]}" class="img-fluid"
													style="width: 100%;height:100%;" alt="Deals One"
													title="Deals One">
											</figure>
											<div class="airline-tags position-absolute">
												<div class="flood-effect airline-icon">
													<a href="#" class="font-small px-2">开放时间：${attractionOpenTime[3]}</a>
												</div>
											</div>
										</div>
										<div
											class="d-flex flex-row justify-content-between position-relative py-3 mb-0">
											<span class="wrap"> <span
												class="d-flex theme-text-accent-one"> <span
													class="fw-bold price theme-text-secondary">地址：${attractionAddress[3]}
												</span>
											</span> <span class="text-yellow">
													票价：${attractionTicketPrice[3]} </span>
											</span>
											<button type="submit"
												class="btn custom-btn-primary font-small fw-bold button-effect"
												onclick="return reserve(14)">预定</button>
										</div>
									</div>
								</div>
							</div>
							<!-- repetable element -->
							<div class="item">
								<div class="col-12 mb-3">
									<div class="d-flex flex-column">
										<div class="head">
											<span class="d-inline-flex location"><i
												class="bi bi-geo-alt"></i></span> <span
												class="d-inline-flex pb-2 font-small theme-text-accent-one"><%=session.getAttribute("destination")%></span>
										</div>
										<span class="mb-0 pb-2 theme-text-secondary">${attractionNames[4]}</span>
										<div
											class="picHeight overflow-hidden hoverShine theme-border-radius-top">
											<figure class="mb-0 img-effect" style="height:250px;">
												<img src="${attractionimageUrls[4]}" class="img-fluid"
													style="width: 100%;height:100%;" alt="Deals One"
													title="Deals One">
											</figure>
											<div class="airline-tags position-absolute">
												<div class="flood-effect airline-icon">
													<a href="#" class="font-small px-2">开放时间：${attractionOpenTime[4]}</a>
												</div>
											</div>
										</div>
										<div
											class="d-flex flex-row justify-content-between position-relative py-3 mb-0">
											<span class="wrap"> <span
												class="d-flex theme-text-accent-one"> <span
													class="fw-bold price theme-text-secondary">地址：${attractionAddress[4]}
												</span>
											</span> <span class="text-yellow">
													票价：${attractionTicketPrice[4]} </span>
											</span>
											<button type="submit"
												class="btn custom-btn-primary font-small fw-bold button-effect"
												onclick="return reserve(15)">预定</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>


		<footer class="footer py-5">
			<div class="container">
				<div class="row g-0 subscribe" id="contact">
					<div class="col-12 col-lg-12 box">
						<div class="row">
							<div class="col-12 col-lg-8 m-auto text-center">
								<h4 class="display-4 fw-bold theme-text-secondary mb-3">
									诚心接受您的 <span class="high-text">评价</span>
								</h4>
								<p class="mb-3 theme-text-accent-one lh-lg">亲爱的用户，满意我们的旅行推荐服务吗？欢迎分享您的意见和建议，帮助我们不断改进！</p>
							</div>
							<div id="starRating" style="text-align: center;">
								<p class="photo">
									<span><i class="high"></i><i class="nohigh"></i></span> <span><i
										class="high"></i><i class="nohigh"></i></span> <span><i
										class="high"></i><i class="nohigh"></i></span> <span><i
										class="high"></i><i class="nohigh"></i></span> <span><i
										class="high"></i><i class="nohigh"></i></span>
								</p>
								<p class="starNum" name="score" data-score="0.0">0.0</p>
							</div>
							<div class="col-12 col-lg-8 offset-lg-2 mt-5">
								<div class="input-group">
									<input type="text" name="inputComment"
										class="form-control border-0 rounded-pill"
										placeholder="在此输入评论">
									<button
										class="btn custom-btn-primary button-effect px-3 px-lg-5"
										type="submit" id="button-addon2"
										onclick="return comment(this.form)">
										<i class="bi bi-send-check me-1"></i> <span>提交</span>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row mb-5">
					<div class="col-12 col-lg-4 mb-3 mb-md-0">
						<div class="d-flex align-items-center p-0 p-md-5">
							<div class="flex-shrink-0 circle">
								<i class="bi bi-phone-fill fs-4 lh-1"></i>
							</div>
							<div class="flex-grow-1 ms-3 fw-bold">
								电话<br> <span class="fs-5">15542221631</span>
							</div>
						</div>
					</div>
					<div class="col-12 col-lg-4 mb-3 mb-md-0 p-0 p-md-5">
						<div class="d-flex align-items-center">
							<div class="flex-shrink-0 circle">
								<i class="bi bi-envelope-fill fs-4 lh-1"></i>
							</div>
							<div class="flex-grow-1 ms-3 fw-bold">
								邮箱 <br> <a href="#" class="fs-5 text-reset">2787510684@qq.com</a>
							</div>
						</div>
					</div>
					<div class="col-12 col-lg-4 mb-3 mb-md-0 p-0 p-md-5">
						<div class="d-flex align-items-center">
							<div class="flex-shrink-0 circle">
								<i class="bi bi-chat-dots-fill fs-4 lh-1"></i>
							</div>
							<div class="flex-grow-1 ms-3 fw-bold">
								微信<br> <span class="fs-5">sssmx0206</span>
							</div>
						</div>
					</div>
				</div>
				<div class="row mt-5">
					<div class="col-12 col-lg-3">
						<img src="static/picture/brand-dark.png" class="img-fluid"
							alt="Brand Dark">
					</div>
				</div>
				<div class="row pt-3">
					<div class="col-12 col-lg-12 text-center">
						<p class="pt-2 mb-0 font-small">
							版权声明 &copy; 1999-2024 | <a href="https://www.situ.edu.cn/">沈阳工学院</a>
							| 宋明旭2031030153
						</p>
					</div>
				</div>
			</div>
			<a href="#wrapper" data-type="section-switch"
				class="scrollup back-top"><i class="bi bi-airplane"></i> <span
				class="font-extra-small">Goto Top</span></a>
		</footer>
	</form>

	<script src="static/js/jquery.js"></script>
	<script src="static/js/bootstrap.bundle.min.js"></script>
	<script src="static/js/jquery.min.js"></script>
	<script src="static/js/owl.carousel.min.js"></script>
	<script src="static/js/jquery-ui.js"></script>
	<script src="static/js/jquery.magnific-popup.min.js"></script>
	<script src="static/js/main.js"></script>
	<script src="static/js/sweetalert-dev.js"></script>
	<script>
		function reserve(number) {
			var oldPhone = document.getElementById('phone_number').value;
			if (oldPhone == "") {
				swal("请先绑定手机号", "", "error");
				return false;
			} else {
				var recommendations = document
						.getElementById("recommendations");
				var operationType = document.getElementById("operationType");
				operationType.value = number;
				recommendations.submit();
			}
		}

		function comment(form) {
			var inputComment = form.inputComment.value.trim();
			var starRatingValue = document.getElementById("starRatingInput").value;
			if (inputComment == "") {
				swal("请输入评论", "", "error");
				return false;
			} else if (inputComment.length <= 10) {
				swal("评论需至少大于十个字符", "", "error");
				return false;
			} else if (starRatingValue == "") {
				swal("请评分", "", "error");
				return false;
			} else {
				var recommendations = document
						.getElementById("recommendations");
				var operationType = document.getElementById("operationType");
				operationType.value = "comment";
				recommendations.submit();
			}
		}

		$(function() {
			//评分
			var starRating = 0;
			$('.photo span').on('mouseenter', function() {
				var index = $(this).index() + 1;
				$(this).prevAll().find('.high').css('z-index', 1);
				$(this).find('.high').css('z-index', 1);
				$(this).nextAll().find('.high').css('z-index', 0);
				$('.starNum').html((index).toFixed(1));
			});
			$('.photo').on(
					'mouseleave',
					function() {
						$(this).find('.high').css('z-index', 0);
						var count = starRating;
						if (count == 5) {
							$('.photo span').find('.high').css('z-index', 1);
						} else {
							$('.photo span').eq(count).prevAll().find('.high')
									.css('z-index', 1);
						}
						$('.starNum').html(starRating.toFixed(1));
					});

			$('#recommendations')
					.append(
							'<input type="hidden" name="starRating" id="starRatingInput">');
			$('.photo span').on('click', function() {
				var index = $(this).index() + 1;
				$(this).prevAll().find('.high').css('z-index', 1);
				$(this).find('.high').css('z-index', 1);
				starRating = index;
				$('#starRatingInput').val(starRating); // 设置隐藏input元素的值
				$('.starNum').html(starRating.toFixed(1));
			});
		});
	</script>
	<c:if test="${not empty successMsg}">
		<script>
			swal("${successMsg}", "", "success");
			window.history.replaceState(null, null, window.location.href);
		</script>
	</c:if>
	<c:if test="${not empty infoMsg}">
		<script>
			swal("${infoMsg}", "每次推荐只能评论一次", "error");
			window.history.replaceState(null, null, window.location.href);
		</script>
	</c:if>
</body>

</html>
