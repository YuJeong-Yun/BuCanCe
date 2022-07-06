<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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


<link
	href="https://fonts.googleapis.com/css?family=Lora:400,700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/yd.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/flaticon.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/magnific-popup.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css"
	type="text/css">

<script>
		
		$(function(){
			
			$('#reserveBtn').click(
					
			function(){
				var dateIn = document.getElementById("date-in").value;
				var dateOut = document.getElementById("date-out").value;
				
				var day1 = new Date(dateIn);
				var day2 = new Date(dateOut);
				
				var difference= Math.abs(day2-day1);
				days = difference/(1000 * 3600 * 24);

				alert(days);
				
			});
			
			
			
		});
		
		
		
		
		
		
</script>
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Offcanvas Menu Section Begin -->
	<div class="offcanvas-menu-overlay"></div>
	<div class="canvas-open">
		<i class="icon_menu"></i>
	</div>
	<div class="offcanvas-menu-wrapper">
		<div class="canvas-close">
			<i class="icon_close"></i>
		</div>
		<div class="search-icon search-switch">
			<i class="icon_search"></i>
		</div>
		<div class="header-configure-area">
			<div class="language-option">
				<img src="${pageContext.request.contextPath}/resources/img/flag.jpg"
					alt=""> <span>EN <i class="fa fa-angle-down"></i></span>
				<div class="flag-dropdown">
					<ul>
						<li><a href="#">Zi</a></li>
						<li><a href="#">Fr</a></li>
					</ul>
				</div>
			</div>
			<a href="#" class="bk-btn">Booking Now</a>
		</div>
		<nav class="mainmenu mobile-menu">
			<ul>
				<li class="active"><a href="./index.html">Home</a></li>
				<li><a href="./rooms.html">Rooms</a></li>
				<li><a href="./about-us.html">About Us</a></li>
				<li><a href="./pages.html">Pages</a>
					<ul class="dropdown">
						<li><a href="./room-details.html">Room Details</a></li>
						<li><a href="./blog-details.html">Blog Details</a></li>
						<li><a href="#">Family Room</a></li>
						<li><a href="#">Premium Room</a></li>
					</ul></li>
				<li><a href="./blog.html">News</a></li>
				<li><a href="./contact.html">Contact</a></li>
			</ul>
		</nav>
		<div id="mobile-menu-wrap"></div>
		<div class="top-social">
			<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
				class="fa fa-twitter"></i></a> <a href="#"><i
				class="fa fa-tripadvisor"></i></a> <a href="#"><i
				class="fa fa-instagram"></i></a>
		</div>
		<ul class="top-widget">
			<li><i class="fa fa-phone"></i> (12) 345 67890</li>
			<li><i class="fa fa-envelope"></i> info.colorlib@gmail.com</li>
		</ul>
	</div>
	<!-- Offcanvas Menu Section End -->

	<!-- Header Section Begin -->
	<header class="header-section header-normal">
		<div class="top-nav">
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<ul class="tn-left">
							<li><i class="fa fa-phone"></i> (12) 345 67890</li>
							<li><i class="fa fa-envelope"></i> info.colorlib@gmail.com</li>
						</ul>
					</div>
					<div class="col-lg-6">
						<div class="tn-right">
							<div class="top-social">
								<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
									class="fa fa-twitter"></i></a> <a href="#"><i
									class="fa fa-tripadvisor"></i></a> <a href="#"><i
									class="fa fa-instagram"></i></a>
							</div>
							<a href="#" class="bk-btn">Booking Now</a>
							<div class="language-option">
								<img
									src="${pageContext.request.contextPath}/resources/img/flag.jpg"
									alt=""> <span>EN <i class="fa fa-angle-down"></i></span>
								<div class="flag-dropdown">
									<ul>
										<li><a href="#">Zi</a></li>
										<li><a href="#">Fr</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="menu-item">
			<div class="container">
				<div class="row">
					<div class="col-lg-2">
						<div class="logo">
							<a href="./index.html"> <img
								src="${pageContext.request.contextPath}/resources/img/logo.png"
								alt="">
							</a>
						</div>
					</div>
					<div class="col-lg-10">
						<div class="nav-menu">
							<nav class="mainmenu">
								<ul>
									<li><a href="./index.html">Home</a></li>
									<li class="active"><a href="./rooms.html">Rooms</a></li>
									<li><a href="./about-us.html">About Us</a></li>
									<li><a href="./pages.html">Pages</a>
										<ul class="dropdown">
											<li><a href="./room-details.html">Room Details</a></li>
											<li><a href="./blog-details.html">Blog Details</a></li>
											<li><a href="#">Family Room</a></li>
											<li><a href="#">Premium Room</a></li>
										</ul></li>
									<li><a href="./blog.html">News</a></li>
									<li><a href="./contact.html">Contact</a></li>
								</ul>
							</nav>
							<div class="nav-right search-switch">
								<i class="icon_search"></i>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- Header End -->

	<!-- Breadcrumb Section Begin -->
	<div class="breadcrumb-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-text">
						<h2>방 상세정보</h2>
						<div class="bt-option">
							<a href="./home.html">Home</a> <span>Rooms</span>
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
		
		
		
<!-- 	<div class="flexslider"> -->
<!--   <ul class="slides"> -->
<%--     <c:forEach items="${roomdetail0}" begin="0" end="${roomdetail0.size()}"> --%>

<%--     <li data-thumb="slide${b+1}-thumb.jpg"> --%>
<%--        <img src="${roomdetail0.get(b).room_pic}"> --%>
<!--     </li> -->
   
<%--        <c:set var="b" value="${b=b+1 }"/> --%>
<%--   	</c:forEach> --%>
      
<!--     <li> -->
    
<!--   </ul> -->
<!-- </div>	 -->
		
 <div id="slideShow">
    <ul class="slides">
     <c:forEach items="${roomdetail0}" begin="0" end="${roomdetail0.size()}">
      <li><img src="${roomdetail0.get(b).room_pic}" style="width: 400px"></li>
      <c:set var="b" value="${b=b+1 }"/>
  	</c:forEach>
      
    </ul>
    <p class="controller">
      <!-- &lang: 왼쪽 방향 화살표 &rang: 오른쪽 방향 화살표 --> 
      <span class="prev">&lang;</span> 
      <span class="next">&rang;</span>
    </p>
  </div>
 
					
                        <div class="rd-text">
                            <div class="rd-title">
                                <h3> ${roomdetail.get(0).room_title}</h3>
                                <div class="rdt-right">
									<div class="rating">${roomdetail.get(0).room_star} 
										<i class="icon_star"></i> <i class="icon_star"></i> <i
											class="icon_star"></i> <i class="icon_star"></i> <i
											class="icon_star-half_alt"></i>
									&nbsp; <h5> 별점 :${roomdetail.get(0).room_star_num} 점</h5></div>
									
<!-- 									<a href="#">Booking Now</a> -->
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
						<div class="review-item">
							<div class="ri-pic">
								<img
									src="${pageContext.request.contextPath}/resources/img/room/avatar/avatar-1.jpg"
									alt="">
							</div>
							<div class="ri-text">
								<span>27 Aug 2019</span>
								<div class="rating">
									<i class="icon_star"></i> <i class="icon_star"></i> <i
										class="icon_star"></i> <i class="icon_star"></i> <i
										class="icon_star-half_alt"></i>
								</div>
								<h5>Brandon Kelley</h5>
								<p>${roomdetail.get(0).room_review}</p>
							</div>
						</div>
						<div class="review-item">
							<div class="ri-pic">
								<img
									src="${pageContext.request.contextPath}/resources/img/room/avatar/avatar-2.jpg"
									alt="">
							</div>
							<div class="ri-text">
								<span>27 Aug 2019</span>
								<div class="rating">
									<i class="icon_star"></i> <i class="icon_star"></i> <i
										class="icon_star"></i> <i class="icon_star"></i> <i
										class="icon_star-half_alt"></i>
								</div>
								<h5>Brandon Kelley</h5>
								<p>Neque porro qui squam est, qui dolorem ipsum quia dolor
									sit amet, consectetur, adipisci velit, sed quia non numquam
									eius modi tempora. incidunt ut labore et dolore magnam.</p>
							</div>
						</div>
					</div>
					<div class="review-add">
						<h4>Add Review</h4>
						<form action="#" class="ra-form">
							<div class="row">
								<div class="col-lg-6">
									<input type="text" placeholder="Name*">
								</div>
								<div class="col-lg-6">
									<input type="text" placeholder="Email*">
								</div>
								<div class="col-lg-12">
									<div>
										<h5>You Rating:</h5>
										<div class="rating">
											<i class="icon_star"></i> <i class="icon_star"></i> <i
												class="icon_star"></i> <i class="icon_star"></i> <i
												class="icon_star-half_alt"></i>
										</div>
									</div>
									<textarea placeholder="Your Review"></textarea>
									<button type="submit">Submit Now</button>
								</div>
							</div>
						</form>
					</div>
				</div>
                                        
            <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
                <script type="text/javascript">
              
                //최대 7박까지가능, 올바른 날짜 입력 유효성체크
                $(document).ready(function(){
            		
            		$('#reserveBtn').click(function(){
            			
            				//날짜 차이를 구하는 구간
            				function difference(date1, date2) {  
            				  const date1utc = Date.UTC(date1.getFullYear(), date1.getMonth(), date1.getDate());
            				  const date2utc = Date.UTC(date2.getFullYear(), date2.getMonth(), date2.getDate());
            				    day = 1000*60*60*24;
            				  return (date2utc - date1utc)/day
            				}
            				const date1 = new Date(document.getElementById("date-in").value);
            				const date2 = new Date(document.getElementById("date-out").value);
            			
            				const time_difference = difference(date1,date2)
							//날짜 차이를 구하는 구간	
            				
							
            				//체크아웃을 당일날짜로 고르는 경우 
            				function getFormatDate(date){
            				    var year = date.getFullYear();              //yyyy
            				    var month = (1 + date.getMonth());          //M
            				    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
            				    var day = (1+date.getDate());                   //d
            				    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
            				    return  year + '-' + month + '-' + day;
            				}
            				
            				var bate = getFormatDate(date2);
//             				alert(bate);
            				//체크아웃을 당일날짜로 고르는 경우 
            				
            				if(1 <= parseInt(time_difference) && parseInt(time_difference) <= 7){
            					dateForm.submit();
            				}else if(parseInt(time_difference) == 0){
            					document.getElementById("date-out").value=bate;
            					dateForm.submit();
            				}
            				else{
            					alert('올바른 날짜를 입력해주세요\n최대 7박까지 가능합니다.')
            					
            				}
            			
            		});// 버튼클릭 끝
            		
            		
            	});
                
                
                </script>
                <div class="col-lg-4">
                    <div class="room-booking">
                      <h3>  <a href="${pageContext.request.contextPath}/accomodation/roomPrice?bno=${bno}" id="reserveId">요금정보</a></h3>
                        <form action="${pageContext.request.contextPath}/accomodation/roomReserve" method="GET" name="dateForm">
                            <input type="hidden" name="bno" value="${bno}">
                            <input type="hidden" name="ano" value="${ano}">
                            <div class="check-date">
                                <label for="date-in">체크인</label>
                                <input type="text" class="date-input" id="date-in" value="${param.sel_date}" name="sel_date">
                                <i class="icon_calendar"></i>
                            </div>
                            <div class="check-date">
                                <label for="date-out">체크 아웃</label>
                                <input type="text" class="date-input" id="date-out" value="${param.sel_date2}" name="sel_date2">
                                <i class="icon_calendar"></i>
                            </div>
                            <button type="button" id="reserveBtn">예약하기</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Room Details Section End -->

    <!-- Footer Section Begin -->
    <footer class="footer-section">
        <div class="container">
            <div class="footer-text">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="ft-about">
                            <div class="logo">
                                <a href="#">
                                    <img src="${pageContext.request.contextPath}/resources/img/footer-logo.png" alt="">
                                </a>
                            </div>
                            <p>We inspire and reach millions of travelers<br /> across 90 local websites</p>
                            <div class="fa-social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-tripadvisor"></i></a>
                                <a href="#"><i class="fa fa-instagram"></i></a>
                                <a href="#"><i class="fa fa-youtube-play"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 offset-lg-1">
                        <div class="ft-contact">
                            <h6>Contact Us</h6>
                            <ul>
                                <li>(12) 345 67890</li>
                                <li>info.colorlib@gmail.com</li>
                                <li>856 Cordia Extension Apt. 356, Lake, United State</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 offset-lg-1">
                        <div class="ft-newslatter">
                            <h6>New latest</h6>
                            <p>Get the latest updates and offers.</p>
                            <form action="#" class="fn-form">
                                <input type="text" placeholder="Email">
                                <button type="submit"><i class="fa fa-send"></i></button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="copyright-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7">
                        <ul>
                            <li><a href="#">Contact</a></li>
                            <li><a href="#">Terms of use</a></li>
                            <li><a href="#">Privacy</a></li>
                            <li><a href="#">Environmental Policy</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-5">
                        <div class="co-text"><p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p></div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->

    <!-- Search model Begin -->
    <div class="search-model">
        <div class="h-100 d-flex align-items-center justify-content-center">
            <div class="search-close-switch"><i class="icon_close"></i></div>
            <form class="search-model-form">
                <input type="text" id="search-input" placeholder="Search here.....">
            </form>
        </div>
    </div>
    <!-- Search model end -->

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
</body>

</html>