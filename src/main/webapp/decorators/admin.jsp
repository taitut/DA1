<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
    <%@ include file="/common/taglib.jsp" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>
                <sitemesh:write property='title'/>
            </title>


            <link rel="stylesheet" href="/templates/admin/assets/css/bootstrap.min.css"/>
            <link rel="stylesheet" href="/templates/admin/font-awesome/4.5.0/css/font-awesome.min.css" />
            <link rel="stylesheet" href="/templates/admin/assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />
            <script src="/templates/admin/assets/js/ace-extra.min.js"></script>
            <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
            <script type='text/javascript' src='/templates/admin/js/jquery-2.2.3.min.js'></script>
            <script src="/templates/admin/assets/js/jquery.2.1.1.min.js"></script>
            <link rel="stylesheet" href="/templates/admin/assets/css/jquery-ui.css" />
            <script src="/templates/admin/assets/js/jquery-ui.js"></script>
            <script src="/templates/ckeditor/ckeditor.js"></script>
            <script src="/templates/admin/assets/js/chart.js" ></script>
       		<script src="/templates/admin/assets/js/bootstrap-datepicker.js"></script>
<link href="/templates/admin/assets/css/bootstrap-datepicker.css" rel="stylesheet"/>
<link href="/templates/admin/assets/css/dataTables.bootstrap4.min.css" rel="stylesheet"/>
        </head>

        <body class="no-skin">
            <%@ include file="/common/admin/header.jsp" %>
                <div class="main-container" id="main-container">

                    <script type="text/javascript">
                        try {
                            ace.settings.check('main-container', 'fixed')
                        } catch (e) {}
                    </script>
                    <%@ include file="/common/admin/menu.jsp" %>
                        <sitemesh:write property='body'/>
                        <%@ include file="/common/admin/footer.jsp" %>
                            <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse display"> <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
                            </a>
                </div>

                <script src="/templates/admin/assets/js/sweetalert.min.js"></script>
                <script src="/templates/admin/assets/js/bootstrap.min.js"></script>
                <script src="/templates/admin/assets/js/jquery-ui.custom.min.js"></script>
                <script src="/templates/admin/assets/js/jquery.ui.touch-punch.min.js"></script>
                <script src="/templates/admin/assets/js/jquery.easypiechart.min.js"></script>
                <script src="/templates/admin/assets/js/jquery.sparkline.min.js"></script>
                <script src="/templates/admin/assets/js/jquery.flot.min.js"></script>
                <script src="/templates/admin/assets/js/jquery.flot.pie.min.js"></script>
                <script src="/templates/admin/assets/js/jquery.flot.resize.min.js"></script>
                <script src="/templates/admin/assets/js/ace-elements.min.js"></script>
                <script src="/templates/admin/assets/js/ace.min.js"></script>
	
                <!-- page specific plugin scripts -->
				<script src="/templates/admin/assets/js/jquery.dataTables.min.js"></script>
				<script src="/templates/admin/assets/js/dataTables.bootstrap4.min.js"></script>
         
                
            
        </body>

        </html>