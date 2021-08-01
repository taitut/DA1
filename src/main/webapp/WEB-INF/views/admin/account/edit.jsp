<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
    <%@include file="/common/taglib.jsp" %>     
        <html>
        <head>
                <c:if test="${not empty model.id }">
               	 <title>Cập nhật tài khoản</title> 
                </c:if>
                <c:if test="${empty model.id }">
               	 <title>Thêm tài khoản</title> 
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
                            <li><i class="ace-icon fa fa-home home-icon"></i> <a href="/admin/home">Trang chủ</a>
                            </li>
                          
               	  			 <li class="active">Quản lý tài khoản</li>                      
                        </ul>


                        <!-- /.nav-search -->
                    </div>

                    <div class="page-content">
                        <%@ include file="/WEB-INF/views/admin/toppage.jsp" %>
                            <div class="page-header">
                                <h1>
                                    Quản lý tài khoản <small> <i class="ace-icon fa fa-angle-double-right"></i>
                  
                    
                         <c:if test="${not empty model.id }">
               	Cập nhật tài khoản
                </c:if>
                <c:if test="${empty model.id }">
               	Thêm tài khoản
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
                                     <form:form id="formSubmit"  action="/admin/account" modelAttribute="model"  enctype="multipart/form-data">
                                    
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right">Họ và tên</label>
                                            <div class="col-sm-9">
                                                <form:input path="fullname" id="fullname" cssClass="form-control" />
                                                <form:errors path="fullname" element="span" cssStyle="color:red; font-style: italic;" delimiter=";"></form:errors>
                                            </div>
                                        </div>
                                        <br/>
                                        <br/>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right">Tên đăng nhập</label>
                                            <div class="col-sm-9">
                                                <form:input path="userName" id="userName" cssClass="form-control" />
                                                <form:errors path="userName" element="span" cssStyle="color:red; font-style: italic;" delimiter=";"></form:errors>
                                            	<span   Style="color:red; font-style: italic;" >${haveUser}</span>
                                            </div>
                                        </div>
                                        <br/>
                                        <br/>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right">Mật khẩu</label>
                                            <div class="col-sm-9">
                                                <form:input path="password" id="password" cssClass="form-control" />
                                                <form:errors path="password" element="span" cssStyle="color:red; font-style: italic;" delimiter=";"></form:errors>
                                            </div>
                                        </div>
                                        <br/>
                                        <br/>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right">Email</label>
                                            <div class="col-sm-9">
                                                <form:input path="email" id="email" cssClass="form-control" />
                                                <form:errors path="email" element="span" cssStyle="color:red; font-style: italic;" delimiter=";"></form:errors>
                                           		<span Style="color:red; font-style: italic;" >${haveEmail}</span>
                                            </div>
                                        </div>
                                        <br/>
                                        <br/>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right">Avatar</label>
                                            <div class="col-sm-9">
                                                <input type="file" name="photoo" accept="image/png,image/jpeg" Class="form-control" />
                                                <img alt="" src="/upload/${model.photo}" style="width:100px"  >
                                                <span   Style="color:red; font-style: italic;" >${messImg}</span>
                                                   <br/>
                                        <br/>
                                            </div>
                                        </div>
                                        <br/>
                                        <br/>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right">Role</label>
                                            <div class="col-sm-9">
                                                <form:select  path="role" id="role" items ="${role}"  cssClass="form-control" />
                                            </div>
                                        </div>
                                        <br/>
                                        <br/>
                                        <div class="form-group">
                                            <div class="col-sm-12">                                              
                                            <c:if test="${not empty model.id}">
                                            	<input type="hidden" name="_method" value="put">
                                            	<input onclick="waningDelete()"  class="btn btn-white btn-warning btn-bold"  value="Cập nhật tài khoản" />
                                   		 	</c:if> 
                                   		 	 <c:if test="${empty model.id}">
                                            	<input type="submit" formmethod="post" class="btn btn-white btn-warning btn-bold"  value="Thêm tài khoản" />
                                   		 	</c:if> 
                                                <input type="button" class="btn btn-white btn-warning btn-bold" value="Cancel" id="btnCancel" />
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