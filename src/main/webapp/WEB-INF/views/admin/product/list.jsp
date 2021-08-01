<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="NewURL" value="/admin/product/list" />
<c:url var="newAPI" value="/admin/product/delete" />

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Danh sách sản phẩm</title>
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
		<form action="<c:url value ='/admin/product/list'/>" id="formSubmit"
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
						<li class="active">Sản phẩm</li>
					</ul>

					<div class="nav-search" id="nav-search">
						<form class="form-search" method="get"
							action="/admin/product/list?p=0">
							<span class="input-icon"> <input type="text"
								placeholder="Search ..." class="nav-search-input"
								id="nav-search-input" name="s" />
								<button class="ace-icon fa fa-search nav-search-icon"></button>
							</span>
						</form>
					</div>
					<!-- /.nav-search -->
				</div>

				<div class="page-content">
					<%@ include file="/WEB-INF/views/admin/toppage.jsp"%>

					<div class="page-header">
						<h1>
							Sản phẩm <small> <i
								class="ace-icon fa fa-angle-double-right"></i> Danh sách sản
								phẩm
							</small>
						</h1>
					</div>
					<!-- /.page-header -->
					<div class="table-responsive">
						<c:if test="${not empty message}">
							<div class="alert alert-${alert}">${message}</div>
						</c:if>
						<div class="pull-right tableTools-container">
							<a flag="info"
								class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
								data-toggle="tooltip" title='Thêm sản phẩm'
								href='<c:url value="/admin/product/edit"/>'> <span> <i
									class="fa fa-plus-circle bigger-110 purple"></i>
							</span>
							</a>
							<button id="btnDelete" onclick="waningDelete()" type="button"
								class="dt-button buttons-html5 btn btn-white btn-danger btn-bold"
								data-toggle="tooltip" title='Xoá'>
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
									<th scope="col">Tên</th>
									<th scope="col">Hãng sản xuất</th>
									<th scope="col">Giá</th>
									<th scope="col">Ngày tạo</th>
									<th scope="col">RAM</th>
									<th scope="col">CPU</th>
									<th scope="col">Số lượng</th>
									<th scope="col">Image</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${model.content}">
									<tr>
										<td class=".align-middle"><label
											for="checkbox_${item.id}"></label> <input type="checkbox"
											id="checkbox_${item.id}" value="${item.id}" /></td>
										<td style="vertical-align: middle">${item.name }</td>
										<td style="vertical-align: middle">${item.categories.name }</td>
										<td style="vertical-align: middle">${item.price}</td>
										<td style="vertical-align: middle"><fmt:formatDate
												var="createDate" value="${item.createDate}"
												pattern="dd/MM/yyyy" /> ${createDate}</td>
										<td style="vertical-align: middle">${item.cpu}</td>
										<td style="vertical-align: middle">${item.ram}</td>
										<td style="vertical-align: middle">${item.quantity}</td>
										<td style="vertical-align: middle"><img alt="product"
											src="${item.image}"
											style="width: 85px; height: 85px;"></td>


										<td style="vertical-align: middle"><c:url var="editURL"
												value="/admin/product/edit">
												<c:param name="id" value="${item.id}" />
											</c:url> <a class="btn btn-sm btn-warning btn-edit"
											data-toggle="tooltip" title="Cập nhật" href='${editURL}'><i
												class="fa fa-pencil-square-o" aria-hidden="true"></i> </a> <br />
											<br /></td>
									</tr>
								</c:forEach>
							</tbody>

						</table>
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-end">
								<c:if test="${model.number > 0}">
									<li class="page-item"><a class="page-link"
										href="/admin/product/list?s=${key}&p=0">First</a></li>
									<li class="page-item"><a class="page-link"
										href="/admin/product/list?s=${key}&p=${model.number-1}"
										tabindex="-1">Previous</a></li>
								</c:if>
								<c:if test="${model.number >5}">
									<li class="page-item disabled"><a class="page-link"
										href="#">...</a></li>
								</c:if>

								<c:forEach var="j" begin="1" end="${model.totalPages}">
									<li class="page-item"><a class="page-link"
										href="/admin/product/list?s=${key}&p=${j-1}"><c:out
												value="${j}" /></a></li>
								</c:forEach>

								<c:if
									test="${model.totalPages >5 && model.number <(model.totalPages-3)}">
									<li class="page-item disabled"><a
										class="page-link disabled" href="#">...</a></li>
								</c:if>



								<c:if test="${model.number < model.totalPages -1}">
									<li class="page-item"><a class="page-link"
										href="/admin/product/list?s=${key}&p=${model.number+1}">Next</a>
									<li class="page-item"><a class="page-link"
										href="/admin/product/list?s=${key}&p=${model.totalPages-1}">Last</a>
								</c:if>


							</ul>
						</nav>
						Số thực thể hiện tại: ${model.numberOfElements} Trang số:
						${model.number} Kích thước trang: ${model.size} Tổng số thực thể:
						${model.totalElements} Tổng số trang: ${model.totalPages}
					</div>
				</div>
				<!-- /.page-content -->
			</div>
		</form>
	</div>
	<script>
                                                            $(document).ready(function() {
                                                                $('#btnDelete').prop('disabled', true);
                                                               
                                                            });
                                                        </script>
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
                            title: "Are you sure?",
                            text: "Once deleted, you will not be able to recover this imaginary file!",
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
                                swal("Poof! Your imaginary file has been deleted!", {
                                    icon: "success",
                                });
                            } else {
                                swal("Your imaginary file is safe!");
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
                            window.location.href = "/admin/product/list?message=delete_success";
                        },
                        error: function(error) {
                            window.location.href = "/admin/product/list?message=error_system";
                        }
                    })
                }
            </script>
</body>

</html>