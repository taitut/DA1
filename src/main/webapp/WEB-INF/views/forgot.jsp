<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
    <%@include file="/common/taglib.jsp" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Forgot Password</title>
        </head>
	<link rel="stylesheet" href="/template/admin/assets/css/bootstrap.min.css" />
	<link rel="stylesheet" href="/template/admin/font-awesome/4.5.0/css/font-awesome.min.css" />
	<link rel="stylesheet" href="/template/admin/assets/css/ace.min.css" />
	<link rel="stylesheet" href="/template/admin/assets/fonts/fonts.googleapis.com.css'/>" class="ace-main-stylesheet" id="main-ace-style" />
	<script src="/template/admin/assets/js/ace-extra.min.js"></script>
	<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type='text/javascript' src='<c:url value="/template/admin/js/jquery-2.2.3.min.js" />'></script>
	<script src="/template/admin/assets/js/jquery.2.1.1.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <body class="login-layout">
            <div class="main-container">
                <div class="main-content">
                    <div class="row">
                        <div class="col-sm-10 col-sm-offset-1">
                            <div class="login-container">
                                <div class="center">
                                    <h1>
                                        <i class="ace-icon fa fa-leaf green"></i> <span class="red">Ace</span>
                                        <span class="white" id="id-text2">Application</span>
                                    </h1>
                                    <h4 class="blue" id="id-company-text">&copy; Company Name</h4>
                                </div>

                                <div class="space-6"></div>

                                <div class="position-relative">
                                    
                                    <!-- /.login-box -->

                                    <div id="login-box" class="login-box visible widget-box no-border">
                                        <div class="widget-body">
                                            <div class="widget-main">
                                                <h4 class="header green lighter bigger">
                                                    <i class="ace-icon fa fa-users blue"></i> Forgot password
                                                </h4>

                                                <div class="space-6"></div>
                                                <p>Check your email to get code</p>

                                                <form id="formSubmit" method="POST" action="/forgot" >
                                                    <fieldset>
                                                        <label class="block clearfix"> <span
                                                        class="block input-icon input-icon-right">
                                                        <input name="email" type="email" class="form-control"placeholder="Email" />
                                                        <i class="ace-icon fa fa-envelope"></i>                                                                
                                                    </span>
                                                </label>
                                                	<label class="block clearfix"> <span
                                                        class="block input-icon input-icon-right">
                                                         <input type="text" name="code"
                                                            class="form-control" placeholder="Forgot Code" />
                                                        <i class="ace-icon fa fa-user"></i>
                                                    </span>
                                                    <span Style="color:red; font-style: italic;">${code}</span>
                                            				
                                                	</label>
                                                 <label class="block clearfix"> <span
                                                        class="block input-icon input-icon-right"> 
                                                        <input name="password" type="password" class="form-control"
                                                            placeholder="New Password" /> <i
                                                            class="ace-icon fa fa-lock"></i>
                                                         <span Style="color:red; font-style: italic;">${pass}</span>
                                                    </span>
                                                </label> 
                                                        <div class="space-24"></div>
                                                        <div class="clearfix">
                                                            
                                                            <button type="submit" class="width-65 pull-right btn btn-sm btn-success">
                                                        <span class="bigger-110">Submit</span> <i
                                                            class="ace-icon fa fa-arrow-right icon-on-right"></i>
                                                    </button>
                                                        </div>
                                                    </fieldset>
                                                </form>
                                            </div>

                                            <div class="toolbar center">
                                                <a href="/login"  class="back-to-login-link"> <i class="ace-icon fa fa-arrow-left"></i> Back to login
                                                </a>
                                            </div>
                                        </div>
                                        <!-- /.widget-body -->
                                    </div>

                                    <!-- /.signup-box -->
                                </div>
                                <!-- /.position-relative -->

                                <div class="navbar-fixed-top align-right">
                                    <br /> &nbsp; <a id="btn-login-dark" href="#">Dark</a> &nbsp; <span class="blue">/</span> &nbsp; <a id="btn-login-blur" href="#">Blur</a> &nbsp; <span class="blue">/</span> &nbsp; <a id="btn-login-light" href="#">Light</a>                                    &nbsp; &nbsp; &nbsp;
                                </div>
                            </div>
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.main-content -->
            </div>

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
        </body>

        </html>