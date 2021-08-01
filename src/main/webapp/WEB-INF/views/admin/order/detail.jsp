<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Details</title>
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
					<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Home</a>
					</li>
					<li class="active">Chi tiết đơn hàng</li>
				</ul>

			</div>

			<div class="page-content">
				<%@ include file="/WEB-INF/views/admin/toppage.jsp"%>

				<div class="page-header">
					<h1>Chi tiết đơn hàng</h1>
				</div>
				<!-- /.page-header -->
				<div class="table-responsive">
					<c:if test="${not empty message}">
						<div class="alert alert-${alert}">${message}</div>
					</c:if>
                       <table id="example" class="table table-striped table-bordered" style="width:100%">
                            <thead>
                                <tr>
                                    <th>Tên sản phẩm</th>
                                    <th>Giá</th>
                                    <th>Số lượng</th>
                                    <th>Tổng tiền</th>
                                    
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var = "item" items = "${detail}">
                                <tr>
                                    <td><img alt="product"
											src="/upload/${item.product.image}"
											style="width: 85px; height: 85px;">
											${item.product.name}</td>
                                    
                                    <td>${item.price}</td>
                                    <td>${item.quantity}</td>
                                    <td>${item.quantity * item.product.price}</td>
                                    
                                </tr>
                                
                             </c:forEach>
                                 <tr>
                                	<th colspan="3">Tổng</th>
                                 	<td>${total}</td>
                                </tr>
                            </tbody>
                            
                        </table>
                    <a type="button" href="/admin/order" class="btn btn-outline-warning">Back</a>
	 </div>
			<!-- /.page-content -->
		</div>
		</div>
		</div>

		<script>
              $(document).ready(function() {
                 $('#btnDelete').prop('disabled', true);
                 $('#example').DataTable({
                	 "lengthMenu": [ 5, 10, 15, 20, 25 ]
                 });                                           
                 });
   </script>
</body>
</html>