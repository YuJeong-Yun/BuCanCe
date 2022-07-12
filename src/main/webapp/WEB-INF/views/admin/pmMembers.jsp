<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
	<jsp:include page="../include/headerAdmin.jsp" />
	<jsp:include page="${pageContext.request.contextPath}/resources/js/getVIPInfo.jsp"></jsp:include>
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
                        <h1 class="h3 mb-0 text-gray-800">매출 현황</h1>
                    </div>


                    <div class="row">
                    
                        <!-- Area Chart -->
                        <div class="col-xl-6">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">최신 현황</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                                        <div id="curve_chart" style="display: block; width: 100%; height: 100%;" class="chartjs-render-monitor"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-xl-6">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">월간 현황</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                                        <div id="monthly_chart" style="display: block; width: 100%; height: 100%;" class="chartjs-render-monitor"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
                <!-- /.container-fluid -->
                
                
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
                     				<input type="button" value="조회" id="profitBtn">
								    <input type="button" value="구독회원만 보기" class="w-btn w-btn-indigo" onclick="location.href='/periodMems?date=${param.date}';">
								    <input type="button" value="모두보기" class="w-btn w-btn-indigo" onclick="location.href='/pmMembers?date=${param.date}';">
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
                                </div>
                                
                            </div>



                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
     
									
<jsp:include page="${pageContext.request.contextPath}/resources/js/getProfitChart.jsp"></jsp:include>
<jsp:include page="../include/footer.jsp" />
