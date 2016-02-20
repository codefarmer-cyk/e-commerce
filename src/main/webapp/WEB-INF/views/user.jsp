<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
</head>
<body style="background-color: #f5f5f5">
	<%@include file="include/nav.jsp"%>
	<div class="content">
		<div class="contrianer">
			<div class="row">
				<div class="col-md-2 col-md-offset-1"
					style="background-color: white; padding: 1%">
					<ul>
						<li>个人中心</li>
						<li>个人中心</li>
						<li>个人中心</li>
						<li>个人中心</li>
					</ul>
				</div>
				<div class="col-md-7"
					style="background-color: white; padding: 1%; margin-left: 1%;">
					<div class="row">
						<div class="col-md-offset-1 col-md-5" style="padding: 1%">
							<h2>${user.username}</h2>
						</div>
						<div class="col-md-offset-1 col-md-5" style="padding: 1%">
							<ul>
								<li>绑定手机：135********00</li>
								<li>绑定邮箱：59******8@q*.com</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="resources/js/jquery.min.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/js/cart.js"></script>
	<script type="text/javascript" src="resources/js/cart.js"></script>
</body>
</html>