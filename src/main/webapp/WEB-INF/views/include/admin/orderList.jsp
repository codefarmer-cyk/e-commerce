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
				<h3 class="box-title">订单列表</h3>
			</div>
			<!-- /.box-header -->
			<div class="box-body">
				<div id="example1_wrapper"
					class="dataTables_wrapper form-inline dt-bootstrap">
					<div class="row">
						<div class="col-sm-6">
							<div id="example1_filter" class="dataTables_filter">
								<label>Search:<input type="search"
									class="form-control input-sm" placeholder=""
									aria-controls="example1"></label>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<table id="example1"
								class="table table-bordered table-striped dataTable table-hover"
								role="grid" aria-describedby="example1_info">
								<thead>
									<tr role="row">
										<th class="sorting_asc" tabindex="0" aria-controls="example1"
											rowspan="1" colspan="1" aria-sort="ascending"
											aria-label="Rendering engine: activate to sort column descending"
											style="width: 180px;">订单ID</th>
										<th class="sorting" tabindex="0" aria-controls="example1"
											rowspan="1" colspan="1"
											aria-label="Browser: activate to sort column ascending"
											style="width: 224px;">费用</th>
										<th class="sorting" tabindex="0" aria-controls="example1"
											rowspan="1" colspan="1"
											aria-label="Platform(s): activate to sort column ascending"
											style="width: 197px;">用户</th>
										<th class="sorting" tabindex="0" aria-controls="example1"
											rowspan="1" colspan="1"
											aria-label="Engine version: activate to sort column ascending"
											style="width: 156px;">时间</th>
										<th class="sorting" tabindex="0" aria-controls="example1"
											rowspan="1" colspan="1"
											aria-label="CSS grade: activate to sort column ascending"
											style="width: 113px;">状态</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${orderList}" var="order">
										<tr role="row" class="odd">
											<td class="">${order.id}</td>
											<td class="sorting_1">${order.cost}</td>
											<td>${order.user.username}</td>
											<td>${order.date}</td>
											<td><c:choose>
													<c:when test="${order.status eq 'STATUS_COMMITED'}">
														<span class="label label-default">待处理</span>
													</c:when>
													<c:when test="${order.status eq 'STATUS_SENT'}">
														<span class="label label-primary">已发货</span>
													</c:when>
													<c:when test="${order.status eq 'STATUS_CANCELLED'}">
														<span class="label label-warning">已取消</span>
													</c:when>
													<c:when test="${order.status eq 'STATUS_FINISHED'}">
														<span class="label label-success">已完成</span>
													</c:when>
													<c:when test="${order.status eq 'STATUS_COMMENTED'}">
														<span class="label label-info">已评价</span>
													</c:when>
												</c:choose></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- /.box-body -->
		</div>
		<!-- /.box -->
	</div>
	<!-- /.col -->
</div>