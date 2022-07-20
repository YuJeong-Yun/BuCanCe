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
			<form action="/accomodation/roomList" method="post" id="idForm" name="idForm" >
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
	

				<input type="text" name="place_name" id="place_name" value="${rs.getPlace_name()}" required spellcheck="false" style="margin-left:auto; margin-right:auto;">
				
&nbsp; &nbsp; 
				<input type="submit" value="검색" class="btn btn-primary" style="height: 40px; margin-left:auto; margin-right:auto;">

				</form>
				<!-- 숙소목록선택,검색기능을 하는 코드 끝 -->

		</div>
	</div>
	<!-- Breadcrumb Section End -->
<br><br>

  

	<!-- Rooms Section Begin --> <!-- 방정보 처음 6개 -->
	<section class="rooms-section spad"  >
		<div class="container">
			<div class="row" >
				<c:set var="a" />
				<c:forEach items="${roomList}" begin="0" end="5">
					<div class="col-lg-4 col-md-6" style="height:600px;" >
					<c:if test="${roomList.get(a).room_rank!=''}">
			<a href="/accomodation/roomDetail?bno=${roomList.get(a).room_link}">
			</c:if>
						<div class="room-item" style="border-radius: 2em; ">
							
							<c:if test="${roomList.get(a).room_rank!=''}">
							
								<img src="${roomList.get(a).room_pic}" alt="acc" class="poster" height="200" style=" border-bottom-style: none; border-style: solid;  border-color: #00ABB9 #00ABB9 #FFFFFF #00ABB9 ; box-shadow: 5px 0px 5px gray; border-radius:10px 10px 0px 0px;">
							
							</c:if>
							
							<c:if test="${roomList.get(a).room_rank==''}">
								<img src="${roomList.get(a).room_pic}" alt="acc" class="poster" height="200">
							</c:if>
							
							
							<div class="ri-text"  style=" border-style: solid;  border-color: #FFFFFF #00ABB9 #00ABB9 #00ABB9;  box-shadow: 5px 5px 5px 5px gray; border-radius:0px 0px 10px 10px; height:320px; background: #FAFAFA"  >
								<h4><b style="font-family: 'Jeju Hallasan' ">${roomList.get(a).room_title}</b></h4>
								<table>
									<tbody>
										<tr>
											<td class="r-o" style="color: green">평점:</td>
											<td style="color: green">
											<c:if test="${roomList.get(a).room_rank!=''}">
											${fn:substring(roomList.get(a).room_rank,0,3)}점
											</c:if>
											<c:if test="${roomList.get(a).room_rank==''}">
											미정
											</c:if>
											</td>
										</tr>
										<tr>
											<td class="r-o">지역:</td>
											<td >${roomList.get(a).room_area}</td>
										</tr>
										<tr>
											<td class="r-o" style="color: blue">대실:</td>
											<c:if test="${roomList.get(a).room_price!='숙소에 문의'}">
													
											<td  style="color: blue">${roomList.get(a).room_price}원</td>
											</c:if>
											<c:if test="${roomList.get(a).room_price=='숙소에 문의'}">
											<td style="color: blue"> 미정 </td>
											</c:if>
										</tr>
										<tr>
											<td class="r-o" style="color: red">숙박:</td>
											<c:if test="${roomList.get(a).room_price2!='숙소에 문의'}">
											<td style="color: red">${roomList.get(a).room_price2} 원</td>
											</c:if>
											<c:if test="${roomList.get(a).room_price2=='숙소에 문의'}">
											<td style="color: red"> 미정 </td>
											</c:if>
											
										</tr>
									</tbody>
								</table>
								<div class="primary-btn">예약하기</div> 
								<c:if test="${roomList.get(a).room_rank!=''}">
<%-- 								<a href="/accomodation/roomDetail?bno=${roomList.get(a).room_link}" class="primary-btn"> --%>
								<a></a>
<!-- 								</a>  -->
								</c:if>
								
								<c:if test="${roomList.get(a).room_rank==''}">
								<a class="primary-btn"> 준비중 </a> 
								</c:if>
								
								<c:set var="a" value="${a=a+1}"/>

							</div>
						</div>
					</div>
					
					</a>
				</c:forEach>
			</div>
		</div>
	</section>
	</section>
	<!-- <!-- 방정보 처음 6개 --> -->


<jsp:include page="../include/footer.jsp" />
	
