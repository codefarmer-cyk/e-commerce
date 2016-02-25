<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="false"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="keywords" content="原生态、原产地、天然食品、有机食品、特色农产品、生鲜电商、一地一味、企业定制">
<meta name="description"
	content="一地一味致力于将新农业与互联网结合，专注寻找原产地、健康优质食材，专门成立寻味团，来到食物最初生长的地方，从食材的源头把关，为追求生活品质的人们提供安全，健康的食材。让您足不出户，吃到天下健康美味。">
<title>一地一味_本地化生鲜特色农产品共享平台</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<!-- <link rel="icon" href="favicon.ico" type="image/x-icon" /> -->
<!-- <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" /> -->
<style type="text/css">
.top {
	/* 	background-color: green; */
	
}

.footer {
	background-color: gray;
}

.slide {
	margin-bottom: 50px;
}

.content {
	background-color: white;
	margin: 3%;
	padding: 2%;
	border-radius: 10px;
	box-shadow: 5px 5px 10px #888888;
}

.itemImg {
	box-shadow: 3px 3px 10px #888888;
	border-radius: 3px;
	width: 180p;
	height: 180px;
}

.item_box {
	padding: 5%;
	margin-top: 5%;
	border-radius: 10px;
	border: solid 1px #ededed;
	background-color: #f5f5f5;
	text-align: center;
}

body {
	background-color: #f8f8ff;
}

.price {
	color: #e4393c;
}

.header {
	background-color: gray;
}

a:link {
	text-decoration: none;
	color: gray;
}

a:active {
	text-decoration: blink;
}

a:hover {
	text-decoration: none;
	color: #e4393c;
}

a:visited {
	text-decoration: none;
	color: gray;
}
</style>
</head>
<body>
	<div class="header">
		<%@include file="include/nav.jsp"%>
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-offset-4 col-md-4">
					<form class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Search">
						</div>
						<button type="submit" class="btn btn-default">
							<span class="glyphicon glyphicon-search" aria-hidden="true">
						</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="content">
		<div class="slide">
			<div class="container-fluid">
				<div class="row">
					<!-- 			<div class="col-md-3"> -->
					<!-- 				<div class="list-group"> -->
					<!-- 					<a href="#" class="list-group-item active">First item<i -->
					<!-- 						class="icon-chevron-right"></i></a> <a href="#" -->
					<!-- 						class="list-group-item">Second item<i -->
					<!-- 						class="icon-chevron-right"></i></a> <a href="#" -->
					<!-- 						class="list-group-item">Third item<i -->
					<!-- 						class="icon-chevron-right"></i></a> -->
					<!-- 				</div> -->
					<!-- 			</div> -->
					<div class="col-md-offset-1 col-md-10">
						<div id="carousel-example-generic" class="carousel slide"
							data-ride="carousel">
							<!-- Indicators -->
							<ol class="carousel-indicators">
								<li data-target="#carousel-example-generic" data-slide-to="0"
									class="active"></li>
								<li data-target="#carousel-example-generic" data-slide-to="1"></li>
								<!-- 							<li data-target="#carousel-example-generic" data-slide-to="2"></li> -->
							</ol>

							<!-- Wrapper for slides -->
							<div class="carousel-inner" role="listbox">
								<div class="item active">
									<img src="resources/img/home-bg.jpg" alt="...">
									<div class="carousel-caption">...</div>
								</div>
								<div class="item">
									<img src="resources/img/post-bg.jpg" alt="...">
									<div class="carousel-caption">...</div>
								</div>
							</div>
							<!-- Controls -->
							<a class="left carousel-control" href="#carousel-example-generic"
								role="button" data-slide="prev"> <span
								class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
								<span class="sr-only">Previous</span>
							</a> <a class="right carousel-control"
								href="#carousel-example-generic" role="button" data-slide="next">
								<span class="glyphicon glyphicon-chevron-right"
								aria-hidden="true"></span> <span class="sr-only">Next</span>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="item_list">
			<div class="container">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
					<c:forEach items="${categories}" var="category" varStatus="vs">
						<li role="presentation"
							class="<c:if test='${vs.count eq 1}'>active</c:if>"><a
							href="#${category.id}" aria-controls="${category.id}" role="tab"
							data-toggle="tab">${category.name}</a></li>
					</c:forEach>
					<!-- 					<li role="presentation" class="active"><a href="#home" -->
					<!-- 						aria-controls="home" role="tab" data-toggle="tab">Home</a></li> -->
					<!-- 					<li role="presentation"><a href="#profile" -->
					<!-- 						aria-controls="profile" role="tab" data-toggle="tab">Profile</a></li> -->
					<!-- 					<li role="presentation"><a href="#messages" -->
					<!-- 						aria-controls="messages" role="tab" data-toggle="tab">Messages</a></li> -->
					<!-- 					<li role="presentation"><a href="#settings" -->
					<!-- 						aria-controls="settings" role="tab" data-toggle="tab">Settings</a></li> -->
				</ul>

				<!-- Tab panes -->
				<div class="tab-content">
					<c:forEach items="${categories}" var="category" varStatus="vs">
						<div role="tabpanel" class="tab-pane active" id="${category.id}">
							<c:if test="${fn:length(category.items) gt 0}">
								<div class="row">
									<c:forEach items="${category.items}" var="item">
										<div class="col-md-3 ">
											<div class="item_box">
												<a href="item?item_id=${item.id}"> <img alt=""
													src="resources/img/${item.img}" class="itemImg">
													<h3>${item.name}</h3>
												</a>
												<h3 class="price">￥${item.price}</h3>
											</div>
										</div>
									</c:forEach>
								</div>
							</c:if>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<%@include file="include/footer.jsp"%>
	<script type="text/javascript" src="resources/js/jquery.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery.fly.min.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/js/cart.js"></script>
</body>
</html>
