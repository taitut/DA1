<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@include file="/common/taglib.jsp" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Login</title>
            
            
        </head>

        <body>
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
                               
                                    <div id="login-box" class="login-box visible  widget-box no-border">
                                        <div class="widget-body">
                                            <div class="widget-main">
                                                <h4 class="header blue lighter bigger">
                                                    <i class="ace-icon fa fa-coffee green"></i> Please Enter Your Information
                                                </h4>

                                                <div class="space-6"></div>
                                                <c:if test="${param.error==true}">
                                                    <div class="alert alert-danger">
                                                        UserName or Password is incorrect
                                                    </div>
                                                </c:if>
                                                <c:if test="${param.success==true}">
                                                    <div class="alert alert-success">
                                                        Password has reset!!
                                                    </div>
                                                </c:if>
                                                <c:if test="${param.accessDenied ==true}">
                                                    <div class="alert alert-warning">
                                                        You Not Authorize
                                                    </div>
                                                </c:if>

                                                <form action="/j_spring_security_check" id="formlogin" method="POST">
                                                    <fieldset>
                                                        <label class="block clearfix"> <span
                                                        class="block input-icon input-icon-right">
                                                        <input type="text" class="form-control" placeholder="Username"
                                                            name="username" id="userName" />
                                                        <i class="ace-icon fa fa-user"></i>
                                                    </span>
                                                </label> <label class="block clearfix"> <span
                                                        class="block input-icon input-icon-right">
                                                        <input type="password" class="form-control"
                                                            placeholder="Password" name="password" id="password" /> <i
                                                            class="ace-icon fa fa-lock"></i>

                                                    </span>
                                                </label>
                                                        <div class="space"></div>
                                                        <div class="clearfix">
                                                            <label class="inline">
                                                        <input type="checkbox" class="ace" name="remember-me" />
                                                        <span class="lbl"> Remember Me</span>
                                                    </label>

                                                            <button type="submit" class="width-35 pull-right btn btn-sm btn-primary">
                                                        <i class="ace-icon fa fa-key"></i> <span
                                                            class="bigger-110">Login</span>
                                                    </button>
                                                        </div>

                                                        <div class="space-4"></div>
                                                    </fieldset>
                                                </form>

                                                <div class="social-or-login center">
                                                    <span class="bigger-110">Or Login Using</span>
                                                </div>

                                                <div class="space-6"></div>

                                                <div class="social-login center">
                                                    
                                                </div>
                                            </div>
                                            <!-- /.widget-main -->

                                            <div class="toolbar clearfix">
                                                <div>
                                                    <a href="#" data-target="#forgot-box" class="forgot-password-link">
                                                        <i class="ace-icon fa fa-arrow-left"></i> I forgot my password
                                                    </a>
                                                </div>

                                                <div>
                                                    <a href="/register" class="user-signup-link"> I want to
                                                register <i class="ace-icon fa fa-arrow-right"></i>
                                            </a>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /.widget-body -->
                                    </div>
                                    <!-- /.login-box -->

                                    <div id="forgot-box" class="forgot-box widget-box no-border">
                                        <div class="widget-body">
                                            <div class="widget-main">
                                                <h4 class="header red lighter bigger">
                                                    <i class="ace-icon fa fa-key"></i> Retrieve Password
                                                </h4>

                                                <div class="space-6"></div>
                                                <p>Enter your email and to receive instructions</p>

                                                <form action="/sendCode" method="post" >
                                                    <fieldset>
                                                        <label class="block clearfix"> <span
                                                        class="block input-icon input-icon-right"> <input type="email"
                                                            class="form-control" name="email" placeholder="Email" />
                                                        <i class="ace-icon fa fa-envelope"></i>
                                                    </span>
                                                    <span Style="color:red; font-style: italic;">${code}</span>
                                                </label>

                                                        <div class="clearfix">
                                                            <button type="submit"  class="width-35 pull-right btn btn-sm btn-danger">
                                                        <i class="ace-icon fa fa-lightbulb-o"></i> <span
                                                            class="bigger-110">Send Me!</span>
                                                    </button>
                                                        </div>
                                                    </fieldset>
                                                </form>
                                            </div>
                                            <!-- /.widget-main -->

                                            <div class="toolbar center">
                                                <a href="#" data-target="#login-box" class="back-to-login-link"> Back to
                                            login
                                            <i class="ace-icon fa fa-arrow-right"></i>
                                        </a>
                                            </div>
                                        </div>
                                        <!-- /.widget-body -->
                                    </div>
                                    <!-- /.forgot-box -->

                                    <div id="signup-box" class="signup-box widget-box no-border">
                                        <div class="widget-body">
                                            <div class="widget-main">
                                                <h4 class="header green lighter bigger">
                                                    <i class="ace-icon fa fa-users blue"></i> New User Registration
                                                </h4>

                                                <div class="space-6"></div>
                                                <p>Enter your details to begin:</p>

                                            
                                            </div>

                                            <div class="toolbar center">
                                                <a href="#" data-target="#login-box" class="back-to-login-link"> <i class="ace-icon fa fa-arrow-left"></i> Back to login
                                                </a>
                                            </div>
                                        </div>
                                        <!-- /.widget-body -->
                                    </div>

                                    <!-- /.signup-box -->
                                </div>
                             
                                 <%-- <c:if test=" ${not empty visible}"> 
                                <div class="position-relative">
                               
                                    <div id="login-box" class="login-box  widget-box no-border">
                                        <div class="widget-body">
                                            <div class="widget-main">
                                                <h4 class="header blue lighter bigger">
                                                    <i class="ace-icon fa fa-coffee green"></i> Please Enter Your Information
                                                </h4>

                                                <div class="space-6"></div>
                                                <c:if test="${param.error==true}">
                                                    <div class="alert alert-danger">
                                                        UserName or Password is incorrect
                                                    </div>
                                                </c:if>
                                                <c:if test="${param.accessDenied ==true}">
                                                    <div class="alert alert-warning">
                                                        You Not Authorize
                                                    </div>
                                                </c:if>

                                                <form action="/j_spring_security_check" id="formlogin" method="POST">
                                                    <fieldset>
                                                        <label class="block clearfix"> <span
                                                        class="block input-icon input-icon-right">
                                                        <input type="text" class="form-control" placeholder="Username"
                                                            name="username" id="userName" />
                                                        <i class="ace-icon fa fa-user"></i>
                                                    </span>
                                                </label> <label class="block clearfix"> <span
                                                        class="block input-icon input-icon-right">
                                                        <input type="password" class="form-control"
                                                            placeholder="Password" name="password" id="password" /> <i
                                                            class="ace-icon fa fa-lock"></i>

                                                    </span>
                                                </label>
                                                        <div class="space"></div>
                                                        <div class="clearfix">
                                                            <label class="inline">
                                                        <input type="checkbox" class="ace" name="remember-me" />
                                                        <span class="lbl"> Remember Me</span>
                                                    </label>

                                                            <button type="submit" class="width-35 pull-right btn btn-sm btn-primary">
                                                        <i class="ace-icon fa fa-key"></i> <span
                                                            class="bigger-110">Login</span>
                                                    </button>
                                                        </div>

                                                        <div class="space-4"></div>
                                                    </fieldset>
                                                </form>

                                                <div class="social-or-login center">
                                                    <span class="bigger-110">Or Login Using</span>
                                                </div>

                                                <div class="space-6"></div>

                                                <div class="social-login center">
                                                    <a class="btn btn-primary"> <i class="ace-icon fa fa-facebook"></i>
                                                    </a>
                                                    <a class="btn btn-info"> <i class="ace-icon fa fa-twitter"></i>
                                                    </a>
                                                    <a class="btn btn-danger"> <i class="ace-icon fa fa-google-plus"></i>
                                                    </a>
                                                </div>
                                            </div>
                                            <!-- /.widget-main -->

                                            <div class="toolbar clearfix">
                                                <div>
                                                    <a href="#" data-target="#forgot-box" class="forgot-password-link">
                                                        <i class="ace-icon fa fa-arrow-left"></i> I forgot my password
                                                    </a>
                                                </div>

                                                <div>
                                                    <a href="/register" class="user-signup-link"> I want to
                                                register <i class="ace-icon fa fa-arrow-right"></i>
                                            </a>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /.widget-body -->
                                    </div>
                                    <!-- /.login-box -->

                                    <div id="forgot-box" class="forgot-box visible widget-box no-border">
                                        <div class="widget-body">
                                            <div class="widget-main">
                                                <h4 class="header red lighter bigger">
                                                    <i class="ace-icon fa fa-key"></i> Retrieve Password
                                                </h4>

                                                <div class="space-6"></div>
                                                <p>Enter your email and to receive instructions</p>

                                                <form action="/sendCode" method="post" >
                                                    <fieldset>
                                                        <label class="block clearfix"> <span
                                                        class="block input-icon input-icon-right"> <input type="email"
                                                            class="form-control" placeholder="Email" />
                                                        <i class="ace-icon fa fa-envelope"></i>
                                                    </span>
                                                    <span Style="color:red; font-style: italic;">${email}</span>
                                                </label>

                                                        <div class="clearfix">
                                                            <button type="button" type="submit" class="width-35 pull-right btn btn-sm btn-danger">
                                                        <i class="ace-icon fa fa-lightbulb-o"></i> <span
                                                            class="bigger-110">Send Me!</span>
                                                    </button>
                                                        </div>
                                                    </fieldset>
                                                </form>
                                            </div>
                                            <!-- /.widget-main -->

                                            <div class="toolbar center">
                                                <a href="#" data-target="#login-box" class="back-to-login-link"> Back to
                                            login
                                            <i class="ace-icon fa fa-arrow-right"></i>
                                        </a>
                                            </div>
                                        </div>
                                        <!-- /.widget-body -->
                                    </div>
                                    <!-- /.forgot-box -->

                                    <div id="signup-box" class="signup-box widget-box no-border">
                                        <div class="widget-body">
                                            <div class="widget-main">
                                                <h4 class="header green lighter bigger">
                                                    <i class="ace-icon fa fa-users blue"></i> New User Registration
                                                </h4>

                                                <div class="space-6"></div>
                                                <p>Enter your details to begin:</p>

                                            
                                            </div>

                                            <div class="toolbar center">
                                                <a href="#" data-target="#login-box" class="back-to-login-link"> <i class="ace-icon fa fa-arrow-left"></i> Back to login
                                                </a>
                                            </div>
                                        </div>
                                        <!-- /.widget-body -->
                                    </div>

                                    <!-- /.signup-box -->
                                </div>
                                </c:if> --%>
                                <!-- /.position-relative -->

                                <div class="navbar-fixed-top align-right">
                                    <br /> &nbsp; <a id="btn-login-dark" href="#">Dark</a> &nbsp; <span class="blue">/</span> &nbsp; <a id="btn-login-blur" href="#">Blur</a> &nbsp;
                                    <span class="blue">/</span> &nbsp; <a id="btn-login-light" href="#">Light</a> &nbsp; &nbsp; &nbsp;
                                </div>
                            </div>
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.main-content -->
            </div>


        </body>

        </html>