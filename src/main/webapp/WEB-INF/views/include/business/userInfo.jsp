<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Page Content -->
<div class="box container">

	<div class="box-header  row">
		<h3 class="box-title">个人信息</h3>

		<div class="col-md-12 box-body" style="background-color: white;">

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
						<form action="./updateUser" method="post"
							enctype="multipart/form-data">
							<fieldset>
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" /> <input type="hidden" name="username"
									value="${user.username}">
								<div class="modal-body">
									<div class="form-group">
										<label for="emailInput">邮箱</label> <input type="email"
											class="form-control" id="emailInput"
											placeholder="xxxx@xxx.xxx" value="${user.email}"
											oninput="onEmailInput (event)"
											onpropertychange="onEmailPropChanged (event)" />
										<p class="help-block">请填写你的电子邮箱</p>
										<div id="email_input_warn" class="alert alert-warning"
											role="alert" hidden="hidden">电子邮箱格式不正确！</div>
									</div>
									<div class="form-group">
										<label for="phoneInput">手机号</label> <input type="tel"
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
									<button type="submit" class="btn btn-primary" id="submuit_btn1">保存</button>
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
						<form action="./newAddress" method="post">
							<fieldset>
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" /> <input type="hidden" name="username"
									value="${user.username}">
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
						<form action="./updatePassword" method="post">
							<fieldset>
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" /> <input type="hidden" name="username"
									value="${user.username}">
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
									<button type="submit" class="btn btn-primary" id="submuit_btn2">保存</button>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
			<!-- /.modal -->
			<div class="col-md-offset-1 col-md-3" style="margin-top: 4%">
				<img alt="" src="resources/img/avatar/${user.avatar}" width="150px"
					height="150px" class="img-circle">
			</div>
			<div class="col-md-offset-3 col-md-5 "
				style="margin-top: 4%; margin-bottom: 4%;">
				<ul>
					<li><h4>用户名：${user.username}</h4></li>
					<li><h4>邮箱：${user.email}</h4></li>
					<li><h4>手机：${user.phone}</h4></li>
					<li><h4>
							操作： <a data-toggle="modal" data-target="#myModal" title="修改用户信息">
								<span class="glyphicon glyphicon-pencil"></span>
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
	</div>
</div>
<!-- /.container -->



