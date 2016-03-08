<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="false"%>
<%@ page isELIgnored="false"%>
<div class="row">
	<div class="col-xs-12">

		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">添加新类型</h4>
					</div>
					<form:form commandName="newCategory" action="./admin/newCategory"
						method="post">
						<fieldset>
							<form:hidden path="id" />
							<div class="modal-body">
								<div class="form-group">
									<label for="categoryNameInput">类型名</label>
									<form:input type="text" class="form-control"
										id="categoryNameInput" placeholder="" path="name" />
								</div>
							</div>
							<div class="modal-footer">
								<button type="reset" class="btn btn-default"
									data-dismiss="modal">Close</button>
								<button type="submit" class="btn btn-primary">Save
									changes</button>
							</div>
						</fieldset>
					</form:form>
				</div>
			</div>
		</div>
		<!-- /.modal -->
		<!-- box -->
		<div class="box">
			<div class="box-header">
				<h3 class="box-title">类型列表</h3>
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
						</tr>
						<c:forEach items="${categoryList}" var="category">
							<tr>
								<td>${category.id}</td>
								<td>${category.name}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- Button trigger modal -->
				<hr>
				<div style="text-align: center">
					<button type="button" class="btn btn-success btn-md"
						data-toggle="modal" data-target="#myModal">
						<span class="glyphicon glyphicon-plus"></span>
					</button>
				</div>
				<br>
			</div>
			<!-- /.box-body -->
		</div>
		<!-- /.box -->
	</div>
</div>