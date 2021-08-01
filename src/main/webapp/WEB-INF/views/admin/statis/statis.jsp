<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Statistical</title>
</head>
<body>
	<div class="main-content">
		<div class="main-content-inner">
			<div class="breadcrumbs" id="breadcrumbs">
				<script type="text/javascript">
					try {
						ace.settings.check('breadcrumbs', 'fixed')
					} catch (e) {
					}
				</script>

				<ul class="breadcrumb">
					<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Home</a>
					</li>
					<li class="active">Thống kê</li>
				</ul>

				
				<!-- /.nav-search -->
			</div>

			<div class="page-content">
				<%@ include file="/WEB-INF/views/admin/toppage.jsp"%>

				<div class="page-header">
					<h1>Thống kê</h1>
				</div>
				<!-- /.page-header -->
				<div class="table-responsive">
			
					<div class="fc-center">
						<div class="fc-button-group">
							<button type="button"
								class="fc-month-button fc-button fc-state-default fc-corner-left fc-state-active">Chọn năm</button>
							<form action="/admin/Statistical" method="get">
					<input type="text" id="datepicker" value="2021" name="year"/>
					<button type="submit">Submit</button>
				</form>
						</div>
						
					</div>
					<div class="fc-clear"></div>
				</div>
				<br>
				
					
				<div class="container">
					<div class="col-xs-12 col-sm-3 widget-container-col ui-sortable">
						<div class="widget-box ui-sortable-handle">
							<div class="widget-header">
								<h5 class="widget-title smaller">Doanh thu</h5>

								<div class="widget-toolbar">
									<span class="label label-success">  <i
										class="ace-icon fa fa-arrow-up"></i>
									</span>
								</div>
							</div>

							<div class="widget-body">
								<div class="widget-main padding-6">
									<div class="alert alert-info">Tổng doanh thu năm ${year} : 
										 ${doanhthu}đ</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xs-12 col-sm-3 widget-container-col ui-sortable"
						style="min-height: 106px;">
						<div
							class="widget-box widget-color-dark light-border ui-sortable-handle"
							style="opacity: 1;">
							<div class="widget-header">
								<h5 class="widget-title smaller">Số lượng khách hàng</h5>

								<div class="widget-toolbar">
									<span class="label label-success"> <i
										class="ace-icon fa fa-arrow-up"></i>
									</span>
								</div>
							</div>

							<div class="widget-body">
								<div class="widget-main padding-6">
									<div class="alert alert-info">khách hàng mua trong năm ${year}: ${khach}</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xs-12 col-sm-3 widget-container-col ui-sortable"
						style="min-height: 106px;">
						<div
							class="widget-box widget-color-pink light-border ui-sortable-handle"
							style="opacity: 1;">
							<div class="widget-header">
								<h5 class="widget-title smaller">Số sản phẩm đã bán</h5>

								<div class="widget-toolbar">
									<span class="label label-success"> <i
										class="ace-icon fa fa-arrow-up"></i>
									</span>
								</div>
							</div>

							<div class="widget-body">
								<div class="widget-main padding-6">
									<div class="alert alert-info">Sản phẩm đã bán năm ${year}: ${sanpham}</div>
								</div>
							</div>
						</div>
					</div>
					<a type="button" href="/admin/order"
						class="btn btn-outline-warning">Back</a>

				</div>
			</div>

			<div class=".container-fluid">	
				<div class="col-sm-6"
					style="position: static; height: 67vh; width: 48vw">
					<canvas id="myChart"></canvas>
				</div>
				<div class="col-sm-6"
					style="position: static; height: 20vh; width: 25vw">
					<canvas id="myChart1"></canvas>
				</div>
			</div>

			<!-- /.page-content -->
		</div>
	</div>
	<script>
		var ctx = document.getElementById('myChart').getContext('2d');
		var label = ${month};
		var data = ${price}
		var myChart = new Chart(ctx,
				{
					type : 'bar',
					data : {
						labels : label,
						datasets : [ {
							label : 'Doanh thu năm ${year}',
							data :data,
							backgroundColor : [ 
									'rgba(54, 162, 235, 0.2)',
									 ],
							borderColor : [ 
									'rgba(54, 162, 235, 1)',
									 ],
							borderWidth : 1
						} ]
					},
					options : {
						y : {
							beginAtZero : true
						}

					}
				});
	</script>
	<script>
		var ctx = document.getElementById('myChart1').getContext('2d');
		var lable = ${pieName};
		var data = ${pievalue};
		var myChart1 = new Chart(ctx,
				{
					type : 'pie',
					data : {
						labels : lable,
						datasets : [ {
							label : 'pie',
							data : data,
							backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(255, 206, 86, 0.2)',
									'rgba(75, 192, 192, 0.2)',
									'rgba(153, 102, 255, 0.2)',
									'rgba(255, 159, 64, 0.2)' ],
							borderColor : [ 'rgba(255, 99, 132, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(255, 206, 86, 1)',
									'rgba(75, 192, 192, 1)',
									'rgba(153, 102, 255, 1)',
									'rgba(255, 159, 64, 1)' ],
							borderWidth : 1
						} ]
					},
					options: {
					    responsive: true,
					    plugins: {
					      legend: {
					        position: 'top',
					      },
					      title: {
					        display: true,
					        text: 'Doanh thu theo loại sản phẩm năm ${year}'
					      }
					    }
					  },
				});
	</script>
	<script type="text/javascript">
	$("#datepicker").datepicker({
	    format: "yyyy",
	    viewMode: "years", 
	    minViewMode: "years"
	});
	</script>
</body>
</html>