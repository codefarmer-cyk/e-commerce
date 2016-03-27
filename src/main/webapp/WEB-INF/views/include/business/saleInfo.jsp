<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Page Content -->
<div class="row">
	<div class="col-md-12">
		<!-- LINE CHART -->
		<div class="box box-info">
			<div class="box-header with-border">
				<h3 class="box-title">线性图</h3>
				<div class="box-tools pull-right">
					<button class="btn btn-box-tool" data-widget="collapse">
						<i class="fa fa-minus"></i>
					</button>
					<button class="btn btn-box-tool" data-widget="remove">
						<i class="fa fa-times"></i>
					</button>
				</div>
			</div>
			<div class="box-body">
				<div class="chart">
					<canvas id="lineChart" style="height: 250px; width: 511px;"
						width="511" height="250"></canvas>
				</div>
			</div>
			<!-- /.box-body -->
		</div>
		<!-- /.box -->

		<!-- PIE CHART -->
		<div class="box box-danger">
			<div class="box-header with-border">
				<h3 class="box-title">饼状图</h3>
				<div class="box-tools pull-right">
					<button class="btn btn-box-tool" data-widget="collapse">
						<i class="fa fa-minus"></i>
					</button>
					<button class="btn btn-box-tool" data-widget="remove">
						<i class="fa fa-times"></i>
					</button>
				</div>
			</div>
			<div class="box-body">
				<canvas id="pieChart" style="height: 287px; width: 575px;"
					width="575" height="287"></canvas>
			</div>
			<!-- /.box-body -->
		</div>
		<!-- /.box -->

	</div>
	<!-- /.col (RIGHT) -->
</div>

<script type="text/javascript">
	var PieData =${pieData};
// 	[ {
// 		value : 700,
// 		color : "rgb(5, 5, 5)",
// 		highlight : "#f56954",
// 		label : "Chrome"
// 	}, {
// 		value : 500,
// 		color : "rgb(10, 10, 10)",
// 		highlight : "#00a65a",
// 		label : "IE"
// 	}, {
// 		value : 400,
// 		color : "#f39c12",
// 		highlight : "#f39c12",
// 		label : "FireFox"
// 	}, {
// 		value : 600,
// 		color : "#00c0ef",
// 		highlight : "#00c0ef",
// 		label : "Safari"
// 	}, {
// 		value : 300,
// 		color : "#3c8dbc",
// 		highlight : "#3c8dbc",
// 		label : "Opera"
// 	}, {
// 		value : 100,
// 		color : "#d2d6de",
// 		highlight : "#d2d6de",
// 		label : "Navigator"
// 	} ];
</script>
<!-- /.container -->



