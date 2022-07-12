<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
	<jsp:include page="../include/headerAdmin.jsp" /> 
	<jsp:include page="${pageContext.request.contextPath}/resources/js/getVIPInfo.jsp"></jsp:include>
	
	
	<div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">관리자 메뉴</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Premium 회원 관리
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="/profitCal">
                    <span>Premium 회원 내역</span>
                </a>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>Utilities</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Custom Utilities:</h6>
                        <a class="collapse-item" href="utilities-color.html">Colors</a>
                        <a class="collapse-item" href="utilities-border.html">Borders</a>
                        <a class="collapse-item" href="utilities-animation.html">Animations</a>
                        <a class="collapse-item" href="utilities-other.html">Other</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Addons
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>Pages</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Login Screens:</h6>
                        <a class="collapse-item" href="login.html">Login</a>
                        <a class="collapse-item" href="register.html">Register</a>
                        <a class="collapse-item" href="forgot-password.html">Forgot Password</a>
                        <div class="collapse-divider"></div>
                        <h6 class="collapse-header">Other Pages:</h6>
                        <a class="collapse-item" href="404.html">404 Page</a>
                        <a class="collapse-item" href="blank.html">Blank Page</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="charts.html">
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
    <!-- Breadcrumb Section Begin -->
    <div class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2>Premium 회원 내역</h2>
                        <div style="display: inline-block; margin-top: 1em;">
                        조회할 날짜 : 
                        <input type="month" name="searchDate">
                        <input type="button" value="조회" id="profitBtn">
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
    <!-- Breadcrumb Section End -->
    
    <!-- Blog Details Section Begin -->
    <section class="blog-details-section">
        <div class="container">
            <div class="row">
			    <!-- <div class="col-lg-1">
			        <h2>Contact Info</h2>
			        <ul>
			        	<li>Premium 회원 내역</li>
			        	<li>매출 그래프</li>
			        	<li>3</li>
			        	<li>4</li>
			        </ul>
			    </div> -->
                <div class="col-lg-10 offset-lg-1">
                    <div class="blog-details-text">
                        <div class="bd-title">
                        <div class="table-wrapper">
							<table>
							
								<thead>
									<tr>
										<th>회원ID</th>
										<th>정기구독여부</th>
										<th>구독결제일</th>
										<th>구독만료일</th>
									</tr>
								</thead>
								
								<tbody id="vipContent">
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
        </div>
    </section>
    <!-- Blog Details Section End -->
    </div>

<jsp:include page="../include/footer.jsp" />
