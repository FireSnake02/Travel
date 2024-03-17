<%@page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html class="x-admin-sm">
<head>
<meta charset="UTF-8">
<title>评论列表</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="stylesheet" href="./css/font.css">
<link rel="stylesheet" href="./css/xadmin.css">

</head>
<body>
	<div class="x-nav">
		<span class="layui-breadcrumb"> <a href="">首页</a> <a href="">评论管理</a>
			<a> <cite>评论列表</cite></a>
		</span> <a class="layui-btn layui-btn-small"
			style="line-height:1.6em;margin-top:3px;float:right"
			onclick="location.reload()" title="刷新"> <i
			class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
	</div>
	<div class="layui-fluid">
		<div class="layui-row layui-col-space15">
			<div class="layui-col-md12">
				<div class="layui-card">
					<form id="frmCommentList" method="post" action="CommentListServlet"
						role="form">
						<input type="hidden" id="operationType" name="operationType"
							value="" /> <input type="hidden" id="comment_id"
							name="comment_id" value="" /><input type="hidden"
							id="commentIdList" name="commentIdList" value="" />
						<div class="layui-card-body">
							<button class="layui-btn layui-btn-danger"
								onclick="return delAll()">
								<i class="layui-icon"></i>批量删除
							</button>
							<a class="layui-btn" href="javascript:void(0);"
								onclick="addComment()"> <i class="layui-icon"></i>添加
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
										<th>旅行计划ID</th>
										<th>用户ID</th>
										<th>评论内容</th>
										<th>评分</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${not empty searchComments}">
											<c:forEach items="${searchComments}" var="searchComment">
												<tr>
													<td><input type="checkbox" name="id"
														value="${searchComment.comment_id}" lay-skin="primary"></td>
													<td>${searchComment.comment_id}</td>
													<td>${searchComment.travel_plan_id}</td>
													<td>${searchComment.user_id}</td>
													<td>${searchComment.comment_text}</td>
													<td>${searchComment.rating}</td>
													<td class="td-manage"><a title="删除"
														onclick="remove(${searchComment.comment_id})"
														href="javascript:;"> <i class="layui-icon">&#xe640;</i>
													</a></td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<c:forEach items="${comments}" var="comment">
												<tr>
													<td><input type="checkbox" name="id"
														value="${comment.comment_id}" lay-skin="primary"></td>
													<td>${comment.comment_id}</td>
													<td>${comment.travel_plan_id}</td>
													<td>${comment.user_id}</td>
													<td>${comment.comment_text}</td>
													<td>${comment.rating}</td>
													<td class="td-manage"><a title="删除"
														onclick="remove(${comment.comment_id});"
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

	function addComment() {
		xadmin.open('添加评论', 'CommentAddServlet', 500, 350);
	}

	function search() {
		var frmCommentList = document.getElementById("frmCommentList");
		var operationType = document.getElementById("operationType");
		operationType.value = "search";
		frmCommentList.submit();
	}

	function remove(id) {
		if (confirm("是否删除评论序号为" + id + "的记录？")) {
			var frmCommentList = document
					.getElementById("frmCommentList");
			var operationType = document.getElementById("operationType");
			var comment_id = document.getElementById("comment_id");
			comment_id.value = id;
			operationType.value = "remove";
			frmCommentList.submit();
		}
	}

	function delAll() {
		var ids = [];
		var commentIdList = document.getElementById("commentIdList");
		var frmCommentList = document.getElementById("frmCommentList");
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
			commentIdList.value = ids;
			frmCommentList.submit();
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