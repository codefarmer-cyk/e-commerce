<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="false"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; 
charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>商家界面--特色农产品电子商务网站</title>
<link rel="icon" href="resources/img/favicon.png">
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.5 -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<!-- Bootstrap Switch-->
<link rel="stylesheet" href="resources/css/bootstrap-switch.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="resources/css/AdminLTE.min.css">
<!-- AdminLTE Skins. We have chosen the skin-black for this starter
          page. However, you can choose any other skin. Make sure you
          apply the skin class to the body tag so the changes take effect.
    -->
<link rel="stylesheet" href="resources/css/skins/skin-blue.min.css">

<style type="text/css">
div .address {
	border: solid thin gray;
	padding: 10px;
	background-color: #f8f8ff;
	border-radius: 10px;
	margin-bottom: 10%;
}
</style>
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<!-- Main Header -->
		<header class="main-header">

			<!-- Logo -->
			<a href="#" class="logo" style="background: #222d32;"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>商</b></span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><b>商家</b>界面</span>
			</a>

			<!-- Header Navbar -->
			<nav class="navbar navbar-static-top" role="navigation"
				style="background-color: #222d32;">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
					role="button"> <span class="sr-only">Toggle navigation</span>
				</a>
				<!-- Navbar Right Menu -->
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">

						<!-- User Account Menu -->
						<li class="dropdown user user-menu">
							<!-- Menu Toggle Button --> <a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> <!-- The user image in the navbar-->
								<img src="resources/img/avatar/${user.avatar}"
								class="user-image" alt="User Image"> <!-- hidden-xs hides the username on small devices so only the image appears. -->
								<span class="hidden-xs">${user.username}</span>
						</a>
							<ul class="dropdown-menu">
								<!-- The user image in the menu -->
								<li class="user-header" style="background-color: #1e282c;"><img
									src="resources/img/avatar/${user.avatar}" class="img-circle"
									alt="User Image">
									<p>${user.username}</p></li>
								<!-- Menu Body -->
								<li class="user-body">
									<div class="col-xs-4 text-center">
										<a href="#">Followers</a>
									</div>
									<div class="col-xs-4 text-center">
										<a href="#">Sales</a>
									</div>
									<div class="col-xs-4 text-center">
										<a href="#">Friends</a>
									</div>
								</li>
								<!-- Menu Footer-->
								<li class="user-footer">
									<div class="pull-left">
										<a href="#" class="btn btn-default btn-flat">Profile</a>
									</div>
									<div class="pull-right">
										<a href="./logout" class="btn btn-default btn-flat">Sign
											out</a>
									</div>
								</li>
							</ul>
						</li>
						<!-- Tasks Menu -->
						<li class="dropdown tasks-menu">
							<!-- Menu Toggle Button --> <a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> <i class="fa fa-flag-o"></i> <span
								class="label label-danger">9</span>
						</a>
							<ul class="dropdown-menu">
								<li class="header">You have 9 tasks</li>
								<li>
									<!-- Inner menu: contains the tasks -->
									<ul class="menu">
										<li>
											<!-- Task item --> <a href="#"> <!-- Task title and progress text -->
												<h3>
													Design some buttons <small class="pull-right">20%</small>
												</h3> <!-- The progress bar -->
												<div class="progress xs">
													<!-- Change the css width attribute to simulate progress -->
													<div class="progress-bar progress-bar-aqua"
														style="width: 20%" role="progressbar" aria-valuenow="20"
														aria-valuemin="0" aria-valuemax="100">
														<span class="sr-only">20% Complete</span>
													</div>
												</div>
										</a>
										</li>
										<!-- end task item -->
									</ul>
								</li>
								<li class="footer"><a href="#">View all tasks</a></li>
							</ul>
						</li>
						<!-- Control Sidebar Toggle Button -->
						<!-- 						<li><a href="#" data-toggle="control-sidebar"><i -->
						<!-- 								class="fa fa-gears"></i></a></li> -->
					</ul>
				</div>
			</nav>
		</header>
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar">

			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">


				<!-- Sidebar Menu -->
				<ul class="sidebar-menu">
					<li class="header">菜单栏</li>
					<!-- Optionally, you can add icons to the links -->
					<li <c:if test="${page eq 'itemList' }">class="active"</c:if>><a
						href="./business?page=itemList"><i class="fa fa-link"></i> <span>商品列表</span></a></li>
					<li <c:if test="${page eq 'orderList' }">class="active"</c:if>><a
						href="./business?page=orderList"><i class="fa fa-link"></i> <span>订单列表</span></a></li>
					<li
						class="treeview <c:if test="${page eq 'userInfo' or page eq 'shopInfo' }">active</c:if>"><a
						href="#"><i class="fa fa-link"></i> <span>信息设置</span> <i
							class="fa fa-angle-left pull-right"></i></a>
						<ul class="treeview-menu">
							<li><a href="./business?page=userInfo">个人信息</a></li>
							<li><a href="./business?page=shopInfo">店铺信息</a></li>
						</ul></li>
					<li
						class="treeview <c:if test="${page eq 'userInfo' or page eq 'shopInfo' }">active</c:if>"><a
						href="#"><i class="fa fa-link"></i> <span>数据统计</span> <i
							class="fa fa-angle-left pull-right"></i></a>
						<ul class="treeview-menu">
							<li><a href="./business?page=saleInfo">销售信息</a></li>
							<li><a href="./business?page=shopInfo">店铺信息</a></li>
						</ul></li>
				</ul>
				<!-- /.sidebar-menu -->
			</section>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					<small>详细内容</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> 管理页面</a></li>
					<li class="active">${page}</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">

				<!-- Your Page Content Here -->
				<c:choose>
					<c:when test="${page eq 'itemList' }">
						<%@include file="include/business/itemList.jsp"%>
					</c:when>
					<c:when test="${page eq 'orderList' }">
						<%@include file="include/business/orderList.jsp"%>
					</c:when>
					<c:when test="${page eq 'userInfo' }">
						<%@include file="include/business/userInfo.jsp"%>
					</c:when>
					<c:when test="${page eq 'shopInfo' }">
						<%@include file="include/business/shopInfo.jsp"%>
					</c:when>
					<c:when test="${page eq 'saleInfo' }">
						<%@include file="include/business/saleInfo.jsp"%>
					</c:when>
				</c:choose>

			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- Main Footer -->
		<footer class="main-footer">
			<!-- To the right -->
			<!-- Default to the left -->
			<strong>Copyright &copy; 2016 <a href="#">陈逸逵</a>.
			</strong> All rights reserved.
		</footer>

		<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->

	<!-- REQUIRED JS SCRIPTS -->

	<!-- jQuery 2.1.4 -->
	<script type="text/javascript" src="resources/js/jquery.min.js"></script>
	<!-- Bootstrap 3.3.5 -->
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<!-- Bootstrap Switch -->
	<script type="text/javascript"
		src="resources/js/bootstrap-switch.min.js"></script>
	<!-- AdminLTE App -->
	<script src="resources/js/app.min.js"></script>
	<script type="text/javascript" src="resources/js/register.js"></script>
	<script src="resources/js/pages/Chart.min.js"></script>
	<script src="resources/js/pages/fastclick.min.js"></script>
	<script type="text/javascript" src="resources/js/chart.js"></script>
	<script type="text/javascript">
		input2 = true;
		input3 = true;
		function categoryActive(obj) {
			$('.categoryBtn').removeClass("active");
			$(obj).addClass("active	");
		}
		function isOK() {
			if (input2 && input3) {
				$("#submuit_btn1").removeAttr("disabled");
			} else {
				$("#submuit_btn1").attr("disabled", "disabled");
			}
			if (input4 && input5) {
				$("#submuit_btn2").removeAttr("disabled");
			} else {
				$("#submuit_btn2").attr("disabled", "disabled");
			}
		}

		$("[name='enabled']").bootstrapSwitch();
		$("[name='fuck']").bootstrapSwitch();
		function updateItem(item_id, item_name, item_category, item_price,
				item_stock, item_description) {
			$("#item_id").val(item_id);
			$("#item_name").val(item_name);
			$("#item_category").val(item_category);
			$("#item_price").val(item_price);
			$("#item_stock").val(item_stock);
			$("#item_description").val(item_description);
		}

		function sendItem(obj, subOrderId) {
			var status = $(obj);
			$.ajax({
				url : "./business/sendItem",
				data : {
					'subOrderId' : subOrderId,
					'${_csrf.parameterName}' : '${_csrf.token}'
				},
				type : "json",
				dataType : "json",
				method : "post",
				success : function(data) {
					status.parent().html(
							"<span class='label label-primary'>已发货</span>");
					console.log("result:" + data.result);
				}
			});
		}
	</script>
</body>
</html>