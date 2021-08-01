<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="NewURL" value="/admin/product/list" />
<c:url var="newAPI" value="/admin/product/delete" />

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Order</title>
<style>
td {
	text-align: center;
}

th {
	text-align: center;
}
</style>
</head>

<body>
	<div class="main-content">
		<div class="main-content-inner">
			<div class="breadcrumbs" id="breadcrumbs">
				<script type="text/javascript">
                                try {
                                    ace.settings.check('breadcrumbs', 'fixed')
                                } catch (e) {}
                            </script>

				<ul class="breadcrumb">
					<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Trang chủ</a>
					</li>
					<li class="active">Hóa đơn</li>
				</ul>

			</div>

			<div class="page-content">
				<%@ include file="/WEB-INF/views/admin/toppage.jsp"%>

				<div class="page-header">
					<h1>Hóa đơn</h1>
				</div>
				<!-- /.page-header -->
				<div class="table-responsive">
					<c:if test="${not empty message}">
						<div class="alert alert-${alert}">${message}</div>
					</c:if>

					<table id="example" class="table table-striped table-bordered" style="width:100%">
						<thead>
							<tr>
								<th scope="col">Tài khoản</th>
								<th scope="col">Người nhận</th>
								<th scope="col">Địa chỉ</th>
								<th scope="col">Số điện thoại</th>
								<th scope="col">Ngày thanh toán</th>
								<th scope="col">Ghi chú</th>
								<th scope="col">Tổng tiền</th>
								<th>Chi tiết</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${model.content}">
								<tr>
									
									<td style="vertical-align: middle">${item.account.fullname}</td>
									<td style="vertical-align: middle">${item.name}</td>
									<td style="vertical-align: middle">${item.address }</td>
									<td style="vertical-align: middle">${item.phone }</td>
									<td style="vertical-align: middle"><fmt:formatDate
											var="createDate" value="${item.createDate}"
											pattern="dd/MM/yyyy" /> ${createDate}</td>
									<td style="vertical-align: middle">${item.note }</td>
									<td style="vertical-align: middle">${item.totalPrice }</td>
									<td style="vertical-align: middle">
									
									<a class="btn btn-sm btn-primary btn-edit"
										href="/admin/order/detail/${item.id }"
											 title="OrderDetails">
											<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
									</a></td>
								</tr>
								
								
							</c:forEach>
						</tbody>
					</table>
			</div>
			<!-- /.page-content -->
		</div>

	</div>
		<script>
              $(document).ready(function() {
                 $('#btnDelete').prop('disabled', true);
                 $('#example').DataTable({
                	 "lengthMenu": [ [5, 10, 15, -1], [5, 10, 15, "All"] ]
                 });                                           
                 });
   </script>
</body>

</html>