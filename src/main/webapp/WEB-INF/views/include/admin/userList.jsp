<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="false"%>
<%@ page isELIgnored="false"%>
<div class="row">
	<div class="col-xs-12">
		<div class="box">
			<div class="box-header">
				<h3 class="box-title">用户列表</h3>
				<div class="box-tools">
					<div class="input-group" style="width: 150px;">
						<input type="text" name="table_search"
							class="form-control input-sm pull-right" placeholder="Search">
						<div class="input-group-btn">
							<button class="btn btn-sm btn-default">
								<i class="fa fa-search"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
			<!-- /.box-header -->
			<div class="box-body table-responsive no-padding">
				<table class="table table-hover">
					<tbody>
						<tr>
							<th>用户名</th>
							<th>头像</th>
							<th>邮箱</th>
							<th>手机号</th>
							<th>注册时间</th>
							<th>状态</th>
							<th>权限</th>
						</tr>
						<c:forEach items="${userList}" var="user">
							<tr>
								<td>${user.username}</td>
								<td><img alt="" src="resources/img/avatar/${user.avatar}"
									class="img-circle" width="30px"></td>
								<td>${user.email}</td>
								<td>${user.phone}</td>
								<td>${user.date}</td>
								<td><div class="switch">
										<input type="checkbox" name="enabled" data-on-text="正常"
											data-off-text="禁用" data-on-color="success"
											data-off-color="danger" data-size="mini" class="userEnabled"
											data-label-width="40" data-handle-width="40"
											onchange="toggleUserEnabled(this,'${user.username}')"
											<c:if test="${user.enabled}">checked</c:if> />
									</div></td>
								<td>${user.authorities}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- /.box-body -->
		</div>
		<!-- /.box -->
	</div>
</div>