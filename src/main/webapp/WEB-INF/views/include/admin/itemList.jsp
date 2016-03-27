<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="false"%>
<%@ page isELIgnored="false"%>
<div class="row">
	<div class="col-xs-12">

		<!-- box -->
		<div class="box">
			<div class="box-header">
				<h3 class="box-title">商品列表</h3>
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
							<th>ID</th>
							<th>商品名</th>
							<th>图片</th>
							<th>类别</th>
							<th>价格</th>
							<th>添加时间</th>
							<th>状态</th>
							<th>库存</th>
							<th>描述</th>
						</tr>
						<c:forEach items="${itemList}" var="item">
							<tr>
								<td>${item.id}</td>
								<td>${item.name}</td>
								<td><img alt="" src="resources/img/items/${item.imgs[0]}"
									width="40px"></td>
								<td>${item.category.name}</td>
								<td><fmt:formatNumber type="number" value="${item.price} "
										minFractionDigits="2" maxFractionDigits="2" /></td>
								<td>${item.date}</td>
								<td><div class="switch">
										<input type="checkbox" name="enabled" data-on-text="正常"
											data-off-text="下架" data-on-color="success"
											data-off-color="danger" data-size="mini" class="userEnabled"
											data-label-width="40" data-handle-width="40"
											onchange="toggleItemEnabled(this,'${item.id}')"
											<c:if test="${item.enabled}">checked</c:if> />
									</div></td>
								<td>${item.stock}</td>
								<td>${item.description}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- Button trigger modal -->
				<hr>
			</div>
			<!-- /.box-body -->
		</div>
		<!-- /.box -->
	</div>
</div>