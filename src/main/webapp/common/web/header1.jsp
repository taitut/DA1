
<%@ page import="com.fpoly.utils.*"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="/common/taglib.jsp" %> 
<header id="header"><!--header-->
		<div class="header_top"><!--header_top-->
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<div class="contactinfo">
							
						</div>
					</div>
					<!-- <div class="col-sm-6">
						<div class="social-icons pull-right">
							<ul class="nav navbar-nav">
								<li><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
								<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
								<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
							</ul>
						</div>
					</div> -->
				</div>
			</div>
		</div><!--/header_top-->
		
		<div class="header-middle"><!--header-middle-->
			<div class="container">
				<div class="row">
					<div class="col-md-4 clearfix">
						<div class="logo pull-left">
							<a href="/trang-chu"><img src="/templates/web/images/home/logo.png" alt="" /></a>
						</div>
					</div>
					<div class="col-md-8 clearfix">
						<div class="shop-menu clearfix pull-right">
							<ul class="nav navbar-nav">
								
								<li><a href="/trang-chu/san-pham/gio-hang"> <i class="fa fa-shopping-cart"></i><span id="count" style="color: red">${numberItem}</span> Giỏ hàng</a> </li>
								<sec:authorize access="!isAuthenticated()">
								<li><a href="/login"><i class="fa fa-lock"></i> Đăng nhập</a></li>
								</sec:authorize>
								<sec:authorize access="isAuthenticated()">
								<li class="dropdown"><a href="#">Xin chào: <%=SecurityUtils.getPrincipal().getFullName()%><i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu" style="background: #ffffff;">
                                        <li><a href="" style = "background: #FFFFFF; color: #9c9b98;"><i class="fa fa-user"></i> Tài khoản</a></li>
                                        <li><a href="/trang-chu/history" style = "background: #FFFFFF; color: #9c9b98;">Lịch sử mua hàng</a></li> 
										<li><a href="/logout" style = "background: #FFFFFF; color: #9c9b98;">Logout</a></li> 
                                    </ul>
                                </li> 
								</sec:authorize>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-middle-->
	
		<div class="header-bottom"><!--header-bottom-->
			<div class="container">
				<div class="row">
					<div class="col-sm-9">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div>
						<div class="mainmenu pull-left">
							<ul class="nav navbar-nav collapse navbar-collapse">
								<li><a id="tr" href="/trang-chu" class="active">Trang chủ</a></li>
								<li ><a id="sp" href="/trang-chu/san-pham">Sản phẩm</a></li> 
								<li><a id="lh"  href="#">Liên Hệ</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="search_box pull-right">
						<form  action="/trang-chu/san-pham/" method="get">
						<input type="text" name="s" class="form-control rounded" placeholder="Tìm kiếm" aria-label="Search" aria-describedby="search-addon" />	
						</form>
							
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-bottom-->
	</header>