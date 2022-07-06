<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Sona Template">
<meta name="keywords" content="Sona, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sona | Template</title>
<script>

function selectAll(selectAll)  {
	  const checkboxes 
	       = document.getElementsByName('checkOne');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked;
	  })
	}//약관 모두선택 
	
	/* 숙소이용규칙 및 취소/환불규정 Iscroll */
	var iscroll_policy; // 지역카테고리

	function iscroll_run_policy01() {
	    iscroll_policy = new IScroll('.pop_agree_01 .fix_cont', {
	        mouseWheel: true,
	        interactiveScrollbars: true,
	        shrinkScrollbars: 'scale',
	        fadeScrollbars: true,
	        click: true
	    });
	}

	function pop_agree_01() {
	    // 숙소이용규칙 및 취소/환불규정 동의
	    prevent_on();
	    prevent_scroll();
	    $('.pop_agree_01').fadeIn(150);
	    $('.bg_dimm').fadeIn(150);
	    iscroll_run_policy01(); // iscroll
	    $('.fix_title').bind('touchmove', function (i) {
	        i.preventDefault();
	    }); // 타이틀 터치 방지
	}

	/* 개인정보 제 3자 제공 Iscroll */
	var iscroll_policy_02; // 지역카테고리

	function iscroll_run_policy02() {
	    iscroll_policy_02 = new IScroll('.pop_agree_02 .fix_cont', {
	        mouseWheel: true,
	        interactiveScrollbars: true,
	        shrinkScrollbars: 'scale',
	        fadeScrollbars: true,
	        click: true
	    });
	}

	function pop_agree_02() {
	    // 개인정보 수집 및 이용동의 팝업
	    prevent_on();
	    prevent_scroll();
	    $('.pop_agree_02').fadeIn(150);
	    $('.bg_dimm').fadeIn(150);
	    iscroll_run_policy02(); // iscroll
	    $('.fix_title').bind('touchmove', function (i) {
	        i.preventDefault();
	    }); // 타이틀 터치 방지
	}

	function pop_agree_03() {
	    // 개인정보 제 3자 제공 동의 팝업
	    prevent_on();
	    prevent_scroll();
	    $('.pop_agree_03').fadeIn(150);
	    $('.bg_dimm').fadeIn(150);
	    // iscroll_run_policy02(); // iscroll
	    $('.fix_title').bind('touchmove', function (i) {
	        i.preventDefault();
	    }); // 타이틀 터치 방지

	    new IScroll('.pop_agree_03 .fix_cont', {
	        mouseWheel: true,
	        interactiveScrollbars: true,
	        shrinkScrollbars: 'scale',
	        fadeScrollbars: true,
	        click: true
	    });
	}

	function pop_agree_04() {
	    // 만 14세 이상 확인
	    prevent_on();
	    prevent_scroll();
	    $('.pop_agree_04').fadeIn(150);
	    $('.bg_dimm').fadeIn(150);
	    // iscroll_run_policy02(); // iscroll
	    $('.fix_title').bind('touchmove', function (i) {
	        i.preventDefault();
	    }); // 타이틀 터치 방지
	}

	
	
	
	
</script>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
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
						<h2>Our Rooms</h2>
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
				<div class="col-lg-8">
					<div class="room-details-item">
						<img
							src="${pageContext.request.contextPath}${roomReserve.get(a).room_pic}"
							alt="">
						<div class="rd-text">
							<div class="rd-title">
								<h3>Premium King Room</h3>
								<div class="rdt-right">
									<div class="rating">
										<i class="icon_star"></i> <i class="icon_star"></i> <i
											class="icon_star"></i> <i class="icon_star"></i> <i
											class="icon_star-half_alt"></i>
									</div>
									<a href="#">Booking Now</a>
								</div>
							</div>
						
							<table>
								<tbody>
									
									<tr>
									
										<td class="r-o">서명 <input type="text" placeholder="이름을 입력해주세요"></td>
										<td><br> <br></td>
									</tr>
										<tr>
										<td> <br></td>
									</tr>
									<tr>
										<td class="r-o">결제수단</td>
									</tr>

									<tr>
										<td><select id="payment-select" class="select_type_1"
											data-v-f785cca6=""><option data-minprice="0"
													value="KAKAO" data-v-f785cca6="">카카오페이</option>
												<option data-minprice="0" value="TOSS" data-v-f785cca6="">
													토스</option>
												<option data-minprice="0" selected="selected" value="CARD"
													data-v-f785cca6="">신용/체크카드</option>
												<option data-minprice="0" value="NAVER" data-v-f785cca6="">
													네이버페이</option>
												<option data-minprice="0" value="PAYCO" data-v-f785cca6="">
													PAYCO</option>
												<option data-minprice="0" value="CARD_BIZ"
													data-v-f785cca6="">법인카드</option>
												<option data-minprice="0" value="CELLPHONE"
													data-v-f785cca6="">휴대폰결제</option></select></td>
									</tr>
								</tbody>
							</table>


							<p class="f-para">
							<hr>
							<section class="agree" data-v-d63b628c="" data-v-f785cca6="">
								<p class="all_check" data-v-d63b628c="">
									<label data-v-d63b628c=""><input type="checkbox"
										name="checkAll" value="selectAll" onclick="selectAll(this)"
										class="inp_chk_02" data-v-d63b628c=""> <span
										data-v-d63b628c="">전체 동의</span></label>
								</p>
								<p data-v-d63b628c="">
									<input type="checkbox" name="checkOne" class="inp_chk_02"
										data-v-d63b628c=""> <span onclick="pop_agree_01();"
										data-v-d63b628c=""><i data-v-d63b628c="">숙소이용규칙 및
											취소/환불규정 동의</i><b data-v-d63b628c=""> (필수)</b></span>
								</p>
								<p data-v-d63b628c="">
									<input type="checkbox" name="checkOne" class="inp_chk_02"
										data-v-d63b628c=""> <span onclick="pop_agree_02();"
										data-v-d63b628c=""><i data-v-d63b628c="">개인정보 수집 및
											이용 동의</i><b data-v-d63b628c=""> (필수)</b></span>
								</p>
								<p data-v-d63b628c="">
									<input type="checkbox" name="checkOne" class="inp_chk_02"
										data-v-d63b628c=""> <span onclick="pop_agree_03();"
										data-v-d63b628c=""><i data-v-d63b628c="">개인정보 제 3자
											제공 동의</i><b data-v-d63b628c=""> (필수)</b></span>
								</p>
								<p class="guest_chk_area" data-v-d63b628c="">
									<input type="checkbox" name="checkOne" class="inp_chk_02"
										data-v-d63b628c=""> <span onclick="pop_agree_04();"
										data-v-d63b628c=""><i data-v-d63b628c="">만 14세 이상
											확인</i><b data-v-d63b628c=""> (필수)</b></span>
								</p>
							</section>

						</div>
					</div>

				</div>
				<div class="col-lg-4">
					<div class="room-booking">
						<h3>결제 정보</h3>
						<form action="#">
							<div class="check-date">
								<label for="date-out">호텔명:</label> <input type="text"
									id="date-out" value="${roomReserve.get(a).room_title}"> <i class=""></i>
							</div>
							<div class="check-date">
								<label for="date-in">입실일자:</label> <input type="text"
									id="date-in"> <i class="icon_calendar"></i>
									
									
									 <c:if test='${roomReserve.get(a).room_lcost != "1"}'>
                                        ${roomReserve.get(a).room_accendtime}시/
                                        ${checkout}일
                                          ${roomReserve.get(a).room_accusetime}시
                                        </c:if>
                                         <c:if test='${roomReserve.get(a).room_lcost == "1"}'>
                                       숙소에 문의
                                       
                                        </c:if>
									
									
									
							</div>
							<div class="check-date">
								<label for="date-out">퇴실일자:</label> <input type="text"
									id="date-out"> <i class="icon_calendar"></i>
							</div>
							<div class="check-date">
								<label for="date-out">서명:</label> <input type="text"
									id="date-out"> <i class=""></i>
							</div>
							<div class="check-date">
								<label for="date-out"><strong>총 결제 금액</strong></label> 
								<input type="text" id="date-out" > <i class=""></i>
							
									<c:if test="${roomReserve.get(a).room_reserve2 != 1 }">
									
                                        ${fn:substring(roomReserve.get(a).room_reserve2,0,roomReserve.get(a).room_reserve2.length()-1)} 원
									</c:if>
									<c:if test="${roomReserve.get(a).room_reserve2 == 1}">
                                        숙소에 문의
									</c:if>
                                  
							</div>


							<button type="submit">결제하기</button>
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
								<a href="#"> <img
									src="${pageContext.request.contextPath}/resources/img/footer-logo.png"
									alt="">
								</a>
							</div>
							<p>
								We inspire and reach millions of travelers<br /> across 90
								local websites
							</p>
							<div class="fa-social">
								<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
									class="fa fa-twitter"></i></a> <a href="#"><i
									class="fa fa-tripadvisor"></i></a> <a href="#"><i
									class="fa fa-instagram"></i></a> <a href="#"><i
									class="fa fa-youtube-play"></i></a>
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
								<button type="submit">
									<i class="fa fa-send"></i>
								</button>
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
						<div class="co-text">
							<p>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;
								<script>
									document.write(new Date().getFullYear());
								</script>
								All rights reserved | This template is made with <i
									class="fa fa-heart" aria-hidden="true"></i> by <a
									href="https://colorlib.com" target="_blank">Colorlib</a>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer Section End -->

	<!-- Search model Begin -->
	<div class="search-model">
		<div class="h-100 d-flex align-items-center justify-content-center">
			<div class="search-close-switch">
				<i class="icon_close"></i>
			</div>
			<form class="search-model-form">
				<input type="text" id="search-input" placeholder="Search here.....">
			</form>
		</div>
	</div>
	<!-- Search model end -->

	<!-- Js Plugins -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.nice-select.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.slicknav.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>

</html>