<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<jsp:include page="../include/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/admin.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/sb-admin-2.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/sb-admin-2.min.css" type="text/css">	

	    <div id="wrapper">
		<jsp:include page="../include/sideMenuAdmin.jsp" />

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Topbar Search -->
                    <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                        	<h3>부캉스</h3>
                        </div>
                    </form>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">관리자 DashBoard</h1>
                    </div>
				<div class="card-body">
					<div class="table-responsive">
						<div id="dataTable_wrapper"
							class="dataTables_wrapper dt-bootstrap4">
							<div class="row">
								<div class="col-sm-12 col-md-6">
									<div class="dataTables_length" id="dataTable_length">
									</div>
								</div>
								<div class="col-sm-12 col-md-6">
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12">
										 	<form name="deleteform" method="post">
										 	<input type="hidden" value="" name="id">
									<table class="table table-bordered dataTable" id="dataTable"
										width="100%" cellspacing="0" role="grid"
										aria-describedby="dataTable_info" style="width: 100%;">
										<thead>
											<tr role="row">
												<th class="sorting sorting_asc" tabindex="0"
													aria-controls="dataTable" rowspan="1" colspan="1"
													aria-sort="ascending"
													aria-label="Name: activate to sort column descending"
													style="width: 69px;">이름</th>
												<th class="sorting" tabindex="0" aria-controls="dataTable"
													rowspan="1" colspan="1"
													aria-label="Position: activate to sort column ascending"
													style="width: 87px;">ID</th>
												<th class="sorting" tabindex="0" aria-controls="dataTable"
													rowspan="1" colspan="1"
													aria-label="Office: activate to sort column ascending"
													style="width: 56px;">연락처</th>
												<th class="sorting" tabindex="0" aria-controls="dataTable"
													rowspan="1" colspan="1"
													aria-label="Age: activate to sort column ascending"
													style="width: 80px;">회원가입일</th>
												<th class="sorting" tabindex="0" aria-controls="dataTable"
													rowspan="1" colspan="1"
													aria-label="Start date: activate to sort column ascending"
													style="width: 70px;">권한</th>
										</thead>
										<tbody>
												<c:forEach items="${mg }" var="mg">
											<tr class="even">
												<td class="sorting_1">${mg.name }</td>
												<td>${mg.id }</td>
												<td>${mg.tel }</td>
												<td>${mg.regdate }</td>
												<td><button type="button" class="w-btn w-btn-indigo" id="Withdrawal" onclick="deleteCheck('${mg.id }');">회원 탈퇴</button></td>
											</tr>
											</c:forEach>
											<c:forEach items="${kakao }" var="kakao">
											<tr class="even">
												<td class="sorting_1">${kakao.k_name }</td>
												<td>${kakao.k_number }</td>
												<td>${kakao.k_email }</td>
												<td>${kakao.regdate }</td>
												<td><button type="button" class="w-btn w-btn-indigo" id="Withdrawal" onclick="deleteCheck('${kakao.k_number }');">회원 탈퇴</button></td>
											</tr>
											</c:forEach> 
										</tbody>
									</table>
											</form>
								</div>
							</div>
						</div>
					</div>
				</div>


                </div>
                <!-- 프리미엄 회원 내역 조회, 총 액수 출력 -->

            </div>
            <!-- End of Main Content -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
								
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>

<script>
		function deleteCheck(id) {
			if (confirm("삭제하시겠습니까?")) {
				document.deleteform.id.value = id;
				document.deleteform.action = "/admin/delete";
				document.deleteform.submit();
			}

		}

// 	});
</script>

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin/vipInfo.js"></script>   									
<jsp:include page="../include/footer.jsp" />