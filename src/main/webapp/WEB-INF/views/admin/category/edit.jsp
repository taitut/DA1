<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
    <%@include file="/common/taglib.jsp" %>     
        <html>
        <head>
                <c:if test="${not empty product.id }">
               	 <title>Cập nhật danh mục</title> 
                </c:if>
                <c:if test="${empty product.id }">
               	 <title>Thêm danh mục</title> 
                </c:if>
        </head>

        <body>
            <div class="main-content">
                <div class="main-content-inner">
                    <div class="breadcrumbs" id="breadcrumbs">
                        <script type="text/javascript">
                            try {
                                ace.settings.check('breadcrumbs', 'fixed')
                            } catch (e) {}
                        </script>

                        <ul class="breadcrumb">
                            <li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Home</a>
                            </li>
                          
               	  			 <li class="active">Danh mục</li>                      
                        </ul>


                        <!-- /.nav-search -->
                    </div>

                    <div class="page-content">
                        <%@ include file="/WEB-INF/views/admin/toppage.jsp" %>
                            <div class="page-header">
                                <h1>
                                    Danh mục <small> <i class="ace-icon fa fa-angle-double-right"></i>
                  
                    
                         <c:if test="${not empty model.id }">
               	Cập nhật danh mục
                </c:if>
                <c:if test="${empty model.id }">
               	 Thêm danh mục
                </c:if>
                  
                </small>
                                </h1>
                            </div>
                            <!-- /.page-header -->
                            <div class="row">
                                <div class="col-xs-12">
                                     <c:if test="${not empty message}">
							<div class="alert alert-${alert}">${message}</div>
						</c:if>
                               
                                     <form:form id="formSubmit" action="/admin/category" modelAttribute="model"  enctype="multipart/form-data">
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right">Tên Danh mục</label>
                                            <div class="col-sm-9">

                                                <form:input path="name" id="name" cssClass="form-control" />
                                            </div>
                                        </div>
                                        <br/>
                                        <br/>
                                        
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right">Code</label>
                                            <div class="col-sm-9">
                                                <form:input type="text" path="code"   cssClass="form-control" />
                                            </div>
                                        </div>
                                        <br/>
                                        <br/>
                                        
                                        <div class="form-group">
                                            <div class="col-sm-12">
                                               
                                               <c:if test="${empty model.id }">
               									<input type="submit" formmethod= "post" class="btn btn-white btn-warning btn-bold"  value="Thêm danh mục" />
               									</c:if>
                                                <c:if test="${not empty model.id }">
                                                <input type="hidden" name="_method" value="put">
               									<input onclick="waningDelete()" class="btn btn-white btn-warning btn-bold"  value="Cập nhật danh mục" />
               									</c:if>
                                                
                                                

                                                &nbsp <input type="button" class="btn btn-white btn-warning btn-bold" value="Trở lại" id="btnCancel" />

                                            </div>
                                        </div>
                                        <form:input type="hidden" path="id" value="${model.id}" id="id" name="id" />
                                    </form:form>
                                    
                                   
                                </div>
                            </div>
                    </div>
                    <!-- /.page-content -->
                </div>
            </div>
            <script type="text/javascript">
               
                $('#btnCancel').click(function() {
                    window.history.back();
                })
               
				function waningDelete() {
                    swal({
                            title: "Bạn chắc chắn	?",
                            text: "Dữ liệu sẽ được cập nhật lại",
                            icon: "warning",
                            buttons: true,
                            dangerMode: true,
                        })
                        .then((willDelete) => {
                            if (willDelete) {
                            	$( "#formSubmit" ).submit();
                                 
                                swal("Xong! Dữ liệu đã được cập nhật", {
                                    icon: "success",
                                });
                            } else {
                                swal("Cứ từ từ!");
                            }
                        });
                }
            </script>
        </body>

        </html>