<%@page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html class="x-admin-sm">
<head>
<meta charset="UTF-8">
<title>餐厅列表</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="stylesheet" href="./css/font.css">
<link rel="stylesheet" href="./css/xadmin.css">

</head>
<body>
	<div class="x-nav">
		<span class="layui-breadcrumb"> <a href="">首页</a> <a href="">餐厅管理</a>
			<a> <cite>餐厅列表</cite></a>
		</span> <a class="layui-btn layui-btn-small"
			style="line-height:1.6em;margin-top:3px;float:right"
			onclick="location.reload()" title="刷新"> <i
			class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
	</div>
	<div class="layui-fluid">
		<div class="layui-row layui-col-space15">
			<div class="layui-col-md12">
				<div class="layui-card">
					<form id="frmRestaurantList" method="post"
						action="RestaurantListServlet" role="form">
						<input type="hidden" id="operationType" name="operationType"
							value="" /> <input type="hidden" id="restaurant_id"
							name="restaurant_id" value="" /><input type="hidden"
							id="restaurantIdList" name="restaurantIdList" value="" />
						<div class="layui-card-body">
							<button class="layui-btn layui-btn-danger"
								onclick="return delAll()">
								<i class="layui-icon"></i>批量删除
							</button>
							<a class="layui-btn" href="javascript:void(0);"
								onclick="addRestaurant()"> <i class="layui-icon"></i>添加
							</a>
						</div>
						<div class="layui-card-header"
							style="display: flex; justify-content: flex-end; margin-left: 0;">
							<div class="layui-form layui-col-space5">
								<div class="layui-inline layui-show-xs-block">
									<input type="text" name="searchUserId" placeholder="请输入用户id"
										autocomplete="off" class="layui-input">
								</div>
								<div class="layui-inline layui-show-xs-block">
									<button class="layui-btn" onclick="search()">
										<i class="layui-icon">&#xe615;</i>
									</button>
								</div>
							</div>
						</div>
						<div class="layui-card-body layui-table-body layui-table-main">
							<table class="layui-table layui-form">
								<thead>
									<tr>
										<th><input type="checkbox" lay-filter="checkall" name=""
											lay-skin="primary"></th>
										<th>ID</th>
										<th>餐厅名</th>
										<th>评分</th>
										<th>餐厅地址</th>
										<th>餐厅电话</th>
										<th>用户ID</th>
										<th>预约时间</th>
										<th>餐厅图片url</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${not empty searchRestaurants}">
											<c:forEach items="${searchRestaurants}"
												var="searchRestaurant">
												<tr>
													<td><input type="checkbox" name="id"
														value="${searchRestaurant.restaurant_id}"
														lay-skin="primary"></td>
													<td>${searchRestaurant.restaurant_id}</td>
													<td>${searchRestaurant.name}</td>
													<td>${searchRestaurant.rating}</td>
													<td>${searchRestaurant.address}</td>
													<td>${searchRestaurant.phone_number}</td>
													<td>${searchRestaurant.user_id}</td>
													<td>${searchRestaurant.start_date}</td>
													<td>${searchRestaurant.image_url}</td>
													<td class="td-manage"><a title="删除"
														onclick="remove(${searchRestaurant.restaurant_id})"
														href="javascript:;"> <i class="layui-icon">&#xe640;</i>
													</a></td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<c:forEach items="${restaurants}" var="restaurant">
												<tr>
													<td><input type="checkbox" name="id"
														value="${restaurant.restaurant_id}" lay-skin="primary"></td>
													<td>${restaurant.restaurant_id}</td>
													<td>${restaurant.name}</td>
													<td>${restaurant.rating}</td>
													<td>${restaurant.address}</td>
													<td>${restaurant.phone_number}</td>
													<td>${restaurant.user_id}</td>
													<td>${restaurant.start_date}</td>
													<td>${restaurant.image_url}</td>
													<td class="td-manage"><a title="删除"
														onclick="remove(${restaurant.restaurant_id});"
														href="javascript:;"> <i class="layui-icon">&#xe640;</i>
													</a></td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="./lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="./js/xadmin.js"></script>
<script>
	layui.use([ 'laydate', 'form' ], function() {
		var form = layui.form;

		// 监听全选
		form.on('checkbox(checkall)', function(data) {

			if (data.elem.checked) {
				$('tbody input').prop('checked', true);
			} else {
				$('tbody input').prop('checked', false);
			}
			form.render('checkbox');
		});
	});

	function addRestaurant() {
		xadmin.open('添加餐厅', 'RestaurantAddServlet', 600, 500);
	}

	function search() {
		var frmRestaurantList = document.getElementById("frmRestaurantList");
		var operationType = document.getElementById("operationType");
		operationType.value = "search";
		frmRestaurantList.submit();
	}

	function remove(id) {
		if (confirm("是否删除餐厅序号为" + id + "的记录？")) {
			var frmRestaurantList = document
					.getElementById("frmRestaurantList");
			var operationType = document.getElementById("operationType");
			var restaurant_id = document.getElementById("restaurant_id");
			restaurant_id.value = id;
			operationType.value = "remove";
			frmRestaurantList.submit();
		}
	}

	function delAll() {
		var ids = [];
		var restaurantIdList = document.getElementById("restaurantIdList");
		var frmRestaurantList = document.getElementById("frmRestaurantList");
		var operationType = document.getElementById("operationType");

		// 获取选中的id 
		$('tbody input').each(function(index, el) {
			if ($(this).prop('checked')) {
				ids.push($(this).val());
			}
		});

		if (ids.length == 0) {
			alert("请先选择要删除的数据");
			return false;
		}

		if (confirm("是否删除餐厅序号为" + ids.toString() + "的记录？")) {
			operationType.value = "removeAll";
			restaurantIdList.value = ids;
			frmRestaurantList.submit();
		}
	}
</script>

<c:if test="${not empty errorMsg}">
	<script>
		alert("${errorMsg}");
		window.history.replaceState(null, null, window.location.href);
	</script>
</c:if>
</html>