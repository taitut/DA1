<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết đơn hàng</title>
</head>
<body>

	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<div class="left-sidebar">
						<h2>Hãng Laptop</h2>

						<div class="panel-group category-products" id="accordian">
							<!--category-productsr-->
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a href="/trang-chu/san-pham">Tất cả</a>
									</h4>
								</div>
							</div>
							<c:forEach var="cateName" items="${category}">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a href="/trang-chu/san-pham/?catename=${cateName.code}">${cateName.name}</a>
										</h4>
									</div>
								</div>
							</c:forEach>

						</div>
						<!--/category-products-->

					</div>
				</div>


				<div id="content" class="col-sm-9">
					<h2 class="title text-center">Chi tiết đơn hàng</h2>

					<table class="table table-bordered table-hover">
						<thead>
							<tr
								style="background-color: rgba(51, 51, 51, 0.1); font-weight: bold;">
								<td colspan="2" class="text-left">Chi tiết đơn hàng
									#${order.id }</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td style="width: 50%;" class="text-left"><b>Tài khoản:</b>
									${acc.userName} <br> <b>Ngày mua:</b> ${order.createDate }
									<br> <b>Người nhận:</b>${order.name }</td>
								<td style="width: 50%;" class="text-left"><b>Địa chỉ:</b>
									${order.address} <br> <b>Số điện thoại:</b> ${order.phone }
								</td>
							</tr>
						</tbody>
					</table>
					<div class="table-responsive">
						<table class="table table-bordered table-hover">
							<thead>
								<tr
									style="background-color: rgba(51, 51, 51, 0.1); font-weight: bold;">
									<td class="text-left">Sản phẩm</td>
									<td class="text-left">Hãng sản xuất</td>
									<td class="text-right">Số lượng</td>
									<td class="text-right">Đơn giá</td>
									<td class="text-right">Thành tiền</td>
									<td style="width: 20px;"></td>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${orderDetail}">
									<tr>
										<td class="text-left"><img alt=""
											src="/upload/${item.product.image}" width="50px"
											height="55px"> <br> ${item.product.name}</td>
										<td class="text-left">${item.product.categories.name}</td>
										<td class="text-right">${item.quantity}</td>
										<td class="text-right"> <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${item.price}" />₫</td>
										<td class="text-right"> <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${item.price * item.quantity}" />₫</td>
										<td style="white-space: nowrap;" class="text-right"><a
											class="btn btn-primary" title="Mua lại" data-toggle="tooltip"
											href="/trang-chu/san-pham/add/${item.product.id}"
											data-original-title="Mua lại"><i
												class="fa fa-shopping-cart"></i></a></td>
									</tr>
								</c:forEach>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="3"></td>
								<tr>
									<td colspan="2"></td>
									<td class="text-right"><b>Tổng tiền</b></td>
									<td class="text-right"><td class="text-right"> <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${order.totalPrice}" />₫</td></td>
									<td></td>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>