<%@page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html class="x-admin-sm">
<head>
<meta charset="UTF-8">
<title>后台主页</title>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" href="./css/font.css">
<link rel="stylesheet" href="./css/xadmin.css">

</head>
<body class="index">
	<div class="container">
		<div class="logo">
			<a href="AdminServlet">最美辽宁后台主页</a>
		</div>
		<div class="left_open">
			<a><i title="展开左侧栏" class="iconfont">&#xe699;</i></a>
		</div>
		<ul class="layui-nav right" lay-filter="">
			<li class="layui-nav-item"><a href="javascript:;">admin</a>
				<dl class="layui-nav-child">
					<dd>
						<a onclick="xadmin.open('个人信息','UserInfoServlet',600, 400)">个人信息</a>
					</dd>
					<dd>
						<a onclick="window.location.href='LogoutServlet';">退出</a>
					</dd>
				</dl></li>
			<li class="layui-nav-item to-index"><a
				onclick="window.location.href='IndexServlet';">前台首页</a></li>
		</ul>
	</div>
	<div class="left-nav">
		<div id="side-nav">
			<ul id="nav">
				<li><a href="javascript:;"> <i class="iconfont left-nav-li"
						lay-tips="会员管理">&#xe6b8;</i> <cite>用户管理</cite> <i
						class="iconfont nav_right">&#xe697;</i></a>
					<ul class="sub-menu">
						<li><a onclick="xadmin.add_tab('用户列表','UserListServlet')">
								<i class="iconfont">&#xe6a7;</i> <cite>用户列表</cite>
						</a></li>
					</ul></li>
				<li><a href="javascript:;"> <i class="iconfont left-nav-li"
						lay-tips="订单管理">&#xe6e3;</i> <cite>旅行计划管理</cite> <i
						class="iconfont nav_right">&#xe697;</i></a>
					<ul class="sub-menu">
						<li><a onclick="xadmin.add_tab('旅行计划列表','PlanListServlet')">
								<i class="iconfont">&#xe6a7;</i> <cite>旅行计划列表</cite>
						</a></li>
					</ul></li>
				<li><a href="javascript:;"> <i class="iconfont left-nav-li"
						lay-tips="餐厅管理">&#xe722;</i> <cite>餐厅管理</cite> <i
						class="iconfont nav_right">&#xe697;</i></a>
					<ul class="sub-menu">
						<li><a
							onclick="xadmin.add_tab('餐厅列表','RestaurantListServlet')"> <i
								class="iconfont">&#xe6a7;</i> <cite>餐厅列表</cite></a></li>
					</ul></li>
				<li><a href="javascript:;"> <i class="iconfont left-nav-li"
						lay-tips="宾馆管理">&#xe723;</i> <cite>宾馆管理</cite> <i
						class="iconfont nav_right">&#xe697;</i></a>
					<ul class="sub-menu">
						<li><a onclick="xadmin.add_tab('宾馆列表','HotelListServlet')">
								<i class="iconfont">&#xe6a7;</i> <cite>宾馆列表</cite>
						</a></li>
					</ul></li>
				<li><a href="javascript:;"> <i class="iconfont left-nav-li"
						lay-tips="景点管理">&#xe707;</i> <cite>景点管理</cite> <i
						class="iconfont nav_right">&#xe697;</i></a>
					<ul class="sub-menu">
						<li><a
							onclick="xadmin.add_tab('景点列表','AttractionListServlet')"> <i
								class="iconfont">&#xe6a7;</i> <cite>景点列表</cite></a></li>
					</ul></li>
				<li><a href="javascript:;"> <i class="iconfont left-nav-li"
						lay-tips="评论管理">&#xe69b;</i> <cite>评论管理</cite> <i
						class="iconfont nav_right">&#xe697;</i></a>
					<ul class="sub-menu">
						<li><a onclick="xadmin.add_tab('评论列表','CommentListServlet')">
								<i class="iconfont">&#xe6a7;</i> <cite>评论列表</cite>
						</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
	<div class="page-content">
		<div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
			<ul class="layui-tab-title">
				<li class="home"><i class="layui-icon">&#xe68e;</i>我的桌面</li>
			</ul>
			<div class="layui-unselect layui-form-select layui-form-selected"
				id="tab_right">
				<dl>
					<dd data-type="this">关闭当前</dd>
					<dd data-type="other">关闭其它</dd>
					<dd data-type="all">关闭全部</dd>
				</dl>
			</div>
			<div class="layui-tab-content">
				<div class="layui-tab-item layui-show">
					<iframe src='./welcome.jsp' frameborder="0" scrolling="yes"
						class="x-iframe"></iframe>
				</div>
			</div>
			<div id="tab_show"></div>
		</div>
	</div>
	<div class="page-content-bg"></div>

	<script src="./lib/layui/layui.js" charset="utf-8"></script>
	<script type="text/javascript" src="./js/xadmin.js"></script>

</body>

</html>