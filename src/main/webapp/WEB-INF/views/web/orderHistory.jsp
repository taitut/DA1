<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lịch sử mua hàng</title>
</head>
<body>

	<section>
		<div class="container">
			<div class="row">
				<%@include file="/WEB-INF/views/web/cate.jsp"%>

				<div class="col-sm-9 padding-right">
					<div class="features_items">
						<!--features_items-->
						<h2 class="title text-center">Lịch sử mua hàng</h2>
						<div class="main-container container">
							<div class="row">
								<!--Middle Part Start-->
								<div id="content" class="col-sm-9">
									<div class="table-responsive">
										<table id="example1" class="table table-bordered table-hover">
											<thead>
												<tr
													style="background-color: rgba(51, 51, 51, 0.1); font-weight: bold;">
													<td class="text-center">Image</td>
													<td class="text-left">Người nhận</td>
													<td class="text-center">Địa chỉ</td>
													<td class="text-center">Số điện thoại</td>
													<td class="text-center">Ngày mua</td>
													<td class="text-center">Ghi chú</td>
													<td class="text-right">Tổng tiền</td>
													<td></td>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="item" items="${order}">
													<tr>
														<td class="text-center"><a href="#"><img
																width="85" class="img-thumbnail"
																alt="Aspire Ultrabook Laptop"
																src="${item.oderdetails.get(0).product.image }">
														</a></td>
														<td class="text-left">${item.name }</td>
														<td class="text-center">${item.address}</td>
														<td class="text-center">${item.phone }</td>
														<td class="text-center"><fmt:formatDate
																var="createDate" value="${item.createDate}"
																pattern="dd/MM/yyyy" /> ${createDate}</td>
														<td class="text-center">${item.note}</td>
														<td class="text-right"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${item.totalPrice}" />₫ </td>
														<td class="text-center"><a class="btn btn-info"
															title="" data-toggle="tooltip"
															href="/trang-chu/invoice?id=${item.id }"
															data-original-title="View"><i class="fa fa-eye"></i></a>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>

								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	
</body>
</html>