<%@page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html class="x-admin-sm">
<head>
<meta charset="UTF-8">
<title>景点添加</title>
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
				action="AttractionAddServlet">
				<div class="layui-form-item">
					<label for="L_email" class="layui-form-label"> <span
						class="x-red">*</span>景点名
					</label>
					<div class="layui-input-inline">
						<input type="text" name="name" autocomplete="off"
							class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label for="L_username" class="layui-form-label"> <span
						class="x-red">*</span>开放时间
					</label>
					<div class="layui-input-inline">
						<input type="text" name="open_time" autocomplete="off"
							class="layui-input">
					</div>
					<div class="layui-form-mid layui-word-aux">
						<span class="x-red">*</span>可选填
					</div>
				</div>
				<div class="layui-form-item">
					<label for="L_pass" class="layui-form-label"> <span
						class="x-red">*</span>门票
					</label>
					<div class="layui-input-inline">
						<input type="text" name="entrance_fee" autocomplete="off"
							class="layui-input">
					</div>
					<div class="layui-form-mid layui-word-aux">
						<span class="x-red">*</span>可选填
					</div>
				</div>
				<div class="layui-form-item">
					<label for="L_repass" class="layui-form-label"> <span
						class="x-red">*</span>地址
					</label>
					<div class="layui-input-inline">
						<input type="text" name="address" autocomplete="off"
							class="layui-input">
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
						class="x-red">*</span>景点图片url
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
			var entrance_fee = form.entrance_fee.value.trim();
			var address = form.address.value.trim();
			var user_id = form.user_id.value.trim();
			var start_date = form.start_date.value.trim();

			var entrance_feeCheck = /^[0-9]*$/;

			if (name == "") {
				alert("请输入景点名");
				return false;
			} else if (entrance_fee != ""
					&& !entrance_feeCheck.test(entrance_fee)) {
				alert("门票格式不正确，请输入数字");
				return false;
			} else if (address == "") {
				alert("请输入地址");
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