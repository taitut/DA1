<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="NewURL" value="/admin/category/list" />
<c:url var="newAPI" value="/admin/category/delete" />

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Danh mục</title>
<style>
td {
	text-align: center;
}

th {
	text-align: center;
}
</style>
</head>

<body>
	<div class="main-content">
		<form action="<c:url value ='/admin/category/list'/>" id="formSubmit"
			method="get">
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
						<li class="active">Danh Mục</li>
					</ul>

					<div class="nav-search" id="nav-search">
						<form class="form-search" method="get" action="/admin/category/list?p=0" >
							<span class="input-icon"> <input type="text"
								placeholder="Search ..." class="nav-search-input"
								id="nav-search-input" name = "s"/>
								 <button
								class="ace-icon fa fa-search nav-search-icon"></button>
							</span>
						</form>
					</div>
					<!-- /.nav-search -->
				</div>

				<div class="page-content">
					<%@ include file="/WEB-INF/views/admin/toppage.jsp"%>

					<div class="page-header">
						<h1>
							Quản lý danh muc <small> <i class="ace-icon fa fa-angle-double-right"></i>
								
							</small>
						</h1>
					</div>
					<!-- /.page-header -->
					<div class="table-responsive">
						<c:if test="${not empty message}">
							<div class="alert alert-${alert}">${message}</div>
						</c:if>
						<div class="pull-right tableTools-container">
							<a
								class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
								data-toggle="tooltip" title='Thêm danh mục'
								href='<c:url value="/admin/category/edit"/>'> <span> <i
									class="fa fa-plus-circle bigger-110 purple"></i>
							</span>
							</a>
							<button id="btnDelete" onclick="waningDelete()" type="button"
								class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
								data-toggle="tooltip" title='Xoá danh mục'>
								<span> <i class="fa fa-trash-o bigger-110 pink"></i>
								</span>
							</button>

						</div>

						<table id="dynamic-table"
							class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable"
							role="grid" aria-describedby="dynamic-table_info">
							<thead>
								<tr>
									<th><label for="checkAll"></label>&nbsp;<input
										type="checkbox" id="checkAll" /></th>
									<th scope="col">Tên danh mục</th>
									<th scope="col">Code</th>
									<th scope="col">Ngày Tạo</th>
									<th scope="col">Người Tạo</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${category.content}">
									<tr>
										<td class=".align-middle"><label
											for="checkbox_${item.id}"></label> <input type="checkbox"
											id="checkbox_${item.id}" value="${item.id}" /></td>
										<td style="vertical-align: middle">${item.name }</td>
										<td style="vertical-align: middle">${item.code }</td>
										
										<td style="vertical-align: middle"><fmt:formatDate
												var="createDate" value="${item.createDate}"
												pattern="dd/MM/yyyy" /> ${createDate}</td>
										<td style="vertical-align: middle">${item.createdBy}</td>
										<td style="vertical-align: middle"><c:url var="editURL"
												value="/admin/category/edit">
												<c:param name="id" value="${item.id}" />
											</c:url> <a class="btn btn-sm btn-primary btn-edit"
											data-toggle="tooltip" title="Update News" href='${editURL}'><i
												class="fa fa-pencil-square-o" aria-hidden="true"></i> </a> <br />
										<br />
											 <script>
                                                            $(document).ready(function() {
                                                                $('#btnDelete').prop('disabled', true);
                                                               
                                                            });
                                                        </script></td>
									</tr>
								</c:forEach>
							</tbody>

						</table>
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-end">
							<c:if test="${category.number > 0}">
								<li class="page-item"><a class="page-link" href="/admin/category/list?s=${key}&p=0">First</a></li>
								<li class="page-item"><a class="page-link"
									href="/admin/category/list?s=${key}&p=${category.number-1}" tabindex="-1">Previous</a></li>
							</c:if>					
								<c:if test="${category.number >5}">
										<li class="page-item disabled"><a class="page-link"  href="#">...</a></li>
									</c:if>
									
								<c:forEach var="j" begin="1" end="${category.totalPages}" >	
										<li class="page-item"><a class="page-link" href="/admin/category/list?s=${key}&p=${j-1}"><c:out value="${j}"/></a></li>						
								</c:forEach>
								
									<c:if test="${category.totalPages >5 && category.number <(category.totalPages-3)}">
										<li class="page-item disabled"><a class="page-link disabled"  href="#">...</a></li>
									</c:if>
						
							
									
									<c:if test="${category.number < category.totalPages -1}">
										<li class="page-item"><a class="page-link" href="/admin/category/list?s=${key}&p=${category.number+1}">Next</a>
										<li class="page-item"><a class="page-link" href="/admin/category/list?s=${key}&p=${category.totalPages-1}">Last</a>
									</c:if>
								
								
							</ul>
						</nav>
						Số thực thể hiện tại: ${category.numberOfElements}
Trang số: ${category.number}
Kích thước trang: ${category.size}
Tổng số thực thể: ${category.totalElements}
Tổng số trang: ${category.totalPages}
					</div>

					<!-- <ul class="pagination" id="pagination"></ul>
 -->
					<input type="hidden" value="" id="page" name="page"> <input
						type="hidden" value="" id="limit" name="limit">
					<!--   <input type="hidden" value="" id="sortName" name="sortName">
                <input type="hidden" value="" id="sortBy" name="sortBy"> -->

				</div>
				<!-- /.page-content -->
			</div>
		</form>
	</div>
	<script>
                $(function() {
                   
 
                    $("#checkAll").click(function() {
                        $("input[type=checkbox]").prop("checked", $(this).prop("checked"))
                         $('#btnDelete').prop('disabled', false); 
                    });

                    $("input[type=checkbox]").click(function() {
                        if (!$(this).prop("checked")) {

                        }
                        $('#btnDelete').prop('disabled', false); 
                    });
                    $("input[type=checkbox]").change(function() {
                        if (!$(this).prop("checked")) {
                            $('#btnDelete').prop('disabled', true); 
                        } else {
                            $('#btnDelete').prop('disabled', false); 
                        }

                    });

                });
                

                
                function waningDelete() {
                    swal({
                            title: "Bạn có chắc chắn muốn xoá?",
                            text: "Dữ iệu sẽ bị xoá và không khôi phục đưọc",
                            icon: "warning",
                            buttons: true,
                            dangerMode: true,
                        })
                        .then((willDelete) => {
                            if (willDelete) {
                            	
                                var ids = $('tbody input[type=checkbox]:checked').map(function() {
                                    return $(this).val();
                                }).get();
                                
                                deleteNew(ids); 
                                swal("Tuyệt vời! Dữ liệu sẽ đã được xoá", {
                                    icon: "success",
                                });
                            } else {
                                swal("Không thì thôi!");
                            }
                        });
                }
                function deleteNew(data) {
                    $.ajax({
                    	url: '${newAPI}',
                    	type: 'POST',
                    	contentType: 'application/json',
                        data: JSON.stringify(data),

                        success: function(result) {
                            window.location.href = "${NewURL}";
                        },
                        error: function(error) {
                            window.location.href = "${NewURL}";
                        }
                    })
                }
            </script>
</body>

</html>