<%@ page import="com.fpoly.utils.*"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<%@include file="/common/taglib.jsp" %> 
<%@ include file="/common/taglib.jsp"%>
<div id="navbar" class="navbar navbar-default">
	<script type="text/javascript">
		try {
			ace.settings.check('navbar', 'fixed')
		} catch (e) {
		}
	</script>

	<div class="navbar-container" id="navbar-container">
		<button type="button" class="navbar-toggle menu-toggler pull-left"
			id="menu-toggler" data-target="#sidebar">
			<span class="sr-only">Toggle sidebar</span> <span class="icon-bar"></span>

			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>

		<div class="navbar-header pull-left">
			<a href="<c:url value="/admin"/> " class="navbar-brand"> <small> <i
					class="fa fa-leaf"></i> Laptop Razor
			</small>
			</a>
		</div>

		<div class="navbar-buttons navbar-header pull-right" role="navigation">
			<ul class="nav ace-nav">
			<sec:authorize access="isAuthenticated()">
				<li class="light-blue"><a data-toggle="dropdown" href="#"
					class="dropdown-toggle"> <span class="user-info"> <small>Xin Chào,</small>
							<%=SecurityUtils.getPrincipal().getFullName()%>
					</span> <i class="ace-icon fa fa-caret-down"></i>
					<img alt="" src="<%=SecurityUtils.getPrincipal().getPhoto()%>" style=" width: 50px; height: 50px;"/>
				</a>

					<ul
						class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
						<li><a href="#"> <i class="ace-icon fa fa-cog"></i>
								Settings
						</a></li>

						<li><a href="profile.html"> <i
								class="ace-icon fa fa-user"></i> Profile
						</a></li>

						<li class="divider"></li>

						<li><a href="<c:url value='/logout'/>"> <i class="ace-icon fa fa-power-off"></i>
								Đăng xuất
						</a></li>
					</ul>
				</li>
			 </sec:authorize>
				
				<li class="purple">
					<a href="<c:url value='/logout'/>" > <i class="ace-icon fa fa-power-off"></i>
				</a>

					<ul
							class="dropdown-menu-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close"
							style="">
						<li class="dropdown-header">
							<a href="<c:url value='/logout'/>">
							<i class="ace-icon fa fa-exclamation-triangle"></i> Logout
							</a>
						</li>



					</ul></li>
			</ul>
		</div>
	</div>
	<!-- /.navbar-container -->
</div>