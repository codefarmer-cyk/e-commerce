<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>${user.username}的个人主页--特色农产品品电子商务网站</title>
<link rel="icon" href="resources/img/favicon.png">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<style type="text/css">
body {
	padding-top: 70px;
	background-color: rgb(249, 249, 249);
}

div .address {
	border: solid thin gray;
	padding: 10px;
	background-color: #f8f8ff;
	border-radius: 10px;
	margin-bottom: 10%;
}

.price {
	color: #e4393c;
}

caption {
	height: 130px;
	overflow: hidden;
}

.caption h4 {
	white-space: nowrap;
}

.thumbnail img {
	width: 100%;
}

.thumbnail {
	padding: 0;
}

.thumbnail .caption-full {
	padding: 9px;
	color: #333;
}
</style>
</head>
<body>

	<!-- Navigation -->
	<%@include file="include/nav.jsp"%>
	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<div class="col-md-2">
				<ol class="breadcrumb">
					<li><a href="./">主页</a></li>
					<li class="active">个人中心</li>
				</ol>

				<div class="list-group " role="tablist">
					<a class="list-group-item categoryBtn active " href="#profile"
						onclick="categoryActive(this)" aria-controls="profile" role="tab"
						data-toggle="tab">个人信息</a> <a class="list-group-item categoryBtn"
						href="#collection" aria-controls="collection" role="tab"
						onclick="categoryActive(this)" data-toggle="tab">我的收藏</a> <a
						class="list-group-item categoryBtn" onclick="categoryActive(this)"
						href="#order" aria-controls="order" role="tab" data-toggle="tab">我的订单</a>
				</div>
				<hr>
			</div>

			<div class="col-md-10" style="background-color: white;">

				<!-- Update User Profile Modal -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">修改用户信息</h4>
							</div>
							<form action="./user/updateUser" method="post"
								enctype="multipart/form-data">
								<fieldset>
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" /> <input type="hidden"
										name="username" value="${user.username}">
									<div class="modal-body">
										<div class="form-group">
											<label for="emailInput">邮箱</label> <input type="text"
												class="form-control" id="emailInput"
												placeholder="xxxx@xxx.xxx" value="${user.email}"
												oninput="onEmailInput (event)"
												onpropertychange="onEmailPropChanged (event)" />
											<p class="help-block">请填写你的电子邮箱</p>
											<div id="email_input_warn" class="alert alert-warning"
												role="alert" hidden="hidden">电子邮箱格式不正确！</div>
										</div>
										<div class="form-group">
											<label for="phoneInput">手机号</label> <input type="text"
												class="form-control" id="iphoneInput"
												placeholder="xxxxxxxxxxxx" value="${user.phone}"
												oninput="onPhoneInput (event)"
												onpropertychange="onPhonePropChanged (event)" />
											<p class="help-block">请填写你的11位手机号码</p>
											<div id="phone_input_warn" class="alert alert-warning"
												role="alert" hidden="hidden">手机号码格式不正确！</div>
										</div>
										<div class="form-group">
											<label for="avatarInput">用户头像图片</label> <input type="file"
												id="avatarInput" name="avatar">
										</div>
									</div>
									<div class="modal-footer">
										<button type="reset" class="btn btn-default"
											data-dismiss="modal">取消</button>
										<button type="submit" class="btn btn-primary"
											id="submuit_btn1">保存</button>
									</div>
								</fieldset>
							</form>
						</div>
					</div>
				</div>
				<!-- /.modal -->

				<!-- Add User Address Modal -->
				<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel2">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">添加新地址</h4>
							</div>
							<form action="./user/newAddress" method="post">
								<fieldset>
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" /> <input type="hidden"
										name="username" value="${user.username}">
									<div class="modal-body">
										<div class="form-group">
											<label for="addressInput">地址</label> <input type="text"
												class="form-control" id="addressInput" placeholder=""
												name="address" />
										</div>
									</div>
									<div class="modal-footer">
										<button type="reset" class="btn btn-default"
											data-dismiss="modal">取消</button>
										<button type="submit" class="btn btn-primary">保存</button>
									</div>
								</fieldset>
							</form>
						</div>
					</div>
				</div>
				<!-- /.modal -->

				<!-- Update User Password Modal -->
				<div class="modal fade" id="myModal3" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">修改密码</h4>
							</div>
							<form action="./user/updatePassword" method="post">
								<fieldset>
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" /> <input type="hidden"
										name="username" value="${user.username}">
									<div class="modal-body">
										<div class="form-group">
											<label for="oldPasswordInput">原始密码</label> <input
												type="password" class="form-control" id="oldPasswordInput"
												placeholder="*******" name="password" />
										</div>
										<div class="form-group">
											<label for="password">新密码</label> <input type="password"
												class="form-control" id="password" placeholder="*******"
												name="newPassword" oninput="onPasswordInput (event)"
												onpropertychange="onPasswordPropChanged (event)" />
											<p class="help-block">密码至少包含6个字符</p>
											<div id="password_input_warn" class="alert alert-warning"
												role="alert" hidden>密码不符合规则！</div>
										</div>
										<div class="form-group">
											<label for="ConfirmNewPasswordInput">重复新密码</label> <input
												type="password" class="form-control"
												id="ConfirmNewPasswordInput" placeholder="*******"
												name="confirmNewPassword"
												oninput="onPasswordConfirmInput (event)"
												onpropertychange="onPasswordConfirmPropChanged (event)" />
											<p class="help-block">请确认密码</p>
											<div id="password_confirm_input_warn"
												class="alert alert-warning" role="alert" hidden>密码不一致！</div>
										</div>
									</div>
									<div class="modal-footer">
										<button type="reset" class="btn btn-default"
											data-dismiss="modal">取消</button>
										<button type="submit" class="btn btn-primary"
											id="submuit_btn2">保存</button>
									</div>
								</fieldset>
							</form>
						</div>
					</div>
				</div>
				<!-- /.modal -->
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane active" id="profile">
						<div class="col-md-offset-1 col-md-3" style="margin-top: 4%">
							<img alt="" src="resources/img/avatar/${user.avatar}"
								width="150px" height="150px" class="img-circle">
						</div>
						<div class="col-md-offset-3 col-md-5 "
							style="margin-top: 4%; margin-bottom: 4%;">
							<ul>
								<li><h4>用户名：${user.username}</h4></li>
								<li><h4>邮箱：${user.email}</h4></li>
								<li><h4>手机：${user.phone}</h4></li>
								<li><h4>
										操作： <a data-toggle="modal" data-target="#myModal"
											title="修改用户信息"> <span class="glyphicon glyphicon-pencil"></span>
										</a><a data-toggle="modal" data-target="#myModal3" title="修改密码">
											<span class="glyphicon glyphicon-edit"></span>
										</a>
									</h4></li>
							</ul>
						</div>
						<div class="col-md-12" style="margin: 1% 0 1% 0;">
							<hr>
							<h3>地址列表：</h3>
							<br>
						</div>
						<c:forEach items="${addresses}" var="address">
							<div class="col-md-3">
								<div class="address text-center">
									<p>${address}</p>
								</div>
							</div>
						</c:forEach>
						<div class="col-md-2">
							<div class="address text-center">
								<a data-toggle="modal" data-target="#myModal2"> <span
									class="glyphicon glyphicon-plus" title="添加新地址"></span>
								</a>
							</div>
						</div>
					</div>
					<div role="tabpanel" class="tab-pane" id="collection">
						<c:forEach items="${collections}" var="item">
							<div class="col-md-3" style="margin-top: 3%">
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
										<h5 class="pull-right">库存:${item.stock}斤</h5>
										<p>${item.description}</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<div role="tabpanel" class="tab-pane" id="order">
						<ul>
							<c:forEach items="${orders}" var="order">
								<li style="margin-top: 3%;">
									<h5>订单号:${order.id}</h5>
									<h5>订单日期:${order.date}</h5> <a class="btn btn-default"
									role="button" data-toggle="collapse" href="#${order.id}"
									aria-expanded="false" aria-controls="collapseExample"> <span
										class="glyphicon glyphicon-list-alt"></span>
								</a>
									<div class="collapse" id="${order.id}">
										<div class="col-md-12 table-responsive">
											<table class="table table-hover">
												<thead>
													<tr>
														<th>商品名称</th>
														<th>数量</th>
														<th class="text-center">单价</th>
														<th class="text-center">小计</th>
														<th></th>
													</tr>
												</thead>
												<tbody>
													<c:set value="0" var="sum" />
													<c:forEach items="${order.items_amount}" var="buy">
														<tr>
															<td class="col-sm-5 col-md-5">
																<div class="media">
																	<a class="thumbnail pull-left"
																		href="./item?item_id=${buy.key.id}"> <img
																		class="media-object"
																		src="resources/img/items/${buy.key.imgs[0]}"
																		style="width: 72px; height: 72px;">
																	</a>
																	<div class="media-body">
																		<h4 class="media-heading">
																			<a href="./item?item_id=${buy.key.id}">
																				${buy.key.name}</a>
																		</h4>
																		<span>库存: </span><span class="text-success"><strong>
																				${buy.key.stock} 斤</strong></span>
																	</div>
																</div>
															</td>
															<td class="col-sm-1 col-md-1 text-center"><strong>${buy.value}</strong>
															</td>
															<td class="col-sm-1 col-md-1 col-md-1 text-center"><strong>${buy.key.price}
																	元</strong></td>
															<td class="col-sm-1 col-md-1 text-center"><strong>${buy.key.price*buy.value}
																	元</strong></td>
															<td class="col-sm-1 col-md-1"><a
																class="btn btn-success" title="去评论"
																href="./item?item_id=${buy.key.id}#reviews-anchor"><span
																	class="glyphicon glyphicon-comment"></span></a></td>
															<c:set var="sum" value="${sum+buy.key.price*buy.value}" />
														</tr>
													</c:forEach>
													<tr>
														<td> </td>
														<td> </td>
														<td></td>
														<td><h3>合计</h3></td>
														<td class="text-right"><h3>
																<strong class="price">￥${sum}</strong>
															</h3></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</li>
								<hr>
							</c:forEach>
						</ul>
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
	<script type="text/javascript" src="resources/js/register.js"></script>
	<script type="text/javascript">
		input2 = true;
		input3 = true;
		function categoryActive(obj) {
			$('.categoryBtn').removeClass("active");
			$(obj).addClass("active	");
		}
		function isOK() {
			if (input2 && input3) {
				$("#submuit_btn1").removeAttr("disabled");
			} else {
				$("#submuit_btn1").attr("disabled", "disabled");
			}
			if (input4 && input5) {
				$("#submuit_btn2").removeAttr("disabled");
			} else {
				$("#submuit_btn2").attr("disabled", "disabled");
			}
		}
	</script>
</body>
</html>