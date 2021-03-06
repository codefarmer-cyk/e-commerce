<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>${item.name}--特色农产品电子商务网站</title>

<!-- Bootstrap Core CSS -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link rel="icon" href="resources/img/favicon.png">
<link rel="stylesheet" href="resources/css/common.css">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<%@include file="include/nav.jsp"%>

	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<div class="col-md-3 ">
				<ol class="breadcrumb">
					<li><a href="./">主页</a></li>
					<li class="active">${item.name}</li>
				</ol>

				<div class="thumbnail">
					<br> <img src="resources/img/shop/${item.shop.icon}"
						class="img-thumbnail">
					<div class="caption">
						<hr>
						<h4>${item.shop.name}</h4>
						<p>
							<c:if test="${user ne null }">
								<a title="<c:if test='${itemCollected eq true }'>取消</c:if>收藏">
									<span
									class="glyphicon glyphicon-heart<c:if test='${shopCollected ne true }'>-empty</c:if>"
									aria-hidden="true" style="font-size: 20pt;"
									onclick="toggleShopCollection(this,${item.shop.id})"></span>
								</a>
							</c:if>
							<a href="./shop?shopUsername=${item.shop.user.username}"
								class="pull-right" title="进去逛逛"><span><img
									style="width: 20px;" src="resources/img/favicon.png"></span> </a> <br>
						</p>
					</div>
				</div>
				<hr>
			</div>

			<div class="col-md-9">

				<div class="thumbnail">
					<div class="row carousel-holder">

						<div class="col-md-12 ">
							<div id="carousel-example-generic" class="carousel slide"
								data-ride="carousel">
								<ol class="carousel-indicators">
									<c:forEach items="${item.imgs}" var="img" varStatus="vs">
										<li data-target="#carousel-example-generic"
											data-slide-to="${vs.count-1}"
											<c:if test='${vs.count eq 1}'>class="active"</c:if>></li>
									</c:forEach>
								</ol>
								<div class="carousel-inner">
									<c:forEach items="${item.imgs}" var="img" varStatus="vs">
										<div class="item <c:if test='${vs.count eq 1}'>active</c:if> ">
											<img class="slide-image" src="resources/img/items/${img}"
												alt="" style="height: 500px;"
												<c:if test='${vs.count eq 1}'>id="itemImg"</c:if>>
										</div>
									</c:forEach>
								</div>
								<a class="left carousel-control"
									href="#carousel-example-generic" data-slide="prev"> <span
									class="glyphicon glyphicon-chevron-left"></span>
								</a> <a class="right carousel-control"
									href="#carousel-example-generic" data-slide="next"> <span
									class="glyphicon glyphicon-chevron-right"></span>
								</a>
							</div>
						</div>
					</div>
					<div class="caption-full">
						<h4 class="pull-right price">
							￥
							<fmt:formatNumber type="number" value="${item.price} "
								minFractionDigits="2" />
							/斤
						</h4>
						<h4>
							<a href="#">${item.name}</a>
						</h4>
						<h4 class="pull-right stock">库存：${item.stock} 斤</h4>
						<c:if test="${user ne null }">
							<div class="text-left">
								<a title="<c:if test='${itemCollected eq true }'>取消</c:if>收藏">
									<span
									class="glyphicon glyphicon-heart<c:if test='${itemCollected ne true }'>-empty</c:if>"
									aria-hidden="true" style="font-size: 20pt;"
									onclick="toggleItemCollection(this,${item.id})"></span>
								</a>
							</div>
						</c:if>
						<br> <br>
						<div class="text-right">
							<a
								class="btn btn-success addcar <c:if test='${item.stock eq 0}'>disabled</c:if>"
								onclick="addCart('${item.id}',1)">加入购物车</a>
						</div>
						<p>${item.description}</p>
					</div>
					<div class="ratings">
						<p class="pull-right">${fn:length(reviews)}条评论</p>
						<p>
							<c:forEach begin="1" end="${item.score}">
								<span class="glyphicon glyphicon-star"></span>
							</c:forEach>
							<c:forEach begin="1" end="${5-item.score}">
								<span class="glyphicon glyphicon-star-empty"></span>
							</c:forEach>
							${item.score} 分
						</p>
					</div>
				</div>

				<div class="well">
					<hr>
					<c:forEach items="${reviews}" var="review">
						<div class="row">
							<div class="col-md-12">
								<c:forEach begin="1" end="${review.score}">
									<span class="glyphicon glyphicon-star"></span>
								</c:forEach>
								<c:forEach begin="1" end="${5-review.score}">
									<span class="glyphicon glyphicon-star-empty"></span>
								</c:forEach>
								${review.user.username} <span class="pull-right">${review.date}</span>
								<p>${review.comment}</p>
							</div>
						</div>
						<hr>
					</c:forEach>

				</div>

			</div>

		</div>

	</div>
	<!-- /.container -->
	<%@include file="include/footer.jsp"%>
	<!-- /.container -->

	<!-- jQuery -->
	<script src="resources/js/jquery.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery.fly.min.js"></script>
	<script type="text/javascript" src="resources/js/cart.js"></script>
	<script type="text/javascript">
		function toggleCollectionIcon(obj) {
			if ($(obj).hasClass("glyphicon-heart-empty")) {
				$(obj).removeClass("glyphicon-heart-empty");
				$(obj).addClass("glyphicon-heart");
				$(obj).parent().attr("title", "取消收藏");
			} else {
				$(obj).parent().attr("title", "收藏");
				$(obj).removeClass("glyphicon-heart");
				$(obj).addClass("glyphicon-heart-empty");
			}
		}

		function toggleItemCollection(obj, item_id) {
			$.ajax({
				type : 'POST',
				url : './toggleItemCollection',
				data : {
					'item_id' : item_id,
					'${_csrf.parameterName}' : '${_csrf.token}'
				},
				success : function(data) {
					toggleCollectionIcon(obj);
				},
				dataType : 'json'
			});
		}
		
		function toggleShopCollection(obj, shop_id) {
			$.ajax({
				type : 'POST',
				url : './toggleShopCollection',
				data : {
					'shop_id' : shop_id,
					'${_csrf.parameterName}' : '${_csrf.token}'
				},
				success : function(data) {
					toggleCollectionIcon(obj);
				},
				dataType : 'json'
			});
		}
	</script>
</body>

</html>
