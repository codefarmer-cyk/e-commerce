<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="robots" content="noindex">
<title>注册 --特色农产品电子商务网站</title>
<link rel="icon" href="resources/img/favicon.png">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<style type="text/css">
.register_form {
	background-color: white;
	padding: 5%;
	border-radius: 15px;
}

body {
	padding-top: 70px;
	background-color: rgb(249, 249, 249);
}
</style>
</head>
<body>
	<%@include file="include/nav.jsp"%>
	<div class="content">
		<div class="container">
			<div class="row">
				<div class="col-md-offset-3 col-md-6 register_form">
					<form:form commandName="newUser" class="form-horizontal"
						method="POST" action="./register.do">
						<fieldset>
							<div id="legend">
								<legend class="">注册</legend>
							</div>
							<div class="control-group">
								<!-- Username -->
								<label class="control-label" for="username">用户名</label>
								<div class="controls">
									<form:input type="text" id="username" path="username"
										name="username" placeholder="" class="form-control"
										oninput="onUsernameInput (event)"
										onpropertychange="onUsernamePropChanged (event)" />
									<p class="help-block">用户名至少4个字符，以字母开头且只能包含大小写字母，数字，不能有空格</p>
								</div>
								<div id="username_input_warn" class="alert alert-warning"
									hidden="hidden" role="alert">用户名不符合规则！</div>
							</div>

							<div class="control-group">
								<!-- E-mail -->
								<label class="control-label" for="email">电子邮箱</label>
								<div class="controls">
									<form:input type="text" id="email" path="email" name="email"
										placeholder="" class="form-control"
										oninput="onEmailInput (event)"
										onpropertychange="onEmailPropChanged (event)" />
									<p class="help-block">请填写你的电子邮箱</p>
								</div>
								<div id="email_input_warn" class="alert alert-warning"
									role="alert" hidden="hidden">电子邮箱格式不正确！</div>
							</div>

							<div class="control-group">
								<!-- Phone-->
								<label class="control-label" for="phone">手机号码</label>
								<div class="controls">
									<form:input type="text" id="phone" path="phone" name="phone"
										placeholder="" class="form-control"
										oninput="onPhoneInput (event)"
										onpropertychange="onPhonePropChanged (event)" />
									<p class="help-block">请填写你的11位手机号码</p>
								</div>
								<div id="phone_input_warn" class="alert alert-warning"
									role="alert" hidden="hidden">手机号码格式不正确！</div>
							</div>

							<div class="control-group">
								<!-- Password-->
								<label class="control-label" for="password">密码</label>
								<div class="controls">
									<form:password path="password" id="password" name="password"
										placeholder="" class="form-control"
										oninput="onPasswordInput (event)"
										onpropertychange="onPasswordPropChanged (event)" />
									<p class="help-block">密码至少包含6个字符</p>
								</div>
								<div id="password_input_warn" class="alert alert-warning"
									role="alert" hidden>密码不符合规则！</div>
							</div>

							<div class="control-group">
								<!-- Password -->
								<label class="control-label" for="password_confirm">密码
									(确认)</label>
								<div class="controls">
									<input type="password" id="password_confirm"
										name="password_confirm" placeholder="" class="form-control"
										oninput="onPasswordConfirmInput (event)"
										onpropertychange="onPasswordConfirmPropChanged (event)">
									<p class="help-block">请确认密码</p>
								</div>
								<div id="password_confirm_input_warn"
									class="alert alert-warning" role="alert" hidden>密码不一致！</div>
							</div>

							<form:hidden path="enabled" value="1" />

							<div class="control-group">
								<!-- Button -->
								<div class="controls">
									<button id="submuit_btn" class="btn btn-success" disabled>注册</button>
								</div>
							</div>
						</fieldset>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<%@include file="include/footer.jsp"%>
	<script type="text/javascript" src="resources/js/jquery.min.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/js/register.js"></script>
</body>
</html>