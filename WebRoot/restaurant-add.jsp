<%@page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html class="x-admin-sm">
<head>
<meta charset="UTF-8">
<title>餐厅添加</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="stylesheet" href="./css/font.css">
<link rel="stylesheet" href="./css/xadmin.css">

</head>
<body>
	<div class="layui-fluid">
		<div class="layui-row">
			<form id="frmAdd" class="layui-form" method="post"
				action="RestaurantAddServlet">
				<div class="layui-form-item">
					<label for="L_email" class="layui-form-label"> <span
						class="x-red">*</span>餐厅名
					</label>
					<div class="layui-input-inline">
						<input type="text" name="name" autocomplete="off"
							class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label for="L_username" class="layui-form-label"> <span
						class="x-red">*</span>评分
					</label>
					<div class="layui-input-inline">
						<input type="text" name="rating" autocomplete="off"
							class="layui-input">
					</div>
					<div class="layui-form-mid layui-word-aux">
						<span class="x-red">*</span>可选填
					</div>
				</div>
				<div class="layui-form-item">
					<label for="L_pass" class="layui-form-label"> <span
						class="x-red">*</span>地址
					</label>
					<div class="layui-input-inline">
						<input type="text" name="address" autocomplete="off"
							class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label for="L_repass" class="layui-form-label"> <span
						class="x-red">*</span>联系电话
					</label>
					<div class="layui-input-inline">
						<input type="text" name="phone" autocomplete="off"
							class="layui-input">
					</div>
					<div class="layui-form-mid layui-word-aux">
						<span class="x-red">*</span>可选填
					</div>
				</div>
				<div class="layui-form-item">
					<label for="L_username" class="layui-form-label"> <span
						class="x-red">*</span>用户ID
					</label>
					<div class="layui-input-inline">
						<input type="text" name="user_id" autocomplete="off"
							class="layui-input">
					</div>

				</div>
				<div class="layui-form-item">
					<label for="L_username" class="layui-form-label"> <span
						class="x-red">*</span>预约日期
					</label>
					<div class="layui-input-inline">
						<input type="date" name="start_date" autocomplete="off"
							class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label for="L_username" class="layui-form-label"> <span
						class="x-red">*</span>餐厅图片url
					</label>
					<div class="layui-input-inline">
						<input type="text" name="image_url" autocomplete="off"
							class="layui-input">
					</div>
					<div class="layui-form-mid layui-word-aux">
						<span class="x-red">*</span>可选填
					</div>
				</div>
				<div class="layui-form-item">
					<label for="L_repass" class="layui-form-label"></label>
					<button type="submit" class="layui-btn"
						onclick="return addRestaurant(this.form)">添加</button>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript" src="./lib/layui/layui.js"
		charset="utf-8"></script>
	<script type="text/javascript" src="./js/xadmin.js"></script>
	<script>
		layui.use([ 'form', 'layer', 'jquery' ], function() {
			$ = layui.jquery;
		});

		function addRestaurant(form) {
			var name = form.name.value.trim();
			var rating = form.rating.value.trim();
			var address = form.address.value.trim();
			var user_id = form.user_id.value.trim();
			var phone = form.phone.value.trim();
			var start_date = form.start_date.value.trim();

			var ratingCheck = /^([0-4](\.[0-9])?|5(\.0)?)$/;
			var phoneCheck = /^1[3456789]\d{9}$/;

			if (name == "") {
				alert("请输入餐厅名");
				return false;
			} else if (rating != "" && !ratingCheck.test(rating)) {
				alert("评分格式不正确，请输入5.0以内的一位小数的数字");
				return false;
			} else if (address == "") {
				alert("请输入地址");
				return false;
			} else if (phone != "" && !phoneCheck.test(phone)) {
				alert("手机号格式不正确");
				return false;
			} else if (user_id == "") {
				alert("请输入用户ID");
				return false;
			} else if (start_date == "") {
				alert("请输入预约时间");
				return false;
			} else {
				var frmAdd = document.getElementById("frmAdd");
				frmAdd.submit();
			}
		}
	</script>

	<c:if test="${not empty errorMsg}">
		<script>
			alert("${errorMsg}");
			window.history.replaceState(null, null, window.location.href);
		</script>
	</c:if>
</body>

</html>