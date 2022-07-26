<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../include/headerAdmin.jsp" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin/admin.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin/sb-admin-2.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin/sb-admin-2.min.css"
	type="text/css">

<div id="wrapper">
	<jsp:include page="../include/sideMenuAdmin.jsp" />

	<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column">

		<!-- Main Content -->
		<div id="content">

			<!-- Topbar -->
			<nav
				class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

				<!-- Topbar Search -->
				<form
					class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
					<div class="input-group">
						<h3>부캉스</h3>
					</div>
				</form>

			</nav>
			<!-- End of Topbar -->

			<!-- Begin Page Content -->
			<div class="container-fluid">

				<!-- Page Heading -->
				<div
					class="d-sm-flex align-items-center justify-content-between mb-4">
					<h1 class="h3 mb-0 text-gray-800">수동 스케줄러</h1>
				</div>

				<div class="row">

					<!-- 기한 만료 회원삭제 -->

					<div class="col-xl-3 col-md-6 mb-4">
						<div class="card border-left-primary shadow h-100 py-2">
							<div class="card-body">
								<div class="row no-gutters align-items-center">
									<div class="col mr-2">
										<div
											class="text-xs font-weight-bold text-primary text-uppercase mb-1">
											기간만료 회원삭제</div>
										<div class="h5 mb-0 font-weight-bold text-gray-800">
											<form action="/order/noautoScheduled1" method="post">
												<input class="btn btn-info"
													style="background-color: #0288D1;" type="submit"
													value="기한만료회원 삭제">
											</form>
										</div>

									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- 정기결제  -->
					<div class="col-xl-3 col-md-6 mb-4">
						<div class="card border-left-success shadow h-100 py-2">
							<div class="card-body">
								<div class="row no-gutters align-items-center">
									<div class="col mr-2">
										<div
											class="text-xs font-weight-bold text-success text-uppercase mb-1">
											정기결제(재결제)</div>
										<div class="h5 mb-0 font-weight-bold text-gray-800">
											<form action="/order/noautoScheduled12" method="post">
												<input class="btn btn-info" style="background-color: green;"
													type="submit" value="정기결제(재결제)">
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<jsp:include page="../include/footer.jsp" />
<%@ include file="../include/footer.jsp"%>