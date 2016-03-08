<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>购物车--特色农产品电子商务网站</title>
<link rel="icon" href="resources/img/favicon.png">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<style type="text/css">
body {
	padding-top: 70px;
	background-color: rgb(249, 249, 249);
}
</style>
</head>
<body>
	<%@include file="include/nav.jsp"%>

	<div class="container" style="margin-top: 2%;">
		<div class="row">
			<div class="col-md-3">
				<ol class="breadcrumb">
					<li><a href="./">主页</a></li>
					<li class="active">购物车</li>
				</ol>
			</div>
		</div>
		<!-- /   Bread Nav -->
		<div class="row">
			<div class="col-md-12">
				<c:choose>
					<c:when test="${fn:length(buyList) eq 0}">
						<div class="tip">
							<p>您的购物车还是空的！</p>
							<a type="button" class="btn btn-primary" href="./">马上去购物</a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="orderBox">
							<div class="col-md-12 table-responsive ">
								<table class="table table-hover ">
									<thead>
										<tr>
											<th>商品名称</th>
											<th>数量</th>
											<th class="text-center">单价</th>
											<th class="text-center">小计</th>
											<th> </th>
										</tr>
									</thead>
									<tbody>
										<c:set value="0" var="sum" />
										<c:forEach items="${buyList}" var="buy">
											<tr class="item">
												<td class="col-sm-3 col-md-3">
													<div class="media">
														<a class="thumbnail pull-left" href="#"> <img
															class="media-object"
															src="resources/img/items/${buy.key.imgs[0]}"
															style="width: 72px; height: 72px;">
														</a>
														<div class="media-body">
															<h4 class="media-heading">
																<a href="#"> ${buy.key.name}</a>
															</h4>
															<!-- 															<h5 class="media-heading"> -->
															<!-- 																by <a href="#">Brand name</a> -->
															<!-- 															</h5> -->
															<span>库存: </span><span class="text-success"><strong>${buy.key.stock}</strong></span>
														</div>
													</div>
												</td>
												<td class="col-sm-1 col-md-1" style="text-align: center"><input
													type="text" class="form-control amount"
													value="${buy.value}"
													oninput="onAmountInput (event,'${buy.key.id}',${buy.key.stock})"
													onpropertychange="onEmailPropChanged (event,'${buy.key.id}',${buy.key.stock})"></td>
												<td class="col-sm-1 col-md-1 text-center"><strong><span
														class="price">${buy.key.price}</span> 元</strong></td>
												<td class="col-sm-1 col-md-1 text-center"><strong><span
														class="subSum">${buy.key.price*buy.value}</span> 元</strong></td>
												<c:set var="sum" value="${sum+buy.key.price*buy.value}" />
												<td class="col-sm-1 col-md-1">
													<button type="button" class="btn btn-danger"
														onclick="removeCart('item_${buy.key.id}')">
														<span class="glyphicon glyphicon-remove"></span> 删除
													</button>
												</td>
											</tr>
										</c:forEach>
										<!-- 						<tr> -->
										<!-- 							<td> </td> -->
										<!-- 							<td> </td> -->
										<!-- 							<td> </td> -->
										<!-- 							<td><h5>Subtotal</h5></td> -->
										<!-- 							<td class="text-right"><h5> -->
										<!-- 									<strong>$24.59</strong> -->
										<!-- 								</h5></td> -->
										<!-- 						</tr> -->
										<!-- 						<tr> -->
										<!-- 							<td> </td> -->
										<!-- 							<td> </td> -->
										<!-- 							<td> </td> -->
										<!-- 							<td><h5>Estimated shipping</h5></td> -->
										<!-- 							<td class="text-right"><h5> -->
										<!-- 									<strong>$6.94</strong> -->
										<!-- 								</h5></td> -->
										<!-- 						</tr> -->
										<tr>
											<td> </td>
											<td> </td>
											<td> </td>
											<td><h3>合计</h3></td>
											<td><h3>
													<strong><span id="sum">${sum}</span>元</strong>
												</h3></td>
										</tr>
										<tr>
											<td> </td>
											<td> </td>
											<td> </td>
											<td><a type="button" class="btn btn-default" href="./">
													<span class="glyphicon glyphicon-shopping-cart"></span>
													继续购物
											</a></td>
											<td>
												<button type="button" class="btn btn-success"
													onclick="buy()">
													结算 <span class="glyphicon glyphicon-play"></span>
												</button>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<%@include file="include/footer.jsp"%>
	<script type="text/javascript" src="resources/js/jquery.min.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/js/cart.js"></script>
</body>
</html>