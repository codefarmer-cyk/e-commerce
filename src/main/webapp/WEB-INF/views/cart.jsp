<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
</head>
<body>
	<%@include file="include/nav.jsp"%>
	<div class="content">
		<div class="container">
			<c:choose>
				<c:when test="${fn:length(buyList) eq 0}">
					<div class="tip">
						<p>您的购物车还是空的！</p>
						<a type="button" class="btn btn-primary" href="./">马上去购物</a>
					</div>
				</c:when>
				<c:otherwise>
					<div class="orderBox">
						<div class="row">
							<div class="col-sm-12 col-md-10 col-md-offset-1">
								<table class="table table-hover">
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
											<tr>
												<td class="col-sm-8 col-md-6">
													<div class="media">
														<a class="thumbnail pull-left" href="#"> <img
															class="media-object" src="resources/img/${buy.key.img}"
															style="width: 72px; height: 72px;">
														</a>
														<div class="media-body">
															<h4 class="media-heading">
																<a href="#">${buy.key.name}</a>
															</h4>
															<!-- 											<h5 class="media-heading"> -->
															<!-- 												by <a href="#">Brand name</a> -->
															<!-- 											</h5> -->
															<!-- 											<span>Status: </span><span class="text-success"><strong>In -->
															<!-- 													Stock</strong></span> -->
														</div>
													</div>
												</td>
												<td class="col-sm-1 col-md-1" style="text-align: center"><input
													type="text" class="form-control" value="${buy.value}"></td>
												<td class="col-sm-1 col-md-1 text-center"><strong>${buy.key.price}
														元</strong></td>
												<td class="col-sm-1 col-md-1 text-center"><strong>${buy.key.price*buy.value}
														元</strong></td>
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
											<td class="text-right"><h3>
													<strong>${sum}元</strong>
												</h3></td>
										</tr>
										<tr>
											<td> </td>
											<td> </td>
											<td> </td>
											<td>
												<button type="button" class="btn btn-default">
													<span class="glyphicon glyphicon-shopping-cart"></span>
													继续购物
												</button>
											</td>
											<td>
												<button type="button" class="btn btn-success" onclick="buy()">
													结算 <span class="glyphicon glyphicon-play"></span>
												</button>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<script type="text/javascript" src="resources/js/jquery.min.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/js/cart.js"></script>
</body>
</html>