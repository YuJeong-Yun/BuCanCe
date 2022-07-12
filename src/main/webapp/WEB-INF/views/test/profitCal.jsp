<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<jsp:include page="../include/headerAdmin.jsp" />
	<jsp:include page="${pageContext.request.contextPath}/resources/js/getVIPInfo.jsp"></jsp:include>
	<div id="wrapper">
	       <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <li>
                <div class="sidebar-brand d-flex align-items-center justify-content-center">관리자 메뉴</div>
           	 	<hr class="sidebar-divider my-0">
            </li>
            
            
            
            <li class="nav-item">
                <a class="nav-link" href="/profitChart">
                    <i class="fa fa-clock-o" aria-hidden="true"></i>
                    <span>Dashboard</span></a>
            </li>
            
            <hr class="sidebar-divider">


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
			
			<li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                <i class="fa fa-krw" aria-hidden="true"></i>
                    <span>관리자메뉴</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar" style="">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="/profitChart">매출 현황</a>
                        <a class="collapse-item" href="/profitCal">기간별 조회</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="/profitChart">
                    <span>매출 현황</span>
                </a>
                <a class="nav-link collapsed" href="/profitCal">
                    <span>일별 조회</span>
                </a>
            </li>
        </ul>
        <!-- End of Sidebar -->  

        <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Premium 회원 내역</h1>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Premium 회원 조회</h6>
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
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
	
<jsp:include page="../include/footer.jsp" />
