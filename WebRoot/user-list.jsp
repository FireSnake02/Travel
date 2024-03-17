<%@page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html class="x-admin-sm">
<head>
<meta charset="UTF-8">
<title>用户列表</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="stylesheet" href="./css/font.css">
<link rel="stylesheet" href="./css/xadmin.css">

</head>
<body>
	<div class="x-nav">
		<span class="layui-breadcrumb"> <a href="">首页</a> <a href="">用户管理</a>
			<a> <cite>用户列表</cite></a>
		</span> <a class="layui-btn layui-btn-small"
			style="line-height:1.6em;margin-top:3px;float:right"
			onclick="location.reload()" title="刷新"> <i
			class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
	</div>
	<div class="layui-fluid">
		<div class="layui-row layui-col-space15">
			<div class="layui-col-md12">
				<div class="layui-card">
					<form id="frmUserList" method="post" action="UserListServlet"
						role="form">
						<input type="hidden" id="operationType" name="operationType"
							value="" /> <input type="hidden" id="user_id" name="user_id"
							value="" /> <input type="hidden" id="userIdList"
							name="userIdList" value="" />
						<div class="layui-card-body">
							<button class="layui-btn layui-btn-danger"
								onclick="return delAll()">
								<i class="layui-icon"></i>批量删除
							</button>
							<a class="layui-btn" href="javascript:void(0);"
								onclick="addUser()"> <i class="layui-icon"></i>添加
							</a>
						</div>
						<div class="layui-card-header"
							style="display: flex; justify-content: flex-end; margin-left: 0;">
							<div class="layui-form layui-col-space5">
								<div class="layui-inline layui-show-xs-block">
									<input type="text" name="searchUsername" placeholder="请输入用户名"
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
										<th>用户名</th>
										<th>邮箱</th>
										<th>密码</th>
										<th>手机号</th>
										<th>用户权限</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${not empty searchUsers}">
											<c:forEach items="${searchUsers}" var="searchUser">
												<tr>
													<td><input type="checkbox" name="id"
														value="${searchUser.user_id}" lay-skin="primary"></td>
													<td>${searchUser.user_id}</td>
													<td>${searchUser.username}</td>
													<td>${searchUser.email}</td>
													<td>${searchUser.password}</td>
													<td>${searchUser.phone_number}</td>
													<td>${searchUser.role}</td>
													<td class="td-manage"><a title="编辑"
														onclick="openEditWindow(${searchUser.user_id});"
														href="javascript:void(0);"> <i class="layui-icon">&#xe642;</i>
													</a> <a title="删除" onclick="remove(${searchUser.user_id})"
														href="javascript:;"> <i class="layui-icon">&#xe640;</i>
													</a></td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<c:forEach items="${users}" var="user">
												<tr>
													<td><input type="checkbox" name="id"
														value="${user.user_id}" lay-skin="primary"></td>
													<td>${user.user_id}</td>
													<td>${user.username}</td>
													<td>${user.email}</td>
													<td>${user.password}</td>
													<td>${user.phone_number}</td>
													<td>${user.role}</td>
													<td class="td-manage"><a title="编辑"
														onclick="openEditWindow(${user.user_id});"
														href="javascript:void(0);"> <i class="layui-icon">&#xe642;</i>
													</a> <a title="删除" onclick="remove(${user.user_id})"
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
	layui.use([ 'form' ], function() {
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

	function addUser() {
		xadmin.open('添加用户', 'UserAddServlet', 600, 450);
	}

	function search() {
		var frmUserList = document.getElementById("frmUserList");
		var operationType = document.getElementById("operationType");
		operationType.value = "search";
		frmUserList.submit();
	}

	function remove(id) {
		if (confirm("是否删除用户序号为" + id + "的记录？")) {
			var frmUserList = document.getElementById("frmUserList");
			var operationType = document.getElementById("operationType");
			var user_id = document.getElementById("user_id");
			user_id.value = id;
			operationType.value = "remove";
			frmUserList.submit();
		}
	}

	function openEditWindow(user_id) {
		var url = 'UserEditServlet?user_id=' + user_id;
		xadmin.open('用户修改', url, 600, 450);
	}

	function delAll() {
		var ids = [];
		var userIdList = document.getElementById("userIdList");
		var frmUserList = document.getElementById("frmUserList");
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

		if (confirm("是否删除用户序号为" + ids.toString() + "的记录？")) {
			operationType.value = "removeAll";
			userIdList.value = ids;
			frmUserList.submit();
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