<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>lOGIN</title>
	
	<link rel="stylesheet" href="/templates/admin/assets/css/bootstrap.min.css" />
	<link rel="stylesheet" href="/templates/admin/font-awesome/4.5.0/css/font-awesome.min.css" />
	<link rel="stylesheet" href="/templates/admin/assets/css/ace.min.css" />
	<link rel="stylesheet" href="/templates/admin/assets/fonts/fonts.googleapis.com.css'/>" class="ace-main-stylesheet" id="main-ace-style" />
	<script src="/templates/admin/assets/js/ace-extra.min.js"></script>
	<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type='text/javascript' src='<c:url value="/templates/admin/js/jquery-2.2.3.min.js" />'></script>
	<script src="/templates/admin/assets/js/jquery.2.1.1.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>

<body class="login-layout">
	<sitemesh:write property='body'/>
</body>
<script src="template/admin/assets/js/jquery.2.1.1.min.js"></script>

<script type="text/javascript">
	window.jQuery ||
		document.write("<script src='template/assets/js/jquery.min.js'>" +
			"<" + "/script>");
</script>

<script type="text/javascript">
	if ('ontouchstart' in document.documentElement)
		document
		.write("<script src='template/assets/js/jquery.mobile.custom.min.js'>" +
			"<" + "/script>");
</script>

<!-- inline scripts related to this page -->
<script type="text/javascript">

	jQuery(function ($) {
		$(document).on('click', '.toolbar a[data-target]', function (e) {
			e.preventDefault();
			var target = $(this).data('target');
			$('.widget-box.visible').removeClass('visible'); //hide others
			$(target).addClass('visible'); //show target
		});
	});

	//you don't need this, just used for changing background
	jQuery(function ($) {
		$('#btn-login-dark').on('click', function (e) {
			$('body').attr('class', 'login-layout');
			$('#id-text2').attr('class', 'white');
			$('#id-company-text').attr('class', 'blue');

			e.preventDefault();
		});
		$('#btn-login-light').on('click', function (e) {
			$('body').attr('class', 'login-layout light-login');
			$('#id-text2').attr('class', 'grey');
			$('#id-company-text').attr('class', 'blue');

			e.preventDefault();
		});
		$('#btn-login-blur').on('click', function (e) {
			$('body').attr('class', 'login-layout blur-login');
			$('#id-text2').attr('class', 'white');
			$('#id-company-text').attr('class', 'light-blue');

			e.preventDefault();
		});

	});
</script>

</html>