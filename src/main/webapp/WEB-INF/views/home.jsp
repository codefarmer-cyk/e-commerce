<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	/* 	margin: 0 10% 0 0; */
	
}

.content {
	margin: 10%;
}

body {
	background-color: #f5f5f5;
}
</style>
</head>
<body>
	<%@include file="include/nav.jsp"%>
	<div class="container">
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
			<div class="slide col-md-offset-1 col-md-10">
				<div id="carousel-example-generic" class="carousel slide"
					data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0"
							class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
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
					</a> <a class="right carousel-control" href="#carousel-example-generic"
						role="button" data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>

						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
		</div>
		<div class="content">
			<div>

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
							<div class="row">
								<c:forEach items="${category.items}" var="item">
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
					</c:forEach>
				</div>
			</div>

			<!-- 			<div class="container"> -->

			<!-- 			</div> -->
		</div>
	</div>
	<%@include file="include/footer.jsp"%>
	<script type="text/javascript" src="resources/js/jquery.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery.fly.min.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/js/cart.js"></script>
</body>
</html>
