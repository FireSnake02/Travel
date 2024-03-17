<%@page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html class="x-admin-sm">
<head>
<meta charset="UTF-8">
<title>宾馆列表</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="stylesheet" href="./css/font.css">
<link rel="stylesheet" href="./css/xadmin.css">

</head>
<body>
	<div class="x-nav">
		<span class="layui-breadcrumb"> <a href="">首页</a> <a href="">宾馆管理</a>
			<a> <cite>宾馆列表</cite></a>
		</span> <a class="layui-btn layui-btn-small"
			style="line-height:1.6em;margin-top:3px;float:right"
			onclick="location.reload()" title="刷新"> <i
			class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
	</div>
	<div class="layui-fluid">
		<div class="layui-row layui-col-space15">
			<div class="layui-col-md12">
				<div class="layui-card">
					<form id="frmHotelList" method="post" action="HotelListServlet"
						role="form">
						<input type="hidden" id="operationType" name="operationType"
							value="" /> <input type="hidden" id="hotel_id" name="hotel_id"
							value="" /><input type="hidden" id="hotelIdList"
							name="hotelIdList" value="" />
						<div class="layui-card-body">
							<button class="layui-btn layui-btn-danger"
								onclick="return delAll()">
								<i class="layui-icon"></i>批量删除
							</button>
							<a class="layui-btn" href="javascript:void(0);"
								onclick="addHotel()"> <i class="layui-icon"></i>添加
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
										<th>酒店名</th>
										<th>评分</th>
										<th>酒店地址</th>
										<th>酒店电话</th>
										<th>用户ID</th>
										<th>预约时间</th>
										<th>宾馆图片url</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${not empty searchHotels}">
											<c:forEach items="${searchHotels}" var="searchHotel">
												<tr>
													<td><input type="checkbox" name="id"
														value="${searchHotel.hotel_id}" lay-skin="primary"></td>
													<td>${searchHotel.hotel_id}</td>
													<td>${searchHotel.name}</td>
													<td>${searchHotel.rating}</td>
													<td>${searchHotel.address}</td>
													<td>${searchHotel.phone_number}</td>
													<td>${searchHotel.user_id}</td>
													<td>${searchHotel.start_date}</td>
													<td>${searchHotel.image_url}</td>
													<td class="td-manage"><a title="删除"
														onclick="remove(${searchHotel.hotel_id})"
														href="javascript:;"> <i class="layui-icon">&#xe640;</i>
													</a></td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<c:forEach items="${hotels}" var="hotel">
												<tr>
													<td><input type="checkbox" name="id"
														value="${hotel.hotel_id}" lay-skin="primary"></td>
													<td>${hotel.hotel_id}</td>
													<td>${hotel.name}</td>
													<td>${hotel.rating}</td>
													<td>${hotel.address}</td>
													<td>${hotel.phone_number}</td>
													<td>${hotel.user_id}</td>
													<td>${hotel.start_date}</td>
													<td>${hotel.image_url}</td>
													<td class="td-manage"><a title="删除"
														onclick="remove(${hotel.hotel_id})" href="javascript:;">
															<i class="layui-icon">&#xe640;</i>
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

	function addHotel() {
		xadmin.open('添加宾馆', 'HotelAddServlet', 600, 500);
	}

	function search() {
		var frmHotelList = document.getElementById("frmHotelList");
		var operationType = document.getElementById("operationType");
		operationType.value = "search";
		frmHotelList.submit();
	}

	function remove(id) {
		if (confirm("是否删除宾馆序号为" + id + "的记录？")) {
			var frmHotelList = document.getElementById("frmHotelList");
			var operationType = document.getElementById("operationType");
			var hotel_id = document.getElementById("hotel_id");
			hotel_id.value = id;
			operationType.value = "remove";
			frmHotelList.submit();
		}
	}

	function delAll() {
		var ids = [];
		var hotelIdList = document.getElementById("hotelIdList");
		var frmHotelList = document.getElementById("frmHotelList");
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

		if (confirm("是否删除宾馆序号为" + ids.toString() + "的记录？")) {
			operationType.value = "removeAll";
			hotelIdList.value = ids;
			frmHotelList.submit();
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