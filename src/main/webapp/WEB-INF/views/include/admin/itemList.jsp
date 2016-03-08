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
						<h4 class="modal-title" id="myModalLabel">添加新商品</h4>
					</div>
					<form:form commandName="newItem" action="./admin/newItem"
						method="post" enctype="multipart/form-data">
						<fieldset>
							<form:hidden path="id" />
							<div class="modal-body">
								<div class="form-group">
									<label for="itemCategorySelect">类型</label>
									<form:select class="form-control" id="itemCategorySelect"
										items="${categories}" path="category.id" itemLabel="name"
										itemValue="id">
									</form:select>
								</div>

								<div class="form-group">
									<label for="itemNameInput">商品名</label>
									<form:input type="text" class="form-control" id="itemNameInput"
										placeholder="" path="name" />
								</div>
								<div class="form-group">
									<label for="itemPriceInput">价格</label>
									<form:input type="text" class="form-control"
										id="itemPriceInput" placeholder="" path="price" />
								</div>
								<div class="form-group">
									<label for="itemStockInput">库存</label>
									<form:input type="text" class="form-control"
										id="itemStockInput" placeholder="0" path="stock" />
								</div>
								<div class="form-group">
									<label for="itemStockInput">描述</label>
									<form:textarea class="form-control" id="itemStockInput"
										path="description" />
								</div>
								<div class="form-group">
									<label for="itemImgInput">上传图片</label> <input type="file"
										id="itemImgInput" name="images" multiple="multiple">
								</div>
							</div>
							<div class="modal-footer">
								<button type="reset" class="btn btn-default"
									data-dismiss="modal">取消</button>
								<button type="submit" class="btn btn-primary">保存</button>
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
							<th>商品名</th>
							<th>类别</th>
							<th>价格</th>
							<th>添加时间</th>
							<th>状态</th>
							<th>库存</th>
							<th>描述</th>
						</tr>
						<c:forEach items="${itemList}" var="item">
							<tr>
								<td>${item.name}</td>
								<td>${item.category.name}</td>
								<td>${item.price}</td>
								<td>${item.date}</td>
								<td></td>
								<td>${item.stock}</td>
								<td>${item.description}</td>
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