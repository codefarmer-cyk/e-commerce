<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="false"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>首頁--特色农产品电子商务网站</title>
<!-- Bootstrap Core CSS -->
<link rel="icon" href="resources/img/favicon.png">
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/common.css">
<!-- Custom CSS -->
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<%@include file="include/nav.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<ol class="breadcrumb">
					<li><a href="./">主页</a></li>
					<li class="active">${shop.name}</li>
				</ol>
			</div>
		</div>
		<div class="page-header">
			<h1>
				${shop.name}<small>${user.username}</small>
			</h1>
		</div>
		<div class="jumbotron">
			<div style="text-align: center;">
				<img alt="" src="resources/img/shop/${shop.icon}" class="img-circle">
			</div>
			<h1>欢迎光临</h1>
			<p>${shop.description}</p>
		</div>
		<hr>
		<div class="row">
			<div class="col-md-3">
				<div class=" panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">销量榜</h3>
					</div>
					<div class="panel-body">
						<c:forEach items="${topItems}" var="item" begin="0" end="9">
							<div class="row">
								<div class="col-md-5 col-xs-3">
									<a href="item?item_id=${item.id}"><img
										src="resources/img/items/${item.imgs[0]}" width="80px">
									</a>
								</div>
								<div class="col-md-7 col-xs-5">
									<ul>
										<li>${item.name}</li>
										<li>销量:${item.sale}斤</li>
										<li>评分:${item.score}分</li>
									</ul>
								</div>
							</div>
							<hr>
						</c:forEach>
					</div>
				</div>
			</div>

			<div class="col-md-9" style="border-left: solid 2px #eee;">
				<div class="row">
					<c:forEach items="${shop.items}" var="item">
						<div class="col-sm-2 col-lg-4 col-md-4">
							<div class="thumbnail ">
								<img alt="" src="resources/img/items/${item.imgs[0]}">
								<div class="caption">
									<h5 class="pull-right price">￥${item.price}/斤</h5>
									<h5>
										<a href="item?item_id=${item.id}">${item.name}</a>
									</h5>
									<hr>
									<p>${item.description}</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<%@include file="include/footer.jsp"%>
	<!-- /.container -->
	<!-- jQuery -->
	<script src="resources/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="resources/js/bootstrap.min.js"></script>
</body>
</html>