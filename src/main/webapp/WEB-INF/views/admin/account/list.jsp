<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="NewURL" value="/admin/account/list" />
<c:url var="newAPI" value="/admin/account/delete" />

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Danh sách tài khoản</title>
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
						<li class="active">Quản lý tài khoản</li>
					</ul>

				</div>

				<div class="page-content">
					<%@ include file="/WEB-INF/views/admin/toppage.jsp"%>

					<div class="page-header">
						<h1>
							Tài Khoản <small> <i class="ace-icon fa fa-angle-double-right"></i>
								Danh sách tài khoản
							</small>
						</h1>
					</div>
					<!-- /.page-header -->
					<div class="container" style="width: 90%">
						<c:if test="${not empty message}">
							<div class="alert alert-${alert}">${message}</div>
						</c:if>
						<div class="pull-right tableTools-container">
							<a 
								class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
								data-toggle="tooltip" title='Thêm tài khoản'
								href='<c:url value="/admin/account/edit"/>'> <span> <i
									class="fa fa-plus-circle bigger-110 purple"></i>
							</span>
							</a>
							<button id="btnDelete" onclick="waningDelete()" type="button"
								class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
								data-toggle="tooltip" title='xoá taì khoản'>
								<span> <i class="fa fa-trash-o bigger-110 pink"></i>
								</span>
							</button>
						</div>

						<table id="example" class="table table-striped table-bordered" style="width:100%">
							<thead>
								<tr>
									<th><label for="checkAll"></label>&nbsp;<input
										type="checkbox" id="checkAll" /></th>
									<th scope="col">Họ và yên</th>
									<th scope="col">Tên tài khoản</th>
									
									<th scope="col">Ngày tạo</th>
									<!-- <th scope="col">Status</th> -->
									<th scope="col">Email</th>
									<th scope="col">Role</th>
									<th scope="col">Avatar</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${model.content}">
									<tr>
										<td class=".align-middle"><label
											for="checkbox_${item.id}"></label> <input type="checkbox"
											id="checkbox_${item.id}" value="${item.id}" /></td>
										<td style="vertical-align: middle">${item.fullname }</td>
										<td style="vertical-align: middle">${item.userName }</td>
										
										<td style="vertical-align: middle"><fmt:formatDate
												var="createDate" value="${item.createDate}"
												pattern="dd/MM/yyyy" /> ${createDate}</td>
										<%-- <td style="vertical-align: middle">${item.status?"Active":"InActive"}</td> --%>
										<td style="vertical-align: middle">${item.email}</td>
										<td style="vertical-align: middle">${item.role}</td>
										<td style="vertical-align: middle"><img alt="product"
											src="${item.photo}"
											style="width: 55px; height: 65px;"></td>
										

										<td style="vertical-align: middle"><c:url var="editURL"
												value="/admin/account/edit">
												<c:param name="id" value="${item.id}" />
											</c:url> <a class="btn btn-sm btn-primary btn-edit"
											data-toggle="tooltip" title="Update News" href='${editURL}'><i
												class="fa fa-pencil-square-o" aria-hidden="true"></i> </a> <br />
										 </td>
									</tr>
								</c:forEach>
							</tbody>

						</table>
					</div>
				</div>
				<!-- /.page-content -->
			</div>
		</form>
	</div>
	<script>
              $(document).ready(function() {
                 $('#btnDelete').prop('disabled', true);
                 $('#example').DataTable();                                           
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
                            window.location.href = "/admin/account/list/?message=delete_success";
                        },
                        error: function(error) {
                            window.location.href = "/admin/account/list/?message=error_system";
                        }
                    })
                }
            </script>
</body>

</html>