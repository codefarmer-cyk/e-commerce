<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<!-- Custom CSS -->
<style type="text/css">
/*!
 * Start Bootstrap - Shop Item HTML Template (http://startbootstrap.com)
 * Code licensed under the Apache License v2.0.
 * For details, see http://www.apache.org/licenses/LICENSE-2.0.
 */
body {
	padding-top: 70px;
	background-color: rgb(249, 249, 249);
	/* Required padding for .navbar-fixed-top. Remove if using .navbar-static-top. Change if height of navigation changes. */
}

.animated {
	-webkit-transition: height 0.2s;
	-moz-transition: height 0.2s;
	transition: height 0.2s;
}

.stars {
	margin: 20px 0;
	font-size: 24px;
	color: #d17581;
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

.u-flyer {
	display: block;
	width: 50px;
	height: 50px;
	border-radius: 50px;
	position: fixed;
	z-index: 9999;
}

.price {
	color: #e4393c;
}
</style>
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

			<div class="col-md-3">
				<ol class="breadcrumb">
					<li><a href="./">主页</a></li>
					<li class="active">${item.name}</li>
				</ol>
				<div class="list-group">
					<c:forEach items="${item.imgs}" var="img" varStatus="vs">
						<a href="javascript:void(0);" onclick="showImg(this,'${img}')"
							class="list-group-item <c:if test='${vs.count eq 1}'>active </c:if>imgBtn">图片
							${vs.count}</a>
					</c:forEach>
				</div>
				<hr>
			</div>

			<div class="col-md-9">

				<div class="thumbnail">
					<c:if test="${fn:length(item.imgs) gt 0 }">
						<img id="itemImg" class="img-responsive"
							src="resources/img/items/${item.imgs[0]}" alt="">
					</c:if>
					<div class="caption-full">
						<h4 class="pull-right price">￥${item.price}/斤</h4>
						<h4>
							<a href="#">${item.name}</a>
						</h4>
						<h4 class="pull-right price">库存：${item.stock} 斤</h4>
						<c:if test="${user ne null }">
							<div class="text-left">
								<a title="<c:if test='${collected eq true }'>取消</c:if>收藏"> <span
									class="glyphicon glyphicon-heart<c:if test='${collected ne true }'>-empty</c:if>"
									aria-hidden="true" style="font-size: 20pt;"
									onclick="toggleCollection(this,${item.id})"></span>
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
							<c:forEach begin="1" end="${start}">
								<span class="glyphicon glyphicon-star"></span>
							</c:forEach>
							<c:forEach begin="1" end="${5-start}">
								<span class="glyphicon glyphicon-star-empty"></span>
							</c:forEach>
							${start} 分
						</p>
					</div>
				</div>

				<div class="well">
					<div class="row" id="reviews-anchor">
						<div class="row">
							<div class="col-md-12"></div>
						</div>

						<div class="text-right">
							<a href="#reviews-anchor" id="open-review-box"
								class="btn btn-success btn-green <c:if test='${user eq null}'>disabled</c:if>">评论</a>
						</div>
						<div class="row" id="post-review-box" style="display: none;">
							<div class="col-md-12">
								<form:form method="POST" commandName="newReview"
									action="./addReview">
									<form:hidden path="item.id" value="${item.id}" />
									<form:hidden path="user.username" value="${user.username}" />
									<form:hidden id="ratings-hidden" name="rating" path="score" />
									<form:textarea rows="5" id="new-review"
										class="form-control animated" path="comment"
										placeholder="Enter your review here..." name="comment"
										cols="50" />
									<div class="text-right">
										<div class="stars starrr" data-rating="0"></div>
										<a href="#" class="btn btn-danger btn-sm"
											id="close-review-box"
											style="display: none; margin-right: 10px;"> <span
											class="glyphicon glyphicon-remove"></span>取消
										</a>
										<button class="btn btn-success btn-lg" type="submit">提交</button>
									</div>
								</form:form>
							</div>
						</div>
					</div>

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
	<script src="resources/js/expanding.js"></script>
	<script src="resources/js/starrr.js"></script>
	<script type="text/javascript">
		$(function() {
			// initialize the autosize plugin on the review text area
			$('#new-review').autosize({
				append : "\n"
			});

			var reviewBox = $('#post-review-box');
			var newReview = $('#new-review');
			var openReviewBtn = $('#open-review-box');
			var closeReviewBtn = $('#close-review-box');
			var ratingsField = $('#ratings-hidden');

			openReviewBtn.click(function(e) {
				reviewBox.slideDown(400, function() {
					$('#new-review').trigger('autosize.resize');
					newReview.focus();
				});
				openReviewBtn.fadeOut(100);
				closeReviewBtn.show();
			});

			closeReviewBtn.click(function(e) {
				e.preventDefault();
				reviewBox.slideUp(300, function() {
					newReview.focus();
					openReviewBtn.fadeIn(200);
				});
				closeReviewBtn.hide();

			});

			// If there were validation errors we need to open the comment form programmatically 
			// Bind the change event for the star rating - store the rating value in a hidden field
			$('.starrr').on('starrr:change', function(e, value) {
				ratingsField.val(value);
			});
		});

		function showImg(obj, imgName) {
			$('.imgBtn').removeClass("active");
			$(obj).addClass("active	");
			$('#itemImg').attr("src", "resources/img/items/" + imgName);
		}

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

		function toggleCollection(obj, item_id) {
			$.ajax({
				type : 'POST',
				url : './toggleCollection',
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
	</script>
</body>

</html>
