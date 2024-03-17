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

<title>最美辽宁</title>
</head>

<body>
	<%@ include file="header.jsp"%>

	<section class="hero" id="home">
		<div class="container">
			<div class="row align-items-center py-8">
				<div class="col-12 col-xl-6 position-relative" id="hero">
					<h1
						class="display-2 fw-bold mb-4 theme-text-secondary theme-text-shadow pe-lg-5">
						计划 <span class="high-text">探索</span> 新辽宁
					</h1>
					<p class="mb-0 theme-text-accent-one theme-text-shadow mb-5">宋明旭代理与团队拥有帮助您成为旅行领导者的经验和动力。</p>
					<!-- search engine -->
					<div
						class="theme-box-shadow theme-border-radius p-3 theme-bg-white">
						<form id="search" class="row g-2 align-self-center" method="post"
							action="IndexServlet">
							<div class="col-12 col-md-4">
								<label for="inputCity" class="form-label mb-0 fw-bold">目的地</label>
								<i class="bi bi-chevron-down theme-text-primary ps-2"></i> <select
									class="form-select border-0 font-small" name=destination
									id="destination">
									<option value="" selected="selected">--请选择--</option>
									<optgroup label="沈阳">
										<option value="沈河区">沈河区</option>
										<option value="和平区">和平区</option>
										<option value="大东区">大东区</option>
										<option value="皇姑区">皇姑区</option>
										<option value="铁西区沈">铁西区沈</option>
										<option value="苏家屯区">苏家屯区</option>
										<option value="浑南区">浑南区</option>
										<option value="于洪区">于洪区</option>
										<option value="辽中区">辽中区</option>
										<option value="沈北新区">沈北新区</option>
										<option value="新民市">新民市</option>
										<option value="康平县">康平县</option>
										<option value="法库县">法库县</option>
									</optgroup>
									<optgroup label="大连">
										<option value="西岗区">西岗区</option>
										<option value="中山区">中山区</option>
										<option value="沙河口区">沙河口区</option>
										<option value="甘井子区">甘井子区</option>
										<option value="旅顺口区">旅顺口区</option>
										<option value="金州区">金州区</option>
										<option value="西岗区普兰店区">普兰店区</option>
										<option value="庄河市">庄河市</option>
										<option value="瓦房店市">瓦房店市</option>
										<option value="长海县">长海县</option>
									</optgroup>
									<optgroup label="鞍山">
										<option value="铁东区">铁东区</option>
										<option value="铁西区鞍">铁西区鞍</option>
										<option value="立山区">立山区</option>
										<option value="千山区">千山区</option>
										<option value="海城市">海城市</option>
										<option value="台安县">台安县</option>
										<option value="岫岩满族自治县">岫岩满族自治县</option>
									</optgroup>
									<optgroup label="抚顺">
										<option value="新抚区">新抚区</option>
										<option value="东洲区">东洲区</option>
										<option value="望花区">望花区</option>
										<option value="顺城区">顺城区</option>
										<option value="抚顺县">抚顺县</option>
										<option value="清原满族自治县">清原满族自治县</option>
										<option value="新宾满族自治县">新宾满族自治县</option>
									</optgroup>
									<optgroup label="本溪">
										<option value="平山区">平山区</option>
										<option value="明山区">明山区</option>
										<option value="溪湖区">溪湖区</option>
										<option value="南芬区">南芬区</option>
										<option value="本溪满族自治县">本溪满族自治县</option>
										<option value="桓仁满族自治县">桓仁满族自治县</option>
									</optgroup>
									<optgroup label="丹东">
										<option value="元宝区">元宝区</option>
										<option value="振兴区">振兴区</option>
										<option value="振安区">振安区</option>
										<option value="东港市">东港市</option>
										<option value="凤城市">凤城市</option>
										<option value="宽甸满族自治县">宽甸满族自治县</option>
									</optgroup>
									<optgroup label="锦州">
										<option value="古塔区">古塔区</option>
										<option value="凌河区">凌河区</option>
										<option value="太和区">太和区</option>
										<option value="凌海市">凌海市</option>
										<option value="北镇市">北镇市</option>
										<option value="义县">义县</option>
										<option value="黑山县">黑山县</option>
									</optgroup>
									<optgroup label="营口">
										<option value="站前区">站前区</option>
										<option value="西市区">西市区</option>
										<option value="老边区">老边区</option>
										<option value="鲅鱼圈区">鲅鱼圈区</option>
										<option value="盖州市">盖州市</option>
										<option value="大石桥市">大石桥市</option>
									</optgroup>
									<optgroup label="阜新">
										<option value="海州区">海州区</option>
										<option value="新邱区">新邱区</option>
										<option value="太平区">太平区</option>
										<option value="细河区">细河区</option>
										<option value="清河门区">清河门区</option>
										<option value="彰武县">彰武县</option>
										<option value="阜新蒙古族自治县">阜新蒙古族自治县</option>
									</optgroup>
									<optgroup label="辽阳">
										<option value="白塔区">白塔区</option>
										<option value="文圣区">文圣区</option>
										<option value="宏伟区">宏伟区</option>
										<option value="弓长岭区">弓长岭区</option>
										<option value="太子河区">太子河区</option>
										<option value="清河门区">清河门区</option>
										<option value="灯塔市">灯塔市</option>
										<option value="辽阳县">辽阳县</option>
									</optgroup>
									<optgroup label="盘锦">
										<option value="大洼区">大洼区</option>
										<option value="双台子区">双台子区</option>
										<option value="兴隆台区">兴隆台区</option>
										<option value="盘山县">盘山县</option>
									</optgroup>
									<optgroup label="铁岭">
										<option value="银河区">银河区</option>
										<option value="清河区">清河区</option>
										<option value="开原市">开原市</option>
										<option value="调兵山市">调兵山市</option>
										<option value="铁岭县">铁岭县</option>
										<option value="西丰县">西丰县</option>
										<option value="昌图县">昌图县</option>
									</optgroup>
									<optgroup label="朝阳">
										<option value="双塔区">双塔区</option>
										<option value="龙城区">龙城区</option>
										<option value="北票市">北票市</option>
										<option value="凌源市">凌源市</option>
										<option value="朝阳县">朝阳县</option>
										<option value="建平县">建平县</option>
										<option value="喀喇沁左翼蒙古族自治县">喀喇沁左翼蒙古族自治县</option>
									</optgroup>
									<optgroup label="葫芦岛">
										<option value="连山区">连山区</option>
										<option value="龙港区">龙港区</option>
										<option value="南票区">南票区</option>
										<option value="兴城市">兴城市</option>
										<option value="绥中县">绥中县</option>
										<option value="建昌县">建昌县</option>
									</optgroup>
								</select>
							</div>
							<div class="col-12 col-md-3">
								<label for="datepicker" class="form-label mb-0 fw-bold">出发日期</label>
								<i class="bi bi-chevron-down theme-text-primary ps-2"></i> <input
									type="date"
									class="form-control border-0 ps-0 font-small cal-input"
									name="start_date">
							</div>
							<div class="col-12 col-md-3">
								<label for="inputState" class="form-label mb-0 fw-bold">习惯偏好</label>
								<i class="bi bi-chevron-down theme-text-primary ps-2"></i> <select
									id="inputState" class="form-select border-0 font-small"
									name="interests">
									<option value="" selected="selected">--请选择--</option>
									<option value="旅游景点">旅游景点</option>
									<option value="公园广场">公园广场</option>
									<option value="风景名胜">风景名胜</option>
									<option value="寺庙道观">寺庙道观</option>
									<option value="博物馆">博物馆</option>
								</select>
							</div>
							<div class="col-12 col-md-2">
								<button type="submit" onclick="return search(this.form)"
									class="btn custom-btn-secondary button-effect-sec font-small fw-bold button-effect h-100">
									<span class="d-none d-lg-blcok">Explore Now</span> <i
										class="bi bi-search fs-4"></i>
								</button>
							</div>
						</form>
					</div>
					<div class="my-5">
						<span class="fw-bold">热门旅游：</span>
						<ul class="d-flex flex-wrap">
							<li><a
								href="https://baike.baidu.com/item/%E6%B2%88%E9%98%B3%E5%B8%82/124784"
								target="_blank" class="theme-text-accent-one me-2">沈阳</a></li>
							<li><a
								href="https://baike.baidu.com/item/%E5%A4%A7%E8%BF%9E%E5%B8%82/127186"
								target="_blank" class="theme-text-accent-one me-2">大连</a></li>
							<li><a
								href="https://baike.baidu.com/item/%E9%9E%8D%E5%B1%B1%E5%B8%82/12425675"
								target="_blank" class="theme-text-accent-one me-2">鞍山</a></li>
							<li><a
								href="https://baike.baidu.com/item/%E6%8A%9A%E9%A1%BA%E5%B8%82/13025842"
								target="_blank" class="theme-text-accent-one me-2">抚顺</a></li>
							<li><a
								href="https://baike.baidu.com/item/%E6%9C%AC%E6%BA%AA%E5%B8%82/10378940"
								target="_blank" class="theme-text-accent-one me-2">本溪</a></li>
							<li><a
								href="https://baike.baidu.com/item/%E4%B8%B9%E4%B8%9C%E5%B8%82/10914841"
								target="_blank" class="theme-text-accent-one me-2">丹东</a></li>
						</ul>
					</div>
				</div>
				<!-- banner card section -->
				<div class="col-12 col-xl-6">
					<div class="row">
						<div class="col-12 col-md-6">
							<div
								class="d-flex flex-column theme-box-shadow theme-border-radius mb-3 animate-fly">
								<div
									class="picHeight overflow-hidden hoverShine theme-border-radius-top">
									<figure class="mb-0 img-effect">
										<img src="static/image/index01.jpg" class="img-fluid"
											alt="Deals One" title="Deals One">
									</figure>
								</div>
								<a href="#"
									class="position-relative py-3 px-3 mb-0 theme-border-radius-bottom card-effect theme-bg-white">
									<span class="fs-5 mb-0 pb-2 theme-text-accent-one">宋明旭代理
										# 环游辽宁</span>
									<div class="d-flex align-items-center">
										<div class="flex-grow-1">
											<span class="d-flex font-small theme-text-primary">制作者:宋明旭
											</span>
										</div>
										<div class="flex-shrink-0 ms-3">
											<img src="static/picture/icon-hero-card01.png" alt="avatar"
												class="rounded-pill">
										</div>
									</div>
								</a>
							</div>
							<div
								class="d-flex flex-column theme-box-shadow theme-border-radius mb-3 item2 mx-auto animate-fly">
								<div
									class="picHeight overflow-hidden hoverShine theme-border-radius-top">
									<figure class="mb-0 img-effect">
										<img src="static/image/index02.jpg" class="img-fluid"
											alt="Deals One" title="Deals One">
									</figure>
								</div>
								<a href="#"
									class="position-relative py-3 px-3 mb-0 theme-border-radius-bottom card-effect theme-bg-white">
									<span class="fs-5 mb-0 pb-2 theme-text-accent-one">景点预定
										# 团队</span>
									<div class="d-flex align-items-center">
										<div class="flex-grow-1">
											<span class="d-flex font-small theme-text-primary">制作者:宋明旭
											</span>
										</div>
										<div class="flex-shrink-0 ms-3">
											<img src="static/picture/icon-hero-card02.png" alt="avatar"
												class="rounded-pill">
										</div>
									</div>
								</a>
							</div>
						</div>
						<!-- repetable -->
						<div class="col-12 col-md-6 align-self-center">
							<div
								class="d-flex flex-column theme-box-shadow theme-border-radius mb-3 item3 animate-fly">
								<div
									class="picHeight overflow-hidden hoverShine theme-border-radius-top">
									<figure class="mb-0 img-effect">
										<img src="static/image/index03.jpg" class="img-fluid"
											alt="Deals One" title="Deals One">
									</figure>
								</div>
								<a href="#"
									class="position-relative py-3 px-3 mb-0 theme-border-radius-bottom card-effect theme-bg-white">
									<span class="fs-5 mb-0 pb-2 theme-text-accent-one">酒店预订
										# 团队</span>
									<div class="d-flex align-items-center">
										<div class="flex-grow-1">
											<span class="d-flex font-small theme-text-primary">制作者:宋明旭
											</span>
										</div>
										<div class="flex-shrink-0 ms-3">
											<img src="static/picture/icon-hero-card03.png" alt="avatar"
												class="rounded-pill">
										</div>
									</div>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="experience">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="wrap">
						<div class="row">
							<div class="col-12 col-lg-6 position-relative align-self-center"
								style="text-align: center;">
								<h4 class="display-4 theme-text-white mb-0 fw-bold">
									辽宁省旅游形象<br>宣传片
								</h4>
								<p class="fs-6 theme-text-white my-3">欢迎来到辽宁，这里有着悠久的历史和丰富的文化遗产，您可以探索沈阳故宫、大连海滨风光、锦州古城等地。品尝美食、体验温泉、感受传统风情，辽宁等待着您的光临！</p>
							</div>
							<div class="col-12 col-lg-6 position-relative">
								<div class="group custom-button"
									style="background-image: url(https://tse2-mm.cn.bing.net/th/id/OIP-C.iaDQvQb5lcRKP7YDyne5dQHaGM?rs=1&pid=ImgDetMain);">
									<div class="d-flex align-items-center">
										<a href="static/image/2023辽宁省旅游形象宣传片出炉-辽宁省_新浪新闻.mp4"
											class="video-icon video-icon2 mr-30 ml-20 video_model"> <i
											class="bi bi-play"></i>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<section class="testimonials py-5" id="testimonials">
		<div class="container">
			<div class="row">
				<div class="col-12 text-center">
					<h4 class="display-4 fw-bold theme-text-secondary mb-3">
						我们的<span class="high-text"> 用户 </span>评论
					</h4>
					<p class="mb-3 theme-text-accent-one lh-lg">用户评论的真实反馈是产品质量和服务水平的最直接体现。</p>
				</div>
			</div>
			<!-- testimonials slider content-->
			<div class="row">
				<div class="owl-carousel owl-theme" id="carouselReview">
					<div class="col-12 position-relative item">
						<div
							class="p-5 mt-5 mt-lg-0 theme-box-shadow theme-border-radius theme-bg-white text-center">
							<div class="d-flex flex-column justify-content-center mt-4">
								<div class="pic-wrap">
									<figure class="mb-0 avatar">
										<img src="static/picture/customer-avtar01.png"
											class="img-fluid" alt="client review">
									</figure>
								</div>
								<span class="text-yellow my-2"> <c:choose>
										<c:when test="${commentList.get(0).getRating() > 4.0}">
											<span class="text-yellow"> <i class="bi bi-star-fill"></i>
												<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
												<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
											</span>
										</c:when>
										<c:when test="${commentList.get(0).getRating() > 3.0}">
											<span class="text-yellow"> <i class="bi bi-star-fill"></i>
												<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
												<i class="bi bi-star-fill"></i>
											</span>
										</c:when>
										<c:when test="${commentList.get(0).getRating() > 2.0}">
											<span class="text-yellow"> <i class="bi bi-star-fill"></i>
												<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
											</span>
										</c:when>
										<c:when test="${commentList.get(0).getRating() > 1.0}">
											<span class="text-yellow"> <i class="bi bi-star-fill"></i>
												<i class="bi bi-star-fill"></i>
											</span>
										</c:when>
										<c:when test="${commentList.get(0).getRating() > 0.0}">
											<span class="text-yellow"> <i class="bi bi-star-fill"></i>
											</span>
										</c:when>
										<c:otherwise>
											<span class="text-yellow"> 暂无评价 </span>
										</c:otherwise>
									</c:choose>
								</span> <span class="mt-0"><strong>用户名：${userList.get(0).getUsername()}</strong></span>
								<span class="theme-text-accent-one font-small mb-3 fw-bold">目的地：${planList.get(0).getDestination()}</span>
							</div>
							<p
								class="theme-text-accent-one lh-lg font-small mb-0 pt-3 border-top">${commentList.get(0).getComment_text()}</p>
						</div>
					</div>
					<!-- repeatable-->
					<div class="col-12 position-relative item">
						<div
							class="p-5 mt-5 mt-lg-0 theme-box-shadow theme-border-radius theme-bg-white text-center">
							<div class="d-flex flex-column justify-content-center mt-4">
								<div class="pic-wrap">
									<figure class="mb-0 avatar">
										<img src="static/picture/customer-avtar02.png"
											class="img-fluid" alt="client review">
									</figure>
								</div>
								<span class="text-yellow my-2"> <c:choose>
										<c:when test="${commentList.get(1).getRating() > 4.0}">
											<span class="text-yellow"> <i class="bi bi-star-fill"></i>
												<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
												<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
											</span>
										</c:when>
										<c:when test="${commentList.get(1).getRating() > 3.0}">
											<span class="text-yellow"> <i class="bi bi-star-fill"></i>
												<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
												<i class="bi bi-star-fill"></i>
											</span>
										</c:when>
										<c:when test="${commentList.get(1).getRating() > 2.0}">
											<span class="text-yellow"> <i class="bi bi-star-fill"></i>
												<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
											</span>
										</c:when>
										<c:when test="${commentList.get(1).getRating() > 1.0}">
											<span class="text-yellow"> <i class="bi bi-star-fill"></i>
												<i class="bi bi-star-fill"></i>
											</span>
										</c:when>
										<c:when test="${commentList.get(1).getRating() > 0.0}">
											<span class="text-yellow"> <i class="bi bi-star-fill"></i>
											</span>
										</c:when>
										<c:otherwise>
											<span class="text-yellow"> 暂无评价 </span>
										</c:otherwise>
									</c:choose>
								</span> <span class="mt-0"><strong>用户名：${userList.get(1).getUsername()}</strong></span>
								<span class="theme-text-accent-one font-small mb-3 fw-bold">目的地：${planList.get(1).getDestination()}</span>
							</div>
							<p
								class="theme-text-accent-one lh-lg font-small mb-0 pt-3 border-top">${commentList.get(1).getComment_text()}</p>
						</div>
					</div>
					<!-- repeatable-->
					<div class="col-12 position-relative item">
						<div
							class="p-5 mt-5 mt-lg-0 theme-box-shadow theme-border-radius theme-bg-white text-center">
							<div class="d-flex flex-column justify-content-center mt-4">
								<div class="pic-wrap">
									<figure class="mb-0 avatar">
										<img src="static/picture/customer-avtar03.png"
											class="img-fluid" alt="client review">
									</figure>
								</div>
								<span class="text-yellow my-2"> <c:choose>
										<c:when test="${commentList.get(2).getRating() > 4.0}">
											<span class="text-yellow"> <i class="bi bi-star-fill"></i>
												<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
												<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
											</span>
										</c:when>
										<c:when test="${commentList.get(2).getRating() > 3.0}">
											<span class="text-yellow"> <i class="bi bi-star-fill"></i>
												<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
												<i class="bi bi-star-fill"></i>
											</span>
										</c:when>
										<c:when test="${commentList.get(2).getRating() > 2.0}">
											<span class="text-yellow"> <i class="bi bi-star-fill"></i>
												<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
											</span>
										</c:when>
										<c:when test="${commentList.get(2).getRating() > 1.0}">
											<span class="text-yellow"> <i class="bi bi-star-fill"></i>
												<i class="bi bi-star-fill"></i>
											</span>
										</c:when>
										<c:when test="${commentList.get(2).getRating() > 0.0}">
											<span class="text-yellow"> <i class="bi bi-star-fill"></i>
											</span>
										</c:when>
										<c:otherwise>
											<span class="text-yellow"> 暂无评价 </span>
										</c:otherwise>
									</c:choose>
								</span> <span class="mt-0"><strong>用户名：${userList.get(2).getUsername()}</strong></span>
								<span class="theme-text-accent-one font-small mb-3 fw-bold">目的地：${planList.get(2).getDestination()}</span>
							</div>
							<p
								class="theme-text-accent-one lh-lg font-small mb-0 pt-3 border-top">${commentList.get(2).getComment_text()}</p>
						</div>
					</div>
					<!-- repeatable-->
					<div class="col-12 position-relative item">
						<div
							class="p-5 mt-5 mt-lg-0 theme-box-shadow theme-border-radius theme-bg-white text-center">
							<div class="d-flex flex-column justify-content-center mt-4">
								<div class="pic-wrap">
									<figure class="mb-0 avatar">
										<img src="static/picture/customer-avtar04.png"
											class="img-fluid" alt="client review">
									</figure>
								</div>
								<span class="text-yellow my-2"> <c:choose>
										<c:when test="${commentList.get(3).getRating() > 4.0}">
											<span class="text-yellow"> <i class="bi bi-star-fill"></i>
												<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
												<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
											</span>
										</c:when>
										<c:when test="${commentList.get(3).getRating() > 3.0}">
											<span class="text-yellow"> <i class="bi bi-star-fill"></i>
												<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
												<i class="bi bi-star-fill"></i>
											</span>
										</c:when>
										<c:when test="${commentList.get(3).getRating() > 2.0}">
											<span class="text-yellow"> <i class="bi bi-star-fill"></i>
												<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
											</span>
										</c:when>
										<c:when test="${commentList.get(3).getRating() > 1.0}">
											<span class="text-yellow"> <i class="bi bi-star-fill"></i>
												<i class="bi bi-star-fill"></i>
											</span>
										</c:when>
										<c:when test="${commentList.get(3).getRating() > 0.0}">
											<span class="text-yellow"> <i class="bi bi-star-fill"></i>
											</span>
										</c:when>
										<c:otherwise>
											<span class="text-yellow"> 暂无评价 </span>
										</c:otherwise>
									</c:choose>
								</span> <span class="mt-0"><strong>用户名：${userList.get(3).getUsername()}</strong></span>
								<span class="theme-text-accent-one font-small mb-3 fw-bold">目的地：${planList.get(3).getDestination()}</span>
							</div>
							<p
								class="theme-text-accent-one lh-lg font-small mb-0 pt-3 border-top">${commentList.get(3).getComment_text()}</p>
						</div>
					</div>
					<!-- repeatable-->
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
		function search(form) {
			var destination = form.destination.value.trim();
			var start_date = form.start_date.value.trim();
			var interests = form.interests.value.trim();

			if (destination == "") {
				swal("请选择目的地", "", "error");
				return false;
			} else if (start_date == "") {
				swal("请选择出发日期", "", "error");
				return false;
			} else if (new Date(start_date) < new Date()) {
				swal("出发日期不能小于当前日期", "", "error");
				console.log(start_date);
				return false;
			} else if (interests == "") {
				swal("请选择习惯偏好", "", "error");
				return false;
			} else {
				var search = document.getElementById("search");
				search.submit();
			}
		}
	</script>

	<c:if test="${not empty infoMsg}">
		<script>
			swal("${infoMsg}", "", "warning");
			window.history.replaceState(null, null, window.location.href);
		</script>
	</c:if>
</body>

</html>