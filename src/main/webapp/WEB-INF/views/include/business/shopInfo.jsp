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
		<h3 class="box-title">店铺信息</h3>

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
							<h4 class="modal-title" id="myModalLabel">修改店铺信息</h4>
						</div>
						<form action="./business/updateShop" method="post"
							enctype="multipart/form-data">
							<fieldset>
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
								<div class="modal-body">
									<div class="form-group">
										<label for="shopNameInput">店铺名</label> <input type="text"
											name="name" class="form-control" id="shopNameInput"
											placeholder="xxxxxx" value="${shop.name}" />
										<p class="help-block">请填写你的店铺名</p>
									</div>
									<div class="form-group">
										<label for="descTextarea">店铺描述</label>
										<textarea class="form-control" id="descTextarea"
											name="description">
											${shop.description}
										</textarea>
									</div>
									<div class="form-group">
										<label for="addressSelect">店铺地址</label> <select
											class="form-control" id="addressSelect" name="address">
											<c:forEach items="${addresses}" var="address">
												<option value="${address}">${address}</option>
											</c:forEach>
										</select>
									</div>
									<div class="form-group">
										<label for="avatarInput">店铺图标</label> <input type="file"
											id="avatarInput" name="icon">
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

			<div class="col-md-offset-1 col-md-3" style="margin-top: 4%">
				<img alt="" src="resources/img/shop/${shop.icon}" width="150px"
					height="150px" class="img-thumbnail">
			</div>
			<div class="col-md-offset-3 col-md-5 "
				style="margin-top: 4%; margin-bottom: 4%;">
				<ul>
					<li><h4>店铺名：${shop.name}</h4></li>
					<li><h4>店铺地址：${shop.address}</h4></li>
					<li>
						<h4>店铺描述：</h4>
						<p>${shop.description}</p>
					</li>
					<li><h4>
							操作： <a data-toggle="modal" data-target="#myModal" title="修改用户信息">
								<span class="glyphicon glyphicon-pencil"></span>
							</a>
						</h4></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- /.container -->



