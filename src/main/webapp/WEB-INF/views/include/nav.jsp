<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<div class="nav">
	<nav class="navbar navbar-default" style="background: #F1F1F1;">
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
				<!-- 				<ul class="nav navbar-nav"> -->
				<!-- 					<li class="active"><a href="#">Link</a></li> -->
				<!-- 				</ul> -->

				<ul class="nav navbar-nav navbar-right">
					<c:choose>
						<c:when test="${user eq null}">
							<li><a href="./login">登录</a></li>
							<li><a href="./register">注册</a></li>
						</c:when>
						<c:otherwise>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false">${user.username}<span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="./user?userId=${user.username}"><span
											class="glyphicon glyphicon-user" aria-hidden="true"></span>个人中心</a></li>
									<li role="separator" class="divider"></li>
									<li><a href="#"><span
											class="glyphicon glyphicon-list-alt" aria-hidden="true">
												我的订单</a></li>
									<li role="separator" class="divider"></li>
									<li><a href="./logout"><span
											class="glyphicon glyphicon-off" aria-hidden="true"></span>
											退出登录</a></li>
								</ul></li>
						</c:otherwise>
					</c:choose>
					<li><a href="./cart"><span
							class="glyphicon glyphicon-shopping-cart" aria-hidden="true"><span
								class="badge" id="cart_sum">0</span></span></a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
</div>