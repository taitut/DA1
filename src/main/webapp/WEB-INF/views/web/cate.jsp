<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="/common/taglib.jsp" %> 
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