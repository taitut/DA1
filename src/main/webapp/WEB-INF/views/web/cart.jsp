<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglib.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Giỏ Hàng</title>
</head>
<body>
<section id="cart_items">
		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="/trag-chu">Trang chủ</a></li>
				  <li class="active">Giỏ hàng</li>
				</ol>
			</div>
			<div class="table-responsive cart_info">
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image">Sản phẩm</td>
							<td class="description"></td>
							<td class="price">Giá</td>
							<td class="quantity">Số lượng</td>
							<td class="total">Thành tiền</td>
							<td></td>
						</tr>
					</thead>
					<tbody>
					 <c:forEach var="item" items="${cartitem}">
					 
					  <form action="/trang-chu/san-pham/update/" method="post" >
           				 <input type="hidden" name="id" value ="${item.product.id}" />
					 	<tr>
							<td class="cart_product">
								<a href="/trang-chu/san-pham/${item.product.id}"><img src="${item.product.image}" style="width: 170px;" alt=""></a>
							</td>
							<td class="cart_description">
								<h4><a href="/trang-chu/san-pham/${item.product.id}" >${item.product.name}</a></h4>
							</td>
							<td class="cart_price">
							<fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${item.product.price}" />₫
							</td>
							<td class="cart_quantity">
								<div class="cart_quantity_button">
									
									<input class="cart_quantity_input" type="number" onblur="this.form.submit()"  name="qty" value="${item.quantity}" max="${item.product.quantity}" min="0" autocomplete="off" size="2">
									
								</div>
							</td>
							<td class="cart_total">
								<p class="cart_total_price"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${item.product.price * item.quantity}"/>₫</p>
							</td>
							<td class="cart_delete">
								<a class="cart_quantity_delete" href="/trang-chu/san-pham/delete/${item.product.id}"><i class="fa fa-times"></i></a>
							</td>
						</tr>
						</form>
					 </c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</section> <!--/#cart_items-->

	<section id="do_action">
		<div class="container">
			
			<div class="row">
				<div class="col-sm-6 float-right"></div>
				<div class="col-sm-6 float-right">
					<div class="total_area">
						<ul>
							
							<li>Tổng tiền <span><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${totalp}"/>₫</span></li>
						</ul>
						
							<a class="btn btn-default update" href="/trang-chu/san-pham/clear">Xóa giỏ hàng</a>
							        <sec:authorize access="isAuthenticated()">
        <c:if test="${totalp>0}">
        <a href="#ex1" class="btn btn-default check_out"  rel="modal:open">Thanh toán</a>
        </c:if>
        </sec:authorize>
        <sec:authorize access="!isAuthenticated()">
        <a type="button" id="btn1" class="btn btn-default check_out" href="/login">Đăng nhập để thanh toán</a>
        </sec:authorize>
					</div>
				</div>
			</div>
		</div>
		<div id="ex1" class="modal" style="max-width: 100%; text-align: left; width: 95%">
 <form action="/trang-chu/san-pham/checkout" id="checkout"  method="post">
		<div class="container">
			<div class="register-req">
				<p>Hãy kiểm tra kỹ thông tin trước khi thanh toán</p>
			</div><!--/register-req-->

			<div class="shopper-informations">
				<div class="row">
					<div class="col-sm-3">
						<div class="shopper-info">
							<p>Thông tin tài khoản</p>
							
								<label>Tên người dùng</label>
								<input type="text" value="${ac.fullname}" readonly placeholder="Tên người dùng">
								<label>Tên đăng nhập</label>
								<input type="text" value="${ac.userName}" readonly placeholder="User Name">
								<label>Email</label>
								<input type="email" value="${ac.email}" readonly placeholder="Email">
							
							<p>Nếu thông tin không đúng hãy đăng xuất</p>
							<a class="btn btn-primary" href="/logout">Đăng xuất</a>
						</div>
					</div>
					<div class="col-sm-5 clearfix">
						<div class="bill-to">
							<p>Gửi hàng đến</p>
							<div class="form-one">
								
									<input type="text" name="name" placeholder="Tên người nhận">
									<input type="text" name="add" placeholder="Địa chỉ">
								
							</div>
							<div class="form-two">
								
									<input type="text" name="phone" placeholder="Số điện thoại">
								
							</div>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="order-message">
							<p>Ghi chú</p>
							<textarea name="note" placeholder="ghi chú thời gian nhận hàng..." rows="12"></textarea>
							
						</div>	
					</div>					
				</div>
			</div>
		</div>
			
  		<div class="modal-footer">
        <button type="button" onclick="waningDelete()" style="float: right;" class="btn btn-primary">Order</button>
      </div>
  </form>
</div>
	</section><!--/#do_action-->



	<script type="text/javascript">
function waningDelete() {
    swal({
            title: "Are you sure?",
            text: "!",
            icon: "warning",
            buttons: true,
            dangerMode: true,
        })
        .then((willDelete) => {
            if (willDelete) {
            	$( "#checkout" ).submit();
                 
                swal("Poof! Your imaginary file has been Update!", {
                    icon: "success",
                });
            } else {
                swal("Your imaginary file is safe!");
            }
        });
}
</script>
</body>
</html>