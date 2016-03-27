<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!-- <div class="nav"> -->
<nav class="navbar navbar-inverse navbar-fixed-top"
	style="background-color: #222d32;">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="./"><span
				class="glyphicon glyphicon-home" aria-hidden="true"></a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">

			<ul class="nav navbar-nav navbar-right">
				<c:choose>
					<c:when test="${user eq null}">
						<li><a href="./login" title="登录"><span
								class="glyphicon glyphicon-log-in"></span></a></li>
						<li><a href="./register" title="注册"><span
								class="glyphicon glyphicon-edit"></span></a></li>
					</c:when>
					<c:otherwise>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"><img
								src="resources/img/avatar/${user.avatar}" class="img-circle"
								width="30px" height="30px" alt="User Image">
								${user.username}<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="./user" title=""><span
										class="glyphicon glyphicon-user" aria-hidden="true">
											个人中心</span></a></li>
								<li role="separator" class="divider"></li>
								<li><a href="./logout" title=""><span
										class="glyphicon glyphicon-log-out" aria-hidden="true">
											退出登录</span> </a></li>
							</ul></li>
					</c:otherwise>
				</c:choose>
				<li><a href="./cart" title="购物车"><span
						class="glyphicon glyphicon-shopping-cart" aria-hidden="true"><span
							class="badge" id="cart_sum">0</span></span></a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>
<!-- </div> -->
