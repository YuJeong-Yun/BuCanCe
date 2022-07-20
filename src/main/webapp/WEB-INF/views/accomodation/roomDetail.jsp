<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 197번줄부터 442번줄 -->
<!DOCTYPE html>
<html lang="zxx">
<head>
<meta charset="UTF-8">
<meta name="description" content="Sona Template">
<meta name="keywords" content="Sona, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sona | Template</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- Google Font -->
<link href="https://fonts.googleapis.com/css?family=Lora:400,700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&display=swap" rel="stylesheet">
<!-- Css Styles -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/acc/yd.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/flaticon.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/plan/planContent.css" />
<!-- 따로 제외시키면 에러남 -->
<style type="text/css">
#slidebox {
 border:1px solid #00ABB9;
 box-shadow: 5px 5px 5px 5px gray;
  
  /*전체 컨테이너*/
  width: 600px;
  border-radius:10px;}
  
#slideShow {
 border:1px solid #00ABB9;
  border-radius:10px;
  /*전체 컨테이너*/
  width: 600px;
  height: 100px;
  position: relative;
  top:-50px;
 margin: 0 0 -50px 0;
  overflow: hidden; /*리스트 형식으로 이미지를 일렬로 정렬할 것이기 때문에, 500px 밖으로 튀어 나간 이미지들은 hidden으로 숨겨줘야됨*/
}
.slides {border:1px solid gray;
border-radius:10px;
  /*이미지들이 담겨있는 슬라이드 컨테이너*/
  position: absolute;
  left: 0;
  top: 0px;
  width: 2500px; /* 슬라이드할 사진과 마진 총 넓이 */
  transition: 0.5s ease-out; /*ease-out: 처음에는 느렸다가 점점 빨라짐*/
} /* 첫 번째 슬라이드 가운데에 정렬하기위해 첫번째 슬라이드만 margin-left조정 */
.slides li:first-child {
border:1px solid skyblue;
border-radius:10px;
  margin-left: 50px;
} /* 슬라이드들 옆으로 정렬 */
.slides li:not(:last-child) {
border-radius:10px;
  float: left;
  margin-right:0;
}

</style>
<!-- 따로 제외시키면 에러남 -->
</head>
<body>
	<jsp:include page="../include/header.jsp" />

	<!-- Breadcrumb Section Begin -->
	
	<div class="breadcrumb-section" >
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-text">
						<h2>방 상세정보</h2>
						<div class="bt-option">
							<a href="${pageContext.request.contextPath }/accomodation/roomList"">숙소선택</a> 
							<span>방 상세정보</span>
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
<div id="slidebox"> 
 <img src="${roomdetail0.get(0).room_pic}" style="width: 100%; border-radius:10px;" id="mainpic">		
 <div id="slideShow">
    <ul class="slides">
     <c:forEach items="${roomdetail0}" begin="0" end="${roomdetail0.size()}">
      <li style="background-color: white;">
      <img src="${roomdetail0.get(b).room_pic}" style="width: 140px;"  onclick="change(event);">&nbsp;
      </li>
      <c:set var="b" value="${b=b+1 }"/>
  	</c:forEach>      
    </ul>
    
    <p class="controller">
      <!-- &lang: 왼쪽 방향 화살표 &rang: 오른쪽 방향 화살표 --> 

      <span class="prev"><b style="font-size: xx-large; color: #70ffb0; " >◀</b></span> 
      <span class="next"><b style="font-size: xx-large; color: #70ffb0;">▶</b></span>
      
    </p>
  </div>

 </div> 
 <!-- 해당숙소의 방사진들을 슬라이드쇼로 보여줌  -->	
					
					<br> <br>
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
                            <button type="button" id="reserveBtn" class="btn btn-primary" >예약하기</button><p></p>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
<!-- 달력을 통해 날짜 정보를 입력하여 예약페이지로 이동시킬수있음 -->   
<!-- Room Details Section End -->

<jsp:include page="../include/footer.jsp" />
    <!-- Js Plugins -->
    <script src="${pageContext.request.contextPath}/resources/js/slideShow.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
    <jsp:include page="${pageContext.request.contextPath}/resources/js/acc/JroomDetail.jsp"></jsp:include>
</body>

</html>