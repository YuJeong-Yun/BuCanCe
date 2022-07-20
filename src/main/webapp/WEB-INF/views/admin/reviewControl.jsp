<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<jsp:include page="../include/headerAdmin.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/board.css" type="text/css">
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
                        <div class="input-group" id="toMain">
                        	<h3><a href="/index">부캉스 메인으로</a></h3>
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

						<div class="row">
						
						<!-- 일자별 회원가입수(웹,카카오) -->
						<div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">일자별 회원가입수 추이</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
                                       	<div id="daily_member_chart" style="display: block; width: 100%; height: 100%;" class="chartjs-render-monitor"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- 일주일간 매출 -->
						<div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">매출 최신 현황</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
                                       	<div id="curve_chart" style="display: block; width: 100%; height: 100%;" class="chartjs-render-monitor"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- 매출 월간 현황 -->
						<div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">매출 월간 현황</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
                                       	<div id="monthly_chart" style="display: block; width: 100%; height: 100%;" class="chartjs-render-monitor"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                      </div>
                        
					<br><br>
					
					
					
					<!-- 회원 요약 -->
					<div class="row">

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                회원수</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">총 ${totalMem }명</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                프리미엄 회원 수</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">총 ${totalPmMem }명</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                              리뷰 수</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">총 ${totalComment }개</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!-- Pending Requests Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                숙박 결제건(전월대비)</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800" style="display: inline-block;">${totalAcc[0] }건
                                            </div>
                                            
                                            <!-- 전월과 비교하여 증가 감소 추세 표시 -->
                                            <c:if test="${totalAcc[0]-totalAcc[1] > 0 }">
                                             <span style="color:red; margin-left: 7px;">${totalAcc[0]-totalAcc[1] } ▲</span> 
                                            </c:if>
                                            
                                            <c:if test="${totalAcc[0]-totalAcc[1] < 0 }">
                                             <span style="color:blue; margin-left: 7px;">${(totalAcc[0]-totalAcc[1])*-1 } ▼</span> 
                                            </c:if>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
                
                <br>
                <!-- 프리미엄 회원 내역 조회, 총 액수 출력 -->
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">기간별 조회</h1>
                    </div>
                    
                    <div class="card mb-4">
                                <div class="card-header">
                                    조회할 기간을 선택해주세요.
                     			<div id="dataTable_filter" class="dataTables_filter">
                				    <input type="button" value="오늘" class="periodBtn" id="today">
                       				<input type="button" value="7일" class="periodBtn" id="week">
                       				<input type="button" value="1개월" class="periodBtn" id="1month">
                       				<input type="button" value="3개월" class="periodBtn" id="3months">
                       				<input type="button" value="6개월" class="periodBtn" id="6months">
                     				<input type="date" name=startDate id="startDate">
                     				~
                     				<input type="date" name=endDate id="endDate">
                     				<input type="button" value="조회" id="profitBtn" onclick="pmMems();">
                     				<span id="filterBtn">
                     				</span>
                       			</div>
                                </div>
                                <div class="card-body">
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
                                </tbody>
                                <tfoot>
								</tfoot>
                                </table>
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
<script type="text/javascript">


</script>    
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin/profitChart.js"></script>   	   									
<script src="${pageContext.request.contextPath}/resources/js/admin/vipInfo.js"></script>   									
<jsp:include page="../include/footer.jsp" />
