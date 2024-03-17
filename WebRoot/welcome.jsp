<%@page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html class="x-admin-sm">
<head>
<meta charset="UTF-8">
<title>欢迎页面</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="stylesheet" href="./css/font.css">
<link rel="stylesheet" href="./css/xadmin.css">

</head>
<body>
	<div class="layui-fluid">
		<div class="layui-row layui-col-space15">
			<div class="layui-col-md12">
				<div class="layui-card">
					<div class="layui-card-body ">
						<blockquote class="layui-elem-quote">
							欢迎管理员： <span class="x-red"><%=session.getAttribute("username")%></span>！当前时间：<span
								id="displayTime"></span>
						</blockquote>
					</div>
				</div>
			</div>
			<div class="layui-col-md12">
				<div class="layui-card">
					<div class="layui-card-header">数据统计</div>
					<div class="layui-card-body ">
						<ul
							class="layui-row layui-col-space10 layui-this x-admin-carousel x-admin-backlog">
							<li class="layui-col-md2 layui-col-xs6 "><a
								href="javascript:;" class="x-admin-backlog-body">
									<h3>搜索数</h3>
									<p>
										<cite>${planCount}</cite>
									</p>
							</a></li>
							<li class="layui-col-md2 layui-col-xs6"><a
								href="javascript:;" class="x-admin-backlog-body">
									<h3>用户数</h3>
									<p>
										<cite>${userCount}</cite>
									</p>
							</a></li>
							<li class="layui-col-md2 layui-col-xs6"><a
								href="javascript:;" class="x-admin-backlog-body">
									<h3>预定餐厅数</h3>
									<p>
										<cite>${restaurantCount}</cite>
									</p>
							</a></li>
							<li class="layui-col-md2 layui-col-xs6"><a
								href="javascript:;" class="x-admin-backlog-body">
									<h3>预定宾馆数</h3>
									<p>
										<cite>${hotelCount}</cite>
									</p>
							</a></li>
							<li class="layui-col-md2 layui-col-xs6"><a
								href="javascript:;" class="x-admin-backlog-body">
									<h3>预定景点数</h3>
									<p>
										<cite>${attractionCount}</cite>
									</p>
							</a></li>
							<li class="layui-col-md2 layui-col-xs6"><a
								href="javascript:;" class="x-admin-backlog-body">
									<h3>评论数</h3>
									<p>
										<cite>${commentCount}</cite>
									</p>
							</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="layui-col-sm12 layui-col-md6">
				<div class="layui-card">
					<div class="layui-card-header">最新一周新增搜索数</div>
					<div class="layui-card-body" style="min-height: 280px;">
						<div id="main1" class="layui-col-sm12" style="height: 300px;"></div>

					</div>
				</div>
			</div>
			<div class="layui-col-sm12 layui-col-md6">
				<div class="layui-card">
					<div class="layui-card-header">最新一周新增用户数</div>
					<div class="layui-card-body" style="min-height: 280px;">
						<div id="main2" class="layui-col-sm12" style="height: 300px;"></div>

					</div>
				</div>
			</div>
			<div class="layui-col-sm12 layui-col-md6">
				<div class="layui-card">
					<div class="layui-card-header">最新一周新增预定餐厅数</div>
					<div class="layui-card-body" style="min-height: 280px;">
						<div id="main3" class="layui-col-sm12" style="height: 300px;"></div>

					</div>
				</div>
			</div>
			<div class="layui-col-sm12 layui-col-md6">
				<div class="layui-card">
					<div class="layui-card-header">最新一周新增预定宾馆数</div>
					<div class="layui-card-body" style="min-height: 280px;">
						<div id="main4" class="layui-col-sm12" style="height: 300px;"></div>

					</div>
				</div>
			</div>
			<div class="layui-col-sm12 layui-col-md6">
				<div class="layui-card">
					<div class="layui-card-header">最新一周新增预定景点数</div>
					<div class="layui-card-body" style="min-height: 280px;">
						<div id="main5" class="layui-col-sm12" style="height: 300px;"></div>

					</div>
				</div>
			</div>
			<div class="layui-col-sm12 layui-col-md6">
				<div class="layui-card">
					<div class="layui-card-header">最新一周新增评论数</div>
					<div class="layui-card-body" style="min-height: 280px;">
						<div id="main6" class="layui-col-sm12" style="height: 300px;"></div>

					</div>
				</div>
			</div>
			<style id="welcome_style"></style>
		</div>
	</div>
	</div>
	<script src="./lib/layui/layui.js" charset="utf-8"></script>
	<script type="text/javascript" src="./js/xadmin.js"></script>
	<script src="https://cdn.bootcss.com/echarts/4.2.1-rc1/echarts.min.js"></script>
	<script>
		// 基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('main1'));

		// 指定图表的配置项和数据
		var option = {
			grid : {
				top : '5%',
				right : '1%',
				left : '1%',
				bottom : '10%',
				containLabel : true
			},
			tooltip : {
				trigger : 'axis'
			},
			xAxis : {
				type : 'category',
				data : [ '${dateList[6]}', '${dateList[5]}', '${dateList[4]}',
						'${dateList[3]}', '${dateList[2]}', '${dateList[1]}',
						'${dateList[0]}' ]
			},
			yAxis : {
				type : 'value'
			},
			series : [ {
				name : '计划量',
				data : [ '${newPlanCount[6]}', '${newPlanCount[5]}',
						'${newPlanCount[4]}', '${newPlanCount[3]}',
						'${newPlanCount[2]}', '${newPlanCount[1]}',
						'${newPlanCount[0]}' ],
				type : 'line',
				smooth : true
			} ]
		};

		// 使用刚指定的配置项和数据显示图表。
		myChart.setOption(option);

		// 基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('main2'));

		// 指定图表的配置项和数据
		var option = {
			grid : {
				top : '5%',
				right : '1%',
				left : '1%',
				bottom : '10%',
				containLabel : true
			},
			tooltip : {
				trigger : 'axis'
			},
			xAxis : {
				type : 'category',
				data : [ '${dateList[6]}', '${dateList[5]}', '${dateList[4]}',
						'${dateList[3]}', '${dateList[2]}', '${dateList[1]}',
						'${dateList[0]}' ]
			},
			yAxis : {
				type : 'value'
			},
			series : [ {
				name : '用户量',
				data : [ '${newUserCount[6]}', '${newUserCount[5]}',
						'${newUserCount[4]}', '${newUserCount[3]}',
						'${newUserCount[2]}', '${newUserCount[1]}',
						'${newUserCount[0]}' ],
				type : 'line',
				smooth : true
			} ]
		};

		// 使用刚指定的配置项和数据显示图表。
		myChart.setOption(option);

		// 基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('main3'));

		// 指定图表的配置项和数据
		var option = {
			grid : {
				top : '5%',
				right : '1%',
				left : '1%',
				bottom : '10%',
				containLabel : true
			},
			tooltip : {
				trigger : 'axis'
			},
			xAxis : {
				type : 'category',
				data : [ '${dateList[6]}', '${dateList[5]}', '${dateList[4]}',
						'${dateList[3]}', '${dateList[2]}', '${dateList[1]}',
						'${dateList[0]}' ]
			},
			yAxis : {
				type : 'value'
			},
			series : [ {
				name : '餐厅量',
				data : [ '${newRestaurantCount[6]}',
						'${newRestaurantCount[5]}', '${newRestaurantCount[4]}',
						'${newRestaurantCount[3]}', '${newRestaurantCount[2]}',
						'${newRestaurantCount[1]}', '${newRestaurantCount[0]}' ],
				type : 'line',
				smooth : true
			} ]
		};

		// 使用刚指定的配置项和数据显示图表。
		myChart.setOption(option);

		// 基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('main4'));

		// 指定图表的配置项和数据
		var option = {
			grid : {
				top : '5%',
				right : '1%',
				left : '1%',
				bottom : '10%',
				containLabel : true
			},
			tooltip : {
				trigger : 'axis'
			},
			xAxis : {
				type : 'category',
				data : [ '${dateList[6]}', '${dateList[5]}', '${dateList[4]}',
						'${dateList[3]}', '${dateList[2]}', '${dateList[1]}',
						'${dateList[0]}' ]
			},
			yAxis : {
				type : 'value'
			},
			series : [ {
				name : '宾馆量',
				data : [ '${newHotelCount[6]}', '${newHotelCount[5]}',
						'${newHotelCount[4]}', '${newHotelCount[3]}',
						'${newHotelCount[2]}', '${newHotelCount[1]}',
						'${newHotelCount[0]}' ],
				type : 'line',
				smooth : true
			} ]
		};

		// 使用刚指定的配置项和数据显示图表。
		myChart.setOption(option);

		// 基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('main5'));

		// 指定图表的配置项和数据
		var option = {
			grid : {
				top : '5%',
				right : '1%',
				left : '1%',
				bottom : '10%',
				containLabel : true
			},
			tooltip : {
				trigger : 'axis'
			},
			xAxis : {
				type : 'category',
				data : [ '${dateList[6]}', '${dateList[5]}', '${dateList[4]}',
						'${dateList[3]}', '${dateList[2]}', '${dateList[1]}',
						'${dateList[0]}' ]
			},
			yAxis : {
				type : 'value'
			},
			series : [ {
				name : '景点量',
				data : [ '${newAttractionCount[6]}',
						'${newAttractionCount[5]}', '${newAttractionCount[4]}',
						'${newAttractionCount[3]}', '${newAttractionCount[2]}',
						'${newAttractionCount[1]}', '${newAttractionCount[0]}' ],
				type : 'line',
				smooth : true
			} ]
		};

		// 使用刚指定的配置项和数据显示图表。
		myChart.setOption(option);

		// 基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('main6'));

		// 指定图表的配置项和数据
		var option = {
			grid : {
				top : '5%',
				right : '1%',
				left : '1%',
				bottom : '10%',
				containLabel : true
			},
			tooltip : {
				trigger : 'axis'
			},
			xAxis : {
				type : 'category',
				data : [ '${dateList[6]}', '${dateList[5]}', '${dateList[4]}',
						'${dateList[3]}', '${dateList[2]}', '${dateList[1]}',
						'${dateList[0]}' ]
			},
			yAxis : {
				type : 'value'
			},
			series : [ {
				name : '评论量',
				data : [ '${newCommentCount[6]}', '${newCommentCount[5]}',
						'${newCommentCount[4]}', '${newCommentCount[3]}',
						'${newCommentCount[2]}', '${newCommentCount[1]}',
						'${newCommentCount[0]}' ],
				type : 'line',
				smooth : true
			} ]
		};

		// 使用刚指定的配置项和数据显示图表。
		myChart.setOption(option);

		function displayTime() {
			var now = new Date();
			var year = now.getFullYear();
			var month = now.getMonth() + 1;
			var day = now.getDate();
			var hours = now.getHours();
			var minutes = now.getMinutes();
			var seconds = now.getSeconds();

			if (month < 10) {
				month = '0' + month;
			}
			if (day < 10) {
				day = '0' + day;
			}
			if (hours < 10) {
				hours = '0' + hours;
			}
			if (minutes < 10) {
				minutes = '0' + minutes;
			}
			if (seconds < 10) {
				seconds = '0' + seconds;
			}

			var currentTime = year + '-' + month + '-' + day + ' ' + hours
					+ ':' + minutes + ':' + seconds;
			document.getElementById('displayTime').innerText = currentTime;

			setTimeout(displayTime, 1000); // Update time every second
		}

		window.onload = displayTime;
	</script>
</body>
</html>