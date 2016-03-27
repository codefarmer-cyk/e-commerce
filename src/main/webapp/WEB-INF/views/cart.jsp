<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
					<c:when test="${fn:length(order.subOrders) eq 0}">
						<div class="tip">
							<p>您的购物车还是空的！</p>
							<a type="button" class="btn btn-primary" href="./">马上去购物</a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="orderBox">
							<div class="col-md-12 table-responsive ">
								<form:form action="./order" commandName="order" method="post">
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
											<c:forEach items="${order.subOrders}" var="subOrder"
												varStatus="vs">
												<form:hidden path="subOrders[${vs.index}].item.id"
													value="${subOrder.item.id}" />
												<form:hidden path="subOrders[${vs.index}].status"
													value="STATUS_COMMITED" />

												<tr class="item">
													<td class="col-sm-3 col-md-3">
														<div class="media">
															<a class="thumbnail pull-left" href="#"> <img
																class="media-object"
																src="resources/img/items/${subOrder.item.imgs[0]}"
																style="width: 72px; height: 72px;">
															</a>
															<div class="media-body">
																<h4 class="media-heading">
																	<a href="#"> ${subOrder.item.name}</a>
																</h4>
																<!-- 															<h5 class="media-heading"> -->
																<!-- 																by <a href="#">Brand name</a> -->
																<!-- 															</h5> -->
																<span>库存: </span><span class="text-success"><strong>${subOrder.item.stock}</strong></span>
															</div>
														</div>
													</td>
													<td class="col-sm-1 col-md-1" style="text-align: center"><form:input
															path="subOrders[${vs.index}].amount" type="number"
															class="form-control amount" min="1"
															value="${subOrder.amount}"
															oninput="onAmountInput (event,'${subOrder.item.id}',${subOrder.item.stock})"
															onpropertychange="onEmailPropChanged (event,'${subOrder.item.id}',${subOrder.item.stock})" />
													</td>
													<td class="col-sm-1 col-md-1 text-center"><strong><span
															class="price"><fmt:formatNumber type="number"
																	value="${subOrder.item.price} " minFractionDigits="2" /></span>
															元</strong></td>
													<td class="col-sm-1 col-md-1 text-center"><strong><span
															class="subSum">${subOrder.item.price*subOrder.amount}</span>
															元</strong></td>
													<c:set var="sum"
														value="${sum+subOrder.item.price*subOrder.amount}" />
													<td class="col-sm-1 col-md-1">
														<button type="button" class="btn btn-danger"
															onclick="removeCart('item_${subOrder.item.id}')">
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
													<button type="submit" class="btn btn-success">
														结算 <span class="glyphicon glyphicon-play"></span>
													</button>
												</td>
											</tr>
										</tbody>
									</table>
								</form:form>
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