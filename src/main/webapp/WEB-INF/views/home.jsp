<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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

<title>首頁--特色农产品电子商务网站</title>
<!-- Bootstrap Core CSS -->
<link rel="icon" href="resources/img/favicon.png">
<link href="resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style type="text/css">
/*!
 * Start Bootstrap - Shop Homepage HTML Template (http://startbootstrap.com)
 * Code licensed under the Apache License v2.0.
 * For details, see http://www.apache.org/licenses/LICENSE-2.0.
 */
body {
	padding-top: 70px;
	background-color: rgb(249, 249, 249);
	/* Required padding for .navbar-fixed-top. Remove if using .navbar-static-top. Change if height of navigation changes. */
}

.slide-image {
	width: 100%;
}

.carousel-holder {
	margin-bottom: 30px;
}

.carousel-control, .item {
	border-radius: 4px;
}

.caption {
	height: 130px;
	overflow: hidden;
}

.caption h4 {
	white-space: nowrap;
}

.thumbnail img {
	width: 100%;
}

.ratings {
	padding-right: 10px;
	padding-left: 10px;
	color: #d17581;
}

.thumbnail {
	padding: 0;
}

.thumbnail .caption-full {
	padding: 9px;
	color: #333;
}

footer {
	margin: 50px 0;
}

.price {
	color: #e4393c;
}

.stock {
	color: green;
}
</style>

</head>

<body>

	<!-- Navigation -->
	<%@include file="include/nav.jsp"%>
	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<div class="col-md-3">
				<ol class="breadcrumb">
					<li class="active">主页</li>
				</ol>

				<div class="list-group " role="tablist">
					<a class="list-group-item  active categoryBtn" href="#all"
						onclick="categoryActive(this)" aria-controls="all" role="tab"
						data-toggle="tab">全部</a>
					<c:forEach items="${categories}" var="category" varStatus="vs">
						<a class="list-group-item  categoryBtn" href="#${category.id}"
							onclick="categoryActive(this)" aria-controls="${category.id}"
							role="tab" data-toggle="tab">${category.name}</a>
					</c:forEach>
				</div>

				<form action="./" method="get">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="搜索"
							name="search"> <span class="input-group-btn">
							<button class="btn btn-default" type="submit">
								<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
							</button>
						</span>
					</div>
				</form>
				<br>
				<!-- /input-group -->
				<div class="btn-group" role="group" aria-label="...">
					<a type="button"
						class="btn btn-default btn-xs <c:if test='${order eq null}'>active</c:if>"
						href="./"> 综合 <span
						class="glyphicon glyphicon-sort-by-attributes-alt"
						aria-hidden="true"></span>
					</a> <a type="button"
						class="btn btn-default btn-xs <c:if test="${order eq 'score'}">active</c:if>"
						href="./?order=score<c:if test="${order eq 'score'}">&&asc=${asc}</c:if>">
						人气<span
						class="glyphicon glyphicon-sort-by-attributes<c:if test="${order eq 'score' and asc eq true}">-alt</c:if>"
						aria-hidden="true"></span>
					</a> <a type="button"
						class="btn btn-default btn-xs <c:if test="${order eq 'date'}">active</c:if>"
						href="./?order=date<c:if test="${order eq 'date'}">&&asc=${asc}</c:if>">
						新品<span
						class="glyphicon glyphicon-sort-by-attributes<c:if test="${order eq 'date' and asc eq true}">-alt</c:if>"
						aria-hidden="true"></span>
					</a> <a type="button"
						class="btn btn-default btn-xs <c:if test="${order eq 'sale'}">active</c:if>"
						href="./?order=sale<c:if test="${order eq 'sale'}">&&asc=${asc}</c:if>">
						销量<span
						class="glyphicon glyphicon-sort-by-attributes<c:if test="${order eq 'sale' and asc eq true}">-alt</c:if>"
						aria-hidden="true"></span>
					</a> <a type="button"
						class="btn btn-default btn-xs <c:if test="${order eq 'price'}">active</c:if>"
						href="./?order=price<c:if test="${order eq 'price'}">&&asc=${asc}</c:if>">
						价格<span
						class="glyphicon glyphicon-sort-by-attributes<c:if test="${order eq 'price' and asc eq true}">-alt</c:if>"
						aria-hidden="true"></span>
					</a>
				</div>
				<br>
				<hr>
			</div>
			<div class="col-md-9">

				<div class="row carousel-holder">

					<div class="col-md-12">
						<div id="carousel-example-generic" class="carousel slide"
							data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#carousel-example-generic" data-slide-to="0"
									class="active"></li>
								<li data-target="#carousel-example-generic" data-slide-to="1"></li>
								<li data-target="#carousel-example-generic" data-slide-to="2"></li>
							</ol>
							<div class="carousel-inner">
								<div class="item active">
									<img class="slide-image" src="resources/img/slide1-img.jpg"
										alt="">
								</div>
								<div class="item">
									<img class="slide-image" src="resources/img/slide2-img.jpg"
										alt="">
								</div>
								<div class="item">
									<img class="slide-image" src="resources/img/slide3-img.jpg"
										alt="">
								</div>
							</div>
							<a class="left carousel-control" href="#carousel-example-generic"
								data-slide="prev"> <span
								class="glyphicon glyphicon-chevron-left"></span>
							</a> <a class="right carousel-control"
								href="#carousel-example-generic" data-slide="next"> <span
								class="glyphicon glyphicon-chevron-right"></span>
							</a>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane active" id="all">
							<c:forEach items="${items}" var="item">
								<div class="col-sm-2 col-lg-4 col-md-4">
									<div class="thumbnail ">
										<c:if test="${fn:length(item.imgs) gt 0 }">
											<img src="resources/img/items/${item.imgs[0]}" alt=""
												width="320" height="120">
										</c:if>
										<div class="caption">
											<h4 class="pull-right price">￥${item.price}/斤</h4>
											<h4>
												<a href="item?item_id=${item.id}">${item.name}</a>
											</h4>
											<h5 class="pull-right stock">库存：${item.stock}斤</h5>
											<br>
											<p>${item.description}</p>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<c:forEach items="${categories}" var="category" varStatus="vs">
							<div role="tabpanel" class="tab-pane" id="${category.id}">
								<c:forEach items="${category.items}" var="item">
									<div class="col-sm-2 col-lg-4 col-md-4">
										<div class="thumbnail">
											<c:if test="${fn:length(item.imgs) gt 0 }">
												<img src="resources/img/items/${item.imgs[0]}" alt=""
													width="320" height="120">
											</c:if>
											<div class="caption">
												<h4 class="pull-right price">￥${item.price}/斤</h4>
												<h4>
													<a href="item?item_id=${item.id}">${item.name}</a>
												</h4>
												<h5 class="pull-right stock">库存：${item.stock}斤</h5>
												<br>
												<p>${item.description}</p>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</c:forEach>
					</div>

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
	<script type="text/javascript" src="resources/js/cart.js"></script>
	<script type="text/javascript">
		function categoryActive(obj) {
			$('.categoryBtn').removeClass("active");
			$(obj).addClass("active	");
		}

		// 		function categoryAllActive(obj) {
		// 			$('.categoryBtn').removeClass("active");
		// 			$(obj).addClass("active	");
		// 			$('.tab-pane').addClass('active');
		// 		}
	</script>


</body>

</html>
