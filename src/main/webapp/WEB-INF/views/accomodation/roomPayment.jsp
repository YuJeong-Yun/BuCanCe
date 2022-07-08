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
<script>

function selectAll(selectAll)  {
	  const checkboxes 
	       = document.getElementsByName('checkOne');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked;
	  })
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
						<div class="bt-option">
							<a href="${pageContext.request.contextPath}/accomodation/roomList">Home</a> <span>결제페이지</span>
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
						<img src="${vo.room_pic}" alt="" width="400">
						<div class="rd-text">
							<div class="rd-title">
								<h3>${vo.room_title}</h3>
								<div class="rdt-right">
									
									
								</div>
							</div>
						
							<table>
								<tbody>
									
									<tr>
									
										<td class="r-o">예약명 <input type="text" placeholder="이름을 입력해주세요"
											value="${username}"
										></td>
										<td><br> <br></td>
									</tr>
										<tr>
										<td> <br></td>
									</tr>
									<tr>
										<td class="r-o">결제수단</td>
									</tr>

									<tr>
										<td><select id="payment-select" class="select_type_1" data-v-f785cca6="">
										<option data-minprice="0" value="kakaopay" data-v-f785cca6="">
										카카오페이</option>
										<option data-minprice="0" value="tosspay" data-v-f785cca6="">
										토스</option>
										<option data-minprice="0" value="html5_inicis"  selected="selected"  data-v-f785cca6="">
										신용/체크카드</option>
										<option data-minprice="0" value="payco" data-v-f785cca6="">
										PAYCO</option>
										<option data-minprice="0" value="danal_tpay" data-v-f785cca6="">
										휴대폰결제</option></select></td>
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
									<input type="checkbox" name="checkOne" class="inp_chk_02" id="checkOne"
										data-v-d63b628c=""> <span onclick="pop_agree_01();"
										data-v-d63b628c=""><i data-v-d63b628c="">숙소이용규칙 및
											취소/환불규정 동의</i><b data-v-d63b628c=""> (필수)</b></span>
								</p>
								<p data-v-d63b628c="">
									<input type="checkbox" name="checkOne" class="inp_chk_02" id="checkTwo"
										data-v-d63b628c=""> <span onclick="pop_agree_02();"
										data-v-d63b628c=""><i data-v-d63b628c="">개인정보 수집 및
											이용 동의</i><b data-v-d63b628c=""> (필수)</b></span>
								</p>
								<p data-v-d63b628c="">
									<input type="checkbox" name="checkOne" class="inp_chk_02" id="checkThree"
										data-v-d63b628c=""> <span onclick="pop_agree_03();"
										data-v-d63b628c=""><i data-v-d63b628c="">개인정보 제 3자
											제공 동의</i><b data-v-d63b628c=""> (필수)</b></span>
								</p>
								<p class="guest_chk_area" data-v-d63b628c="">
									<input type="checkbox" name="checkOne" class="inp_chk_02" id="checkFour"
										data-v-d63b628c=""> <span onclick="pop_agree_04();"
										data-v-d63b628c=""><i data-v-d63b628c="">만 14세 이상
											확인</i><b data-v-d63b628c=""> (필수)</b></span>
								</p>
							</section>

						</div>
					</div>

				</div>
				
				
				<!-- 아임포트 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">

		var IMP = window.IMP; // 생략 가능
		IMP.init("imp49919207"); // 예: imp00000000

		
	    function requestPay() {
			
			if(!$('#checkOne').is(':checked')){
				alert('숙소이용규칙 및 취소/환불규정에 동의가 필요합니다.');
				
			}else if(!$('#checkTwo').is(':checked')){
				alert('개인정보 수집 및 이용 동의가 필요합니다.');
			}
			else if(!$('#checkThree').is(':checked')){
				alert('개인정보 제 3자 제공 동의가 필요합니다.');
			}
			else if(!$('#checkFour').is(':checked')){
				alert('만 14세 이상의 확인이 필요합니다.');
			}else{
				alert('결제를 시작합니다.');
				   // IMP.request_pay(param, callback) 결제창 호출
			      IMP.request_pay({ // param
			    	  pg: $("#payment-select option:selected").val(),
// 			          pay_method: "card",
			          merchant_uid: "${priId}",  //고유 id
			          name: '${vo.room_title}',  //상품이름
// 			          amount: '${vo.room_fcost}', //가격
			          amount: 1, //가격
			          buyer_email: "${useremail}",
			          buyer_name: "${username}",
			          buyer_tel: "${usertel}",
			          buyer_addr: "${userAddress}",
			          buyer_postcode: "${userPostCode}"
			      }, function (rsp) { // callback
			          if (rsp.success) {
			             
			              // 결제 성공 시 로직,
			             alert('결제성공');
			             $.ajax({
			 				type:"GET",
			 				url :"${pageContext.request.contextPath}/accomodation/roomPaymentDB",
			 				data : {
			 					pg: $("#payment-select option:selected").val(),
			 					merchant_uid: "${priId}",  //고유 id
						        name: '${vo.room_title}',  //상품이름
// 						        amount: '${vo.room_fcost}', //가격
						        amount: 1, //가격
						        buyer_email: "${useremail}",
						        buyer_name: "${username}",
						        buyer_tel: "${usertel}",
						        buyer_addr: "${userAddress}",
						        buyer_postcode: "${userPostCode}"
			 				},
			 				contentType: "application/json",
			 				success : function(data){
			 					
			 				}
			 				
			 				
			 			}); //ajax끝
			              
			              
			          } else {
			         	
			              // 결제 실패 시 로직, 뒤로가기
			              alert('결제실패');
<%-- 			              alert(<%=request.getHeader("REFERER")%>); --%>
			              
			              //결제 실패시 뒤로가기
			              location.href=document.getElementById("reload").value;
			          }
			      });
			}
			
			
	   
	    }

		
		
		
	    function cancelPay() {
	    	
	    	alert('예약목록창으로 이동');
	    	location.href=document.getElementById("reload").value;
	    	
	    }
		
		
</script>
	<!-- 아임포트 -->
				
				
				
				<div class="col-lg-4">
					<div class="room-booking">
						<h3>결제 정보</h3>
						<form onSubmit="return false;">
						<!-- 뒤로가기 할 주소 -->
						<input type="hidden" value="<%=request.getHeader("REFERER")%>" id="reload">
						<!-- 뒤로가기 할 주소 -->
							<div class="check-date">
								<label for="date-out">호텔명:</label> 
								<input type="text" id="date-out"
								value="${vo.room_title}" readonly
								> <i class=""></i> 
							</div>
							<div class="check-date">
								<label for="date-in">마감시간:</label>
								 <input type="text"id="date-in" readonly
								value="당일 ${vo.room_endtime} 시까지"
								> <i class="icon_calendar"></i>
							</div>
							
							<div class="check-date">
								<label for="date-out">이용시간:</label> 
								<input type="text"id="date-out" readonly
								value="${vo.room_usetime} 시간"
								
								> <i class="icon_calendar"></i>
							</div>
							
							<div class="check-date">
								<label for="date-out">서명:</label> <input type="text"
								value=${username }
								
									id="date-out"> <i class=""></i>
							</div>
							<div class="check-date">
								<label for="date-out"><strong>총 결제 금액</strong></label> 
								<input type="text" id="date-out"
								value="${vo.room_fcost} 원" readonly> <i class=""></i>
							</div>


							<button type="button" onclick="requestPay()">결제하기</button>
							
							<button type="button" onclick="cancelPay()">취소하기</button>
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