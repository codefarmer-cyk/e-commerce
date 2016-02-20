<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="content">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<a href="#">
						<div>
							<img alt="" src="resources/img/56824e24dc0a7.jpg">
							<p>风干牛肉</p>
							<p>￥35.00</p>
						</div>
					</a>
				</div>
				<div class="col-md-3">
					<a href="#">
						<div>
							<img alt="" src="resources/img/56824e24dc0a7.jpg">
							<p>风干牛肉</p>
							<p>￥35.00</p>
						</div>
					</a>
				</div>
				<div class="col-md-3">
					<a href="#">
						<div>
							<img alt="" src="resources/img/56824e24dc0a7.jpg">
							<p>风干牛肉</p>
							<p>￥35.00</p>
						</div>
					</a>
				</div>
				<div class="col-md-3">
					<a href="#">
						<div>
							<img alt="" src="resources/img/56824e24dc0a7.jpg">
							<p>风干牛肉</p>
							<p>￥35.00</p>
						</div>
					</a>
				</div>
				<div class="col-md-3">
					<a href="#">
						<div>
							<img alt="" src="resources/img/56824e24dc0a7.jpg">
							<p>风干牛肉</p>
							<p>￥35.00</p>
						</div>
					</a>
				</div>
				<div class="col-md-3">
					<a href="#">
						<div>
							<img alt="" src="resources/img/56824e24dc0a7.jpg">
							<p>风干牛肉</p>
							<p>￥35.00</p>
						</div>
					</a>
				</div>
				<div class="col-md-3">
					<a href="#">
						<div>
							<img alt="" src="resources/img/56824e24dc0a7.jpg">
							<p>风干牛肉</p>
							<p>￥35.00</p>
						</div>
					</a>
				</div>
				<div class="col-md-3">
					<a href="#">
						<div>
							<img alt="" src="resources/img/56824e24dc0a7.jpg">
							<p>风干牛肉</p>
							<p>￥35.00</p>
						</div>
					</a>
				</div>
				<c:forEach items="${items}" var="item">
					<div class="col-md-3">
						<a href="item?item_id=${item.id}">
							<div>
								<img alt="" src="resources/img/${item.img}">
								<p>${item.name}</p>
								<p>￥${item.price}</p>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>