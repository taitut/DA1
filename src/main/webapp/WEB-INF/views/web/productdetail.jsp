<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${model.name}</title>
</head>
<body>
	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<div class="left-sidebar">
						<h2>Hãng Laptop</h2>
						<div class="panel-group category-products" id="accordian"><!--category-productsr-->
							<c:forEach var="cateName" items="${category}">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="/trang-chu/san-pham/?catename=${cateName.code}">${cateName.name}</a></h4>
								</div>
							</div>
							</c:forEach>
							
						</div><!--/category-products-->

						<div class="shipping text-center"><!--shipping-->
							<img src="/template/web/template/web/images/home/shipping.jpg" alt="" />
						</div><!--/shipping-->
					
					</div>
				</div>
				
				<div class="col-sm-9 padding-right">
					<div class="product-details"><!--product-details-->
						<div class="col-sm-5">
							<div class="view-product">
								<img src="/upload/${model.image}" alt="" />
							</div>
							
						</div>
						<div class="col-sm-7">
							<div class="product-information"><!--/product-information-->
								<img src="/template/web/images/product-details/new.jpg" class="newarrival" alt="" />
								<h2>${model.name}</h2>
								<p>CPU: ${model.cpu}</p>
								<p>CPU: ${model.ram}</p>
								
								<span>
								<span><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${item.price}" /> ₫</span>
									
									<label>Quantity:</label>
									<form action="/trang-chu/san-pham/add/${model.id}" method="get">
									<input type="number" value ="1" name = "sl" min ="1" max = "${model.quantity}" />
									<c:if test="${model.quantity <1}">
										<button type="button" class="btn btn-fefault cart">
										<i class="fa fa-shopping-cart"></i>
										<del>Tạm hết hàng</del> 
									</button>
										</c:if>
										<c:if test="${model.quantity >=1}">
										<button type="submit" class="btn btn-fefault cart">
										<i class="fa fa-shopping-cart"></i>
											Thêm vào giỏ
										</button>
										</c:if>
									</form>
								</span>
								<p><b>Tình trạng:</b>
								<c:if test="${model.quantity >=1}">
								 Còn hàng
								</c:if>
								<c:if test="${model.quantity <1}">
								 Tạm hết hàng
								</c:if>
								 
								 </p>
								<p><b>Hãng sản xuất:</b>  ${cate.name}</p>
							
							</div><!--/product-information-->
						</div>
					</div><!--/product-details-->
					
					<div class="category-tab shop-details-tab"><!--category-tab-->
						<div class="col-sm-12">
							<ul class="nav nav-tabs">
								<li ><a href="#details" data-toggle="tab">Đánh giá chi tiết</a></li>
							</ul>
						</div>
						<div class="tab-content">
							<div class="tab-pane fade" id="details" >
							 ${model.content}

							</div>
						</div>
					</div><!--/category-tab-->
					
				</div>
			</div>
		</div>
	</section>
</body>
</html>