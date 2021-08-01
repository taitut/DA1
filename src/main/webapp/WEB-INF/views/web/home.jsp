<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="/common/taglib.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home | E-Shopper</title>
</head>
<body>
	<section id="slider"><!--slider-->
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div id="slider-carousel" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
							<li data-target="#slider-carousel" data-slide-to="1"></li>
							<li data-target="#slider-carousel" data-slide-to="2"></li>
						</ol>
						
						<div class="carousel-inner">
							<div class="item active">
								<div class="col">
									<img src="https://www.asus.com/WebsitesBanner/VN/banners/qrmmrtd8jqzyj0ec/qrmmrtd8jqzyj0ec-0_0_desktop_1X.jpg" width="900" height="350" alt="" />
								</div>
							</div>
							<div class="item">
								
								<div class="col-sm-6">
									<img src="https://www.asus.com/WebsitesBanner/VN/banners/adtlyt1qn2tvmgck/adtlyt1qn2tvmgck-0_0_desktop_1X.jpg?webp" width="900" height="350"  alt="" />
								</div>
							</div>
							
							<div class="item">
								
								<div class="col-sm-6">
									<img src="https://www.asus.com/WebsitesBanner/VN/banners/go4o2pkicrpo6ebx/go4o2pkicrpo6ebx-0_0_desktop_1X.jpg?webp" width="900" height="350" alt="" />
								</div>
							</div>
							
						</div>
						
						<a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
							<i class="fa fa-angle-left"></i>
						</a>
						<a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
							<i class="fa fa-angle-right"></i>
						</a>
					</div>
					
				</div>
			</div>
		</div>
	</section><!--/slider-->
	
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
					
						
						
						<div class="price-range"><!--price-range-->
							<h2>Price Range</h2>
							<div class="well text-center">
								 <input type="text" class="span2" value="" data-slider-min="0" data-slider-max="600" data-slider-step="5" data-slider-value="[250,450]" id="sl2" ><br />
								 <b class="pull-left">$ 0</b> <b class="pull-right">$ 600</b>
							</div>
						</div><!--/price-range-->
						
						<div class="shipping text-center"><!--shipping-->
							<img src="/templates/web/images/home/shipping.jpg" alt="" />
						</div><!--/shipping-->
					
					</div>
				</div>
				
				<div class="col-sm-9 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">Sản Phẩm Bán Chạy</h2>
						<c:forEach var="item" items="${asc}">
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
										<div class="productinfo text-center">
											<img src="${item.image}" alt="" />
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
					
					<div class="category-tab"><!--category-tab-->
						<div class="col-sm-12">
							<ul class="nav nav-tabs">
							<c:forEach var="cateName" items="${category}">
							<li ><a href="#${cateName.code}" data-toggle="tab">${cateName.name}</a></li>
							</c:forEach>

							</ul>
						</div>
						<div class="tab-content">
						<c:forEach var="cateName" items="${category}">
							<div class="tab-pane fade " id="${cateName.code}" >
							<c:forEach var = "item" items = "${model.content}">
								<c:if test="${item.categories.code == cateName.code }">
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="${item.image}" alt="" />
												<h2 > <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${item.price}" /> ₫</h2>
												<p>${item.name}</p>
												<a href="/trang-chu/san-pham/add/${item.id}" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ</a>
											</div>
											
										</div>
									</div>
								</div>
								</c:if>
							</c:forEach>

							</div>
						</c:forEach>
							</div>
							
							
							
					</div><!--/category-tab-->

					
				</div>
			</div>
		</div>
	</section>
	
</body>
</html>