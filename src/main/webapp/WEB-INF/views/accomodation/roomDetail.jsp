<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 197번줄부터 442번줄 -->
<!DOCTYPE html>
<html lang="zxx">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath}/resources/js/acc/JroomDetail.jsp"/>
	<jsp:include page="${pageContext.request.contextPath}/resources/css/acc/CroomDetail.css"/>
	

	<jsp:include page="../include/header.jsp" />

	<!-- Breadcrumb Section Begin -->
	<div class="breadcrumb-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-text">
						<h2>방 상세정보</h2>
						<div class="bt-option">
							<a href="<%=request.getHeader("REFERER")%>">뒤로가기</a> <span>Rooms</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Section End -->

	<!-- Room Details Section Begin -->
	<section class="room-details-section spad">
		<div class="container">
			<div class="row">
				<c:set var="a" />
				<c:set var="b" />

			<div class="col-lg-8">
			<div class="room-details-item">





<!-- 해당숙소의 방사진들을 슬라이드쇼로 보여줌  -->		
 <div id="slideShow">
    <ul class="slides">
    
     <c:forEach items="${roomdetail0}" begin="0" end="${roomdetail0.size()}">
      <li>
      <img src="${roomdetail0.get(b).room_pic}" style="width: 400px">
      </li>
      <c:set var="b" value="${b=b+1 }"/>
  	</c:forEach>
      
    </ul>
    <p class="controller">
      <!-- &lang: 왼쪽 방향 화살표 &rang: 오른쪽 방향 화살표 --> 
      <span class="prev">&lang;</span> 
      <span class="next">&rang;</span>
    </p>
  </div>
 <!-- 해당숙소의 방사진들을 슬라이드쇼로 보여줌  -->	
			
			
			
			
					
<!-- 숙소에 대한 상세 정보를 보여주는 영역 시작 -->
                     <div class="rd-text">
                            <div class="rd-title">
                                <h3> ${roomdetail.get(0).room_title}</h3>
                                <div class="rdt-right">
									<div class="rating">${roomdetail.get(0).room_star} 
										<i class="icon_star"></i> <i class="icon_star"></i> <i
											class="icon_star"></i> <i class="icon_star"></i> <i
											class="icon_star-half_alt"></i>
									&nbsp; <h5> 별점 :${roomdetail.get(0).room_star_num} 점</h5></div>
									
								</div>
							</div>
							<table>
								<tbody>
									

									<tr>
										<td><hr> <br></td>
									</tr>
									<c:if test="${roomdetail2.size() != 0}">
										<tr>
											<td class="r-o">서비스:</td>
											<td>${roomdetail2.get(0).room_service}</td>
										</tr>
									</c:if>
									<tr>
										<td><hr> <br></td>
									</tr>
									<c:if test="${roomdetail.get(0).room_address!=null}">
										<tr>
											<td class="r-o">주소:</td>
											<td>${roomdetail.get(0).room_address}</td>
										</tr>
									</c:if>
									<tr>
										<td><hr> <br></td>
									</tr>
								<c:if test="${roomdetail3.size() != 0}">
										<tr>
											<td class="r-o">※주의사항</td>
											<td>${roomdetail3.get(0).room_comment}</td>
										</tr>
									</c:if>
									<tr>
										<td><hr> <br></td>
									</tr>
									<c:if test="${roomdetail4.size() != 0}">
										<tr>
											<td class="r-o">주변 안내</td>
											<td>${roomdetail4.get(0).room_info}</td>
										</tr>
									</c:if>
								</tbody>

							</table>
							<br> <br> <br>
							<hr>
							<c:if test="${roomdetail5.size() != 0}">
								<h3>
									<b><i>상세 정보</i></b>
								</h3>
								<br>
								<br>
								<p class="f-para">${roomdetail5.get(0).room_infoa}</p>
							</c:if>
						</div>
					</div>
					
					
					<div class="rd-reviews">
						<h4>${roomdetail.get(0).room_retitle}</h4>
						
						
						
					</div>
					<div class="review-add">
						<form action="#" class="ra-form">
							<div class="row">
								<div class="col-lg-6">
								</div>
								<div class="col-lg-6">
								</div>
								<div class="col-lg-12">
									
								</div>
							</div>
						</form>
					</div>
				</div>
<!-- 숙소에 대한 상세 정보를 보여주는 영역 끝 -->




<!-- 달력을 통해 날짜 정보를 입력하여 예약페이지로 이동시킬수있음 -->
                <div class="col-lg-4">
                      <div class="room-booking" style="border: solid gray; box-shadow: 5px 5px 5px 5px gray; background-color: #FAFAFA; border-radius:10px;">
                    <p></p>  <h3>  <a href="${pageContext.request.contextPath}/accomodation/roomPrice?bno=${bno}" id="reserveId"><b>요금정보</b></a></h3>
                        <form action="${pageContext.request.contextPath}/accomodation/roomReserve" method="GET" name="dateForm">
                            <input type="hidden" name="bno" value="${bno}">
                            <input type="hidden" name="ano" value="${ano}">
                            <input type="hidden" name="room_title" value="${roomdetail.get(0).room_title}">
                            <div class="check-date">
                                <label for="date-in"><b>체크인</b></label>
                                <input type="text" class="date-input" id="date-in" value="${param.sel_date}" name="sel_date">
                                <i class="icon_calendar"></i>
                            </div>
                            <div class="check-date">
                                <label for="date-out"><b>체크 아웃</b></label>
                                <input type="text" class="date-input" id="date-out" value="${param.sel_date2}" name="sel_date2">
                                <i class="icon_calendar"></i>
                            </div>
                            <button type="button" id="reserveBtn" class="btn btn-primary" >
예약하기</button><p></p>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
<!-- 달력을 통해 날짜 정보를 입력하여 예약페이지로 이동시킬수있음 -->   
<!-- Room Details Section End -->

	<jsp:include page="../include/footer.jsp" />


</body>

</html>