<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/acc/CroomList.css" type="text/css">
	<!-- 헤더부분 -->
	<jsp:include page="../include/header.jsp" />
	<!-- 헤더부분 -->
	
	<!-- 무한스크롤포함 js동작들 -->
	<jsp:include page="../accomodation/acc/JroomList.jsp"/>
	<!-- 무한스크롤포함 js동작들 -->
	
	
	<!-- Breadcrumb Section Begin --> 
	<section>
	<div class="breadcrumb-section" >
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-text" >
						<h2 style="font-family: 'Jeju Hallasan' ">숙소 선택</h2>
						<div class="bt-option">
							<a href="${pageContext.request.contextPath}/index">Home</a> 
							<span>숙소 선택</span> 
						</div></div></div></div>
			<br><br><br>

			<!-- 숙소목록선택,검색기능을 하는 코드 시작 -->
<!-- 			<form  id="idForm" name="idForm" > -->
				<select name="area" onchange="selectArea()" id="area" style="background: blue; line-height: 1.5;" >
					<optgroup label="지역">
						<option value="favorite"
						<c:if test="${select_area=='favorite'}">selected</c:if>
						>지역을 선택하세요.</option>
						<option value="favorite"
						<c:if test="${select_area=='favorite'}">selected</c:if>
						>인기순</option>
						<option 
						<c:if test="${select_area=='해운대/재송'}">selected</c:if>
						value="해운대/재송" >해운대/재송
						</option>
						<option value="송정/기장/정관"
						<c:if test="${select_area=='송정/기장/정관'}">selected</c:if>
						>송정/기장/정관</option>
						<option value="서면/초읍/양정"
						<c:if test="${select_area=='서면/초읍/양정'}">selected</c:if>
						>서면/초읍/양정</option>
						<option value="남포동/부산역/송도/영도/범일동"
						<c:if test="${select_area=='남포동/부산역/송도/영도/범일동'}">selected</c:if>
						>남포동/부산역/송도/영도/범일동</option>
						<option value="광안리/수영/민락"
						<c:if test="${select_area=='광안리/수영/민락'}">selected</c:if>
						>광안리/수영/민락</option>
						<option value="경성대/대연/용호/문현"
						<c:if test="${select_area=='경성대/대연/용호/문현'}">selected</c:if>
						>경성대/대연/용호/문현</option>
						<option value="동래/온천장/부산대/구서/사직"
						<c:if test="${select_area=='동래/온천장/부산대/구서/사직'}">selected</c:if>
						>동래/온천장/부산대/구서/사직</option>
						<option value="연산/토곡"
						<c:if test="${select_area=='연산/토곡'}">selected</c:if>
						>연산/토곡</option>
						<option value="사상/"
						<c:if test="${select_area=='사상/'}">selected</c:if>
						>사상</option>
						<option value="강서/하단/사하/명지/신호"
						<c:if test="${select_area=='강서/하단/사하/명지/신호'}">selected</c:if>
						>강서/하단/사하/명지/신호</option>
						<option value="덕천/만덕/구포/화명/북구"
						<c:if test="${select_area=='덕천/만덕/구포/화명/북구'}">selected</c:if>
						>덕천/만덕/구포/화명/북구</option>
					</optgroup>
				</select> &nbsp; &nbsp; &nbsp; 
	

				<input type="text" name="place_name" id="place_name" style="margin-left:auto; margin-right:auto;">
				
&nbsp; &nbsp; 
				<button type="button" class="btn btn-primary" onclick="selectArea()" style="height: 40px; margin-left:auto; margin-right:auto;">검색</button>

<!-- 				</form> -->
				<!-- 숙소목록선택,검색기능을 하는 코드 끝 -->

		</div>
	</div>
	<!-- Breadcrumb Section End -->
<br><br><br>

  	<div class="loading" >
				
					<img src="${pageContext.request.contextPath}/resources/img/acc/loading.gif"  style=" display: block; margin: 0px auto;">				
				
				</div>

	<!-- Rooms Section Begin --> <!-- 방정보 처음 6개 -->
	<section class="rooms-section spad"  >
		<div class="container">
			<div class="row" id="cell">
		
			
			
			</div>
		</div>
	</section>
	</section>
	<!-- < 방정보 처음 6개 --> 


<jsp:include page="../include/footer.jsp" />
	
