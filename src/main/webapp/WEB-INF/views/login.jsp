<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<meta name="description" content="">
<meta name="author" content="">

<title>登录界面--特色农产品电子商务网站</title>
<link rel="icon" href="resources/img/favicon.png">
<!-- Bootstrap core CSS -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style type="text/css">
body {
	padding-top: 100px;
	padding-bottom: 100px;
	background-color: rgb(249, 249, 249);
}

.login-form {
	background: white;
	padding: 5%;
	border-radius: 15px;
}

.form-signin {
	max-width: 330px;
	padding: 15px;
	margin: 0 auto;
}

.form-signin .form-signin-heading, .form-signin .checkbox {
	margin-bottom: 10px;
}

.form-signin .checkbox {
	font-weight: normal;
}

.form-signin .form-control {
	position: relative;
	height: auto;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	padding: 10px;
	font-size: 16px;
}

.form-signin .form-control:focus {
	z-index: 2;
}

.form-signin input[type="username"] {
	margin-bottom: -1px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
	margin-bottom: 10px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}

footer {
	/*     position:fixed; */
	bottom: 0;
}
</style>
</head>
<body>
	<%@include file="include/nav.jsp"%>
	<div class="content">
		<div class="container">
			<div class="row">
				<div class="col-md-offset-3 col-md-6 login-form">
					<form class="form-signin form-group" action="login.do"
						method="post">
						<h2 class="form-signin-heading">请登录</h2>
						<label for="inputUsername" class="sr-only">用户名</label> <input
							name="username" type="text" class="form-control"
							id="inputUsername" placeholder="user name" required autofocus>
						<label for="inputPassword" class="sr-only">密码</label> <input
							name="password" type="password" id="inputPassword"
							class="form-control" placeholder="Password" required>
						<div class="checkbox">
							<label> <input type="checkbox"
								name="_spring_security_remember_me" value="true">
								记住我的登录状态
							</label>
						</div>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
						<button class="btn btn-lg btn-primary btn-block" type="submit">登录
						</button>
					</form>
				</div>
			</div>

		</div>
	</div>
	<!-- /container -->
	<%@include file="include/footer.jsp"%>
	<script type="text/javascript" src="resources/js/jquery.min.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
</body>
</html>
