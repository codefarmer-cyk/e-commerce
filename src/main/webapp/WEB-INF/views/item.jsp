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
<style type="text/css">
.u-flyer {
	display: block;
	width: 50px;
	height: 50px;
	border-radius: 50px;
	position: fixed;
	z-index: 9999;
}

body {
	background-color: #f8f8ff;
}

.content {
	background-color: white;
	margin: 3%;
	padding: 3%;
	border-radius: 10px;
	box-shadow: 5px 5px 10px #888888;
}

.itemImg {
	box-shadow: 3px 3px 10px #888888;
	border-radius: 3px;
}

.item_box {
	padding: 5%;
	margin-top: 5%;
	border-radius: 10px;
	border: solid 1px #ededed;
	background-color: #f5f5f5;
	text-align: center;
}

.price {
	color: #e4393c;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<%@include file="include/nav.jsp"%>
	<div class="content">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<div class="item_box">
						<img alt="" src="resources/img/${item.img}" class="itemImg">
					</div>
				</div>
				<div class="col-md-8">
					<h1>${item.name}</h1>
					<h2 class="price">￥${item.price}</h2>
					<p></p>
					<button type="button" class="btn btn-primary addcar"
						onclick="addCart('${item.id}',1)">加入购物车</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="resources/js/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/jquery.fly.min.js"></script>
<script type="text/javascript" src="resources/js/cart.js"></script>
</html>