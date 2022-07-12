<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
	<jsp:include page="../include/headerAdmin.jsp" />
	<jsp:include page="${pageContext.request.contextPath}/resources/js/getVIPInfo.jsp"></jsp:include>
	<div id="wrapper">
      <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <li>
                <div class="sidebar-brand d-flex align-items-center justify-content-center">관리자 메뉴</div>
            	<hr class="sidebar-divider">
            </li>

            <!-- Divider -->

            <!-- Heading -->
            <li>
	            <div class="sidebar-heading">
	                Premium 회원 관리
	            </div>
			</li>
			
            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="/profitCal">
                    <span>Premium 회원 내역</span>
                </a>
            <hr class="sidebar-divider">
            </li>


            <!-- Heading -->
            <li>
	            <div class="sidebar-heading">
	                매출
	            </div>
			</li>
            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="/profitChart">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>Charts</span></a>
            </li>

            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="tables.html">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Tables</span></a>
            </li>
        </ul>
        <!-- End of Sidebar -->  
        <div class="container-fluid"> 


                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Premium 회원</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                                		<div class="col-sm-12 col-md-6">
                                			<div id="dataTable_filter" class="dataTables_filter">
                                			<label>조회할 날짜 : <input type="month" name=searchDate></label>
                                				<input type="button" value="조회" id="profitBtn">
                                			</div>
                               			</div>
                      			</div>
                      			<div class="row">
                      				<div class="col-sm-12">
                      					<table class="table table-bordered dataTable" id="dataTable" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
                                    <thead>
                                        <tr role="row">
                                        	<th class="sorting sorting_asc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending">회원 ID</th>
                                        	<th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Age: activate to sort column ascending" >정기 구독 여부</th>
                                        	<th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending">구독 결제일</th>
                                        	<th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Office: activate to sort column ascending">구독 만료일</th>
                                        	</tr>
                                    </thead>
                                    <tbody>
                                    <c:if test="${not empty pmMems }">
								<c:forEach var="i" begin="0" end="${pmMems.size()-1 }" step="1">
								<c:set var="period" value="${periodic[i] }"/>
								<c:set var="pm" value="${pmMems[i] }"/>
									<tr>
										<td>${pm.id }</td>
										<td>
										<c:if test="${not empty periodic }">
										${period }
										</c:if>
										<c:if test="${empty periodic }">
										y
										</c:if>
										</td>
										<td>${pm.success_date }</td>
										<td>${pm.license_deadline }</td>
									</tr>
								</c:forEach>
								</c:if>
								<c:if test="${empty pmMems }">
									<tr>
										<td colspan="4">내역이 없습니다.</td>
									</tr>
								</c:if>
                                    </tbody>
                                   	<tfoot>
										<tr>
											<th colspan="3" id="total">총 수익</th>
											<th>${pmMems.size() * 6000 }</th>
										</tr>
									</tfoot>
                                </table>
                                </div>
                                </div>
                                <div class="row">
	                                <div class="col-sm-12 col-md-7">
		                                <div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
			                                <ul class="pagination">
				                                <li class="paginate_button page-item previous disabled" id="dataTable_previous"><a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li>
				                                <li class="paginate_button page-item active"><a href="#" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">1</a></li>
				                                <li class="paginate_button page-item next" id="dataTable_next"><a href="#" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">Next</a></li>
			                                </ul>
		                                </div>
	                                </div>
                                </div>
                                    <div id="pmSort">
									    <input type="button" value="구독회원만 보기" class="w-btn w-btn-indigo" onclick="location.href='/periodMems?date=${param.date}';">
									    <input type="button" value="모두보기" class="w-btn w-btn-indigo" onclick="location.href='/pmMembers?date=${param.date}';">
								    </div>
                                </div>
                            </div>
                        </div>
                    </div>

	</div>
<jsp:include page="../include/footer.jsp" />
