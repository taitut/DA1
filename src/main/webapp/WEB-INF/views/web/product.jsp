<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="/common/taglib.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sản Phẩm</title>
</head>
<body>
	
	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<div class="left-sidebar">
						<h2>Hãng Laptop</h2>
					
						<div class="panel-group category-products" id="accordian"><!--category-productsr-->
						<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="/trang-chu/san-pham">Tất cả</a></h4>
								</div>
							</div>
							<c:forEach var="cateName" items="${category}">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="/trang-chu/san-pham/?catename=${cateName.code}">${cateName.name}</a></h4>
								</div>
							</div>
							</c:forEach>
							
							
						</div><!--/category-products-->
					
						
						
						<div class="price-range"><!--price-range-->
							<h2>Chọn mức giá</h2>
							<div class="well text-center">
								 <input type="text" class="span2" value="" data-slider-min="0" data-slider-max="600" data-slider-step="5" data-slider-value="[250,450]" id="sl2" ><br />
								 <b class="pull-left">$ 0</b> <b class="pull-right">$ 600</b>
							</div>
						</div><!--/price-range-->
					</div>
				</div>
				
				<div class="col-sm-9 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">Sản Phẩm</h2>
						<c:forEach var="item" items="${model.content}">
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
										<div class="productinfo text-center">
											<img src="/upload/${item.image}" alt="" />
											<h2 > <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${item.price}" /> ₫</h2>
											<p>${item.name}</p>
											<a href="/trang-chu/san-pham/${item.id}" class="btn btn-default add-to-cart"><i class="fa fa-info-circle" aria-hidden="true"></i>Mua ngay</a>
										</div>
										<div class="product-overlay">
											<div class="overlay-content">
												<h2 > <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${item.price}" /> ₫</h2>
												<p>${item.name}</p>
												<a href="/trang-chu/san-pham/${item.id}" class="btn btn-default add-to-cart"><i class="fa fa-info-circle" aria-hidden="true"></i>Mua ngay</a>
											</div>
										</div>
								</div>
							</div>
						</div>
						</c:forEach>
						
					</div><!--features_items-->
						
						<ul class="pagination">
           <c:if test="${model.number > 0}">
				<li ><a href="/trang-chu/san-pham/?p=0">&#171;</a></li>
				<li><a href="/trang-chu/san-pham/?&p=${model.number-1}">&larr;</a></li>
			</c:if>	
           
           <c:forEach var="j" begin="1" end="${model.totalPages}" >
          <li> <a href="/trang-chu/san-pham/?p=${j-1}">${j}</a></li>
            </c:forEach>  
            
            <c:if test="${model.number < model.totalPages -1}">
				<li><a href="/trang-chu/san-pham/?p=${model.number+1}">&#8594;</a></li>
				<li><a href="/trang-chu/san-pham/?&p= ${model.totalPages-1}">&#187;</a></li>
			</c:if>	 
               
           </ul>
				</div>
			</div>
		</div>
	</section>
</body>
</html>