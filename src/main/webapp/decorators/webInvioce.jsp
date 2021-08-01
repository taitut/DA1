<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title><sitemesh:write property='title'/></title>
    
    <link href="/templates/web/css/bootstrap.min.css" rel="stylesheet">
    <link href="/templates/web/css/font-awesome.min.css" rel="stylesheet">
    <link href="/templates/web/css/prettyPhoto.css" rel="stylesheet">
    <link href="/templates/web/css/price-range.css" rel="stylesheet">
    <link href="/templates/web/css/animate.css" rel="stylesheet">
	<link href="/templates/web/css/main.css" rel="stylesheet">
	<link href="/templates/web/css/responsive.css" rel="stylesheet">
      
    <link rel="shortcut icon" href="/templates/web/images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/templates/web/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/templates/web/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/templates/web/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="/templates/web/images/ico/apple-touch-icon-57-precomposed.png">
<link href="/templates/admin/assets/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
</head>
<body>
	<!-- Navigation -->
	<%@ include file="/common/web/header1.jsp"%>

	<sitemesh:write property='body'/>
	
	<%@ include file="/common/web/footer1.jsp"%>
	<!-- Bootstrap core JavaScript -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="/templates/web/js/jquery.js"></script>
	<script src="/templates/web/js/bootstrap.min.js"></script>
	<script src="/templates/web/js/jquery.scrollUp.min.js"></script>
	<script src="/templates/web/js/price-range.js"></script>
    <script src="/templates/web/js/jquery.prettyPhoto.js"></script>
    <script src="/templates/web/js/main.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
        <script src="/templates/ckeditor/ckeditor.js"></script>
    	<script src="/templates/admin/assets/js/jquery-ui.min.js"></script>
	<script src="/templates/admin/assets/js/jquery.dataTables.min.js"></script>
	<script src="/templates/admin/assets/js/dataTables.bootstrap4.min.js"></script>
</body>
</html>