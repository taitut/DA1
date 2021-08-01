<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
    <%@include file="/common/taglib.jsp" %>     
        <html>
        <head>
                <c:if test="${not empty model.id }">
               	 <title>Update Product</title> 
                </c:if>
                <c:if test="${empty model.id }">
               	 <title>Add Product</title> 
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
                          
               	  			 <li class="active">Sản phẩm</li>                      
                        </ul>


                        <!-- /.nav-search -->
                    </div>

                    <div class="page-content">
                        <%@ include file="/WEB-INF/views/admin/toppage.jsp" %>
                            <div class="page-header">
                                <h1>
                                    Sản Phẩm <small> <i class="ace-icon fa fa-angle-double-right"></i>
                  
                    
                         <c:if test="${not empty model.id }">
               	Cập nhật sản phẩm
                </c:if>
                <c:if test="${empty model.id }">
               	 Thêm sản phẩm
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
                                     <form:form id="formSubmit"  action="/admin/product" modelAttribute="model"  enctype="multipart/form-data">
                                    
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right">Thể loại</label>
                                            <div class="col-sm-9">

                                                <form:select path="categories.id" id="categoryId">
                                                    <form:options items="${category}"/>
                                                </form:select>
                                            </div>
                                        </div>
                                        <br/>
                                        <br/>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right">Tên Sản Phẩm</label>
                                            <div class="col-sm-9">
                                                <form:input path="name" id="name" cssClass="form-control" />
                                                <form:errors path="name" element="span" cssStyle="color:red; font-style: italic;" delimiter=";"></form:errors>
                                            </div>
                                        </div>
                                        <br/>
                                        <br/>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right">CPU</label>
                                            <div class="col-sm-9">
                                                <form:input path="cpu" id="cpu" cssClass="form-control" />
                                                <form:errors path="cpu" element="span" cssStyle="color:red; font-style: italic;" delimiter=";"></form:errors>
                                            </div>
                                        </div>
                                        <br/>
                                        <br/>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right">RAM</label>
                                            <div class="col-sm-9">
                                                <form:input path="ram" id="ram" cssClass="form-control" />
                                                <form:errors path="ram" element="span" cssStyle="color:red; font-style: italic;" delimiter=";"></form:errors>
                                            </div>
                                        </div>
                                        <br/>
                                        <br/>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right">Hình đại diện</label>
                                            <div class="col-sm-9">
                                                <input type="file" name="photo" accept="image/png,image/jpeg" Class="form-control" />
                                                <span   Style="color:red; font-style: italic;" >${messImg}</span>
                                                <img alt="" src="/upload/${model.image}" style="width:100px"  >
                                            </div>
                                        </div>
                                        <br/>
                                        <br/>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right">Giá</label>
                                            <div class="col-sm-9">
                                                <form:input type="number" path="price" id="price" min="0" max="999999999" cssClass="form-control" />
                                            	<form:errors path="price" element="span" cssStyle="color:red; font-style: italic;" delimiter=";"></form:errors>
                                            </div>
                                        </div>
                                        <br/>
                                        <br/>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right">Số Lượng</label>
                                            <div class="col-sm-9">
                                                <form:input type="number" path="quantity"  min="0" max="999999999" cssClass="form-control" />
                                            	<form:errors path="quantity" element="span" cssStyle="color:red; font-style: italic;" delimiter=";"></form:errors>
                                            </div>
                                        </div>
                                        <br/>
                                        <br/>
                                    <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right">Bài viết</label>
                                            <div class="col-sm-9">
                                                <form:textarea path="content" id="content" style="width: 820px;height: 175px" cssClass="form-control" />
                                            	<form:errors path="content" element="span" cssStyle="color:red; font-style: italic;" delimiter=";"></form:errors>
                                            </div>
                                        </div>
                                        <br/>
                                        <br/>
                                        <div class="form-group">
                                            <div class="col-sm-12">                                              
                                            <c:if test="${not empty model.id}">
                                            	<input type="hidden" name="_method" value="put">
                                            	<input onclick="waningDelete()" type = "button"  class="btn btn-white btn-warning btn-bold" id="update"  value="Cập nhật " />
                                   		 	</c:if> 
                                   		 	 <c:if test="${empty model.id}">
                                            	<input type="submit" formmethod="post" class="btn btn-white btn-warning btn-bold"  value="Thêm sản phẩm" />
                                   		 	</c:if> 
                                                &nbsp <a href="/admin/product/list" type="button" class="btn btn-white btn-warning btn-bold"  id="btnCancel" > Trở lại</a>

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
               
            var editor = "";
            $(document).ready(function() {
                editor = CKEDITOR.replace('content');
            });
               
			function waningDelete() {
                    swal({
                            title: "Bạn chắc chắn muốn xoá?",
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