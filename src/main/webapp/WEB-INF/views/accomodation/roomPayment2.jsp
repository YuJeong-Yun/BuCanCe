<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zxx">
<head>

<!-- <script type="text/javascript"> -->

<!-- history.replaceState({}, null, location.pathname); -->

<!-- </script> -->

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

<!--유의사항 팝업창  ........................................................................................... -->
<script src="http://wooshin.mireene.co.kr/g5/js/jquery-1.8.3.min.js"></script>
<style type="text/css">

/* a태그 (유의사항)  하이퍼링크 파랑색표시되는거 제거 */
A:link {
	text-decoration: none;
	color: #646464;
}

A:visited {
	text-decoration: none;
	color: #646464;
}

A:active {
	text-decoration: none;
	color: #646464;
}

A:hover {
	text-decoration: none;
	color: #646464;
}

/* 유의사항 클릭시 효과  */
#wrapper_popup div[id^='hd_pops_'] {
	width: 100%;
	margin: 10px;
	max-width: 500px;
	position: absolute;
	padding: 20px 30px;
	background: #fff;
	z-index: 100000;
	border-radius: 5px;
	overflow: auto;
	display: none
}

#wrapper_popup div[id^='hd_pops_'] h2 {
	display: block;
	margin: 10px 0 0;
	padding-bottom: 15px;
	border-bottom: 1px #d8d8d8 solid;
	font-size: 1.1em;
	font-weight: bold
}

#wrapper_popup div[id^='hd_pops_'] p {
	display: block;
	padding: 20px 0 0;
	margin: 0;
	font-size: 1.0em;
	line-height: 1.5em
}

#wrapper_popup div[id^='hd_pops_'] .hour-close {
	display: inline-block;
	padding: 8px 20px;
	background: #f2f2f2;
	color: #666;
	border: 1px #d8d8d8 solid;
	border-radius: 5px;
	margin-top: 15px
}

#wrapper_popup div[id^='hd_pops_'] .hour-close:hover {
	background: #54A94C;
	color: #f8f8f8
}

#wrapper_popup div[id^='hd_pops_'] img.cancel {
	position: absolute;
	right: 10px;
	top: 10px;
	zoom: 1;
	filter: alpha(opacity = 50);
	opacity: 0.7
}

#wrapper_popup div[id^='hd_pops_'] img.cancel:hover {
	zoom: 1;
	filter: alpha(opacity = 100);
	opacity: 1.0
}

#wrapper_popup .c1 {
	border: 1px #54A94C solid;
	border-bottom: 10px solid #54A94C
} /*green*/
#wrapper_popup .c2 {
	border: 1px #5390BC solid;
	border-bottom: 10px solid #5390BC
} /*blue*/
#wrapper_popup .c3 {
	border: 1px #FF969D solid;
	border-bottom: 10px solid #FF969D
} /*pink*/
#wrapper_popup .c4 {
	border: 1px #5B56A6 solid;
	border-bottom: 10px solid #5B56A6
} /*purple*/
#wrapper_popup .c5 {
	border: 1px #CCB7A2 solid;
	border-bottom: 10px solid #CCB7A2
} /*maroon*/
#wrapper_popup .b-area {
	width: 100%;
	text-align: right;
	margin-top: 20px;
	border-top: 1px #ccc solid
}

#wrapper_popup ul {
	list-style-type: disc;
	margin: 0 0 20px;
	line-height: 1.5em
}

#wrapper_popup .c-green {
	color: green !important
}

#wrapper_popup .c-blue {
	color: blue !important
}

#wrapper_popup .c-red {
	color: red !important
}

.layer-shadow {
	box-shadow: 0px 3px 15px 0px rgba(0, 0, 0, 0.74);
	-webkit-box-shadow: 0px 3px 15px 0px rgba(0, 0, 0, 0.74);
	-moz-box-shadow: 0px 3px 15px 0px rgba(0, 0, 0, 0.74);
}
</style>
<script type="text/javascript">
<!--
function dEI(elementID){
	return document.getElementById(elementID);
}
function openLayer(IdName, tpos, lpos){
	var pop = dEI(IdName);
	pop.style.top = tpos + "px";
	pop.style.left = lpos + "px";
	pop.style.display = "block";
}
function closeLayer( IdName ){
	var pop = dEI(IdName);
	pop.style.display = "none";
}
//-->
</script>
<!--유의사항 팝업창  ........................................................................................... -->






<style>
/* 서명란 클릭시 테두리(blue) 강조 효과  */
input[type=text] {
	width: 100%;
	border: 2px solid #aaa;
	border-radius: 2px;
	margin: 4px 0;
	outline: none;
	padding: 4px;
	box-sizing: border-box;
	transition: .3s;
}

input[type=text]:focus {
	border-color: dodgerBlue;
	box-shadow: 0 0 8px 0 dogerBlue;
}
</style>
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
						<h2>결제 페이지</h2>
						<div class="bt-option">
							<a
								href="${pageContext.request.contextPath}/accomodation/roomList">Home</a>
							<span>결제페이지</span>
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
						<img src="${vo.room_pic}" alt="" height="300" width="500"
							style="border: solid gray; box-shadow: 5px 5px 5px 5px gray; border-radius: 10px;">
						<div class="rd-text">
							<div class="rd-title">
								<h3>${vo.room_title}</h3>
								<div class="rdt-right"></div>
							</div>
							
							<table>
								<tbody>
									<tr>
										<td class="r-o">예약명 <input type="text" placeholder="서명란"
											value="${user_name}" style="border-radius: 10px;"></td>
										<td><br> <br></td>
									</tr>
									<tr>
										<td><br></td>
									</tr>
									<tr>
										<td class="r-o">결제수단</td>
									</tr>

									<tr>
										<td><select id="payment-select" class="select_type_1"
											style="border-radius: 10px;">
												<option value="kakaopay">카카오페이</option>
												<option value="tosspay">토스</option>
												<option value="html5_inicis" selected="selected">신용/체크카드</option>
												<option value="payco">PAYCO</option>
												<option value="danal_tpay">휴대폰결제</option>
										</select>></td>
									</tr>
								</tbody>
							</table>


							<p class="f-para">
							<hr>
							<section class="agree">
								<p class="all_check">
									<label><input type="checkbox" name="checkAll"
										value="selectAll" onclick="selectAll(this)" class="inp_chk_02">
										<span><b>전체 동의</b style="color: red"></span></label>
								</p>
								<p>
									<input type="checkbox" name="checkOne" class="inp_chk_02"
										id="checkOne"><i> <a href="javascript:void(0)"
										onclick="openLayer('hd_pops_1',500,500)"><u>숙소이용규칙 및
												취소/환불규정 동의</a></i><b style="color: red"> (필수)</u></b>
								</p>
								<p>
									<input type="checkbox" name="checkOne" class="inp_chk_02"
										id="checkTwo"> <span onclick="pop_agree_02();"><i><a
											href="javascript:void(0)"
											onclick="openLayer('hd_pops_2',540,540)"><u>개인정보 수집 및
													이용 동의</a></i><b style="color: red"> (필수)</b></span></u>
								</p>
								<p>
									<input type="checkbox" name="checkOne" class="inp_chk_02"
										id="checkThree"> <span onclick="pop_agree_03();"><i><a
											href="javascript:void(0)"
											onclick="openLayer('hd_pops_3',570,270)"><u>개인정보 제 3자
													제공 동의</a></i><b style="color: red"> (필수)</b></span></u>
								</p>

								<p>
									<input type="checkbox" name="checkOne" class="inp_chk_02"
										id="checkFour"> <span onclick="pop_agree_04();"><i><a
											href="javascript:void(0)"
											onclick="openLayer('hd_pops_4',600,600)"><u>만 14세 이상
													확인</a></i><b style="color: red"> (필수)</b></span></u>
								</p>
							</section>

						</div>
					</div>
				</div>



				<!-- 팝업내용 -->
				<div id="wrapper_popup">
					<div id="hd_pops_1" class="c1 layer-shadow">
						<!-- 이 아래부터 레이어팝업 본문 -->
						<h2>숙소이용규칙 및 취소/환불 규정(필수)</h2>
						<p>
						<div class="txt">
							<strong>이용규칙</strong>
							<p></p>
							<ul class="dot_txt">
								<li>객실요금은 2인 기준이며, 파티룸 등 대형객실의 경우 입실 인원은 숙소에 문의해주세요. (3인이상
									혼숙불가)</li>
								<li>미성년자 혼숙은 법적으로 불가하며, 이에 대한 숙소의 입실 거부 시 취소/환불이 불가합니다.</li>
								<li>미성년자 예약에 대한 숙소의 입실 거부 시 취소/환불이 불가하오니, 예약 전 반드시 숙소에
									확인하시기 바랍니다.</li>
								<li>업체 현장에서 객실 컨디션 및 서비스로 인해 발생된 분쟁은 여기어때에서 책임지지 않습니다.</li>
							</ul>
							<p></p>
							<strong>취소/환불규정</strong>
							<p></p>
							<ul class="dot_txt">
								<li>취소 및 환불이 불가한 숙소입니다.</li>
								<li>숙소 사정에 의해 취소 발생 시 100% 환불이 가능합니다.</li>
								<li>모텔은 예약 후 15분 이내 고객행복센터로 취소 요청 시 100% 환불 가능합니다.</li>
							</ul>
						</div>


						<!-- 이 위까지 레이어팝업 본문 -->
						<div class="b-area"></div>
						<a href="javascript:void(0)" onclick="closeLayer('hd_pops_1')"><img
							class="cancel"
							src="${pageContext.request.contextPath}/resources/img/cancel2.png"></a>
					</div>


					<div id="hd_pops_2" class="c2 layer-shadow">
						<!-- 이 아래부터 레이어팝업 본문 -->
						<h2>개인정보 수집 및 이용 동의(필수)</h2>
						<p>
						<div class="scroller"
							style="transform: translate(0px, 0px) translateZ(0px);">
							<div class="txt">
								<table border="1" class="pop_table">
									<tbody>
										<tr>
											<th>구분</th>
											<th>수집/이용 목적</th>
											<th>수집 항목</th>
											<th>보유·이용기간</th>
										</tr>
										<tr>
											<td>필수</td>
											<td>예약/결제 서비스 이용</td>
											<td>- 예약서비스이용: <br>예약자 이름,휴대폰 번호, CI<br> <br>
												- 결제서비스이용: <br> (카드 결제 시) <br>카드사명,카드번호,유효기간,이메일<br>
												(휴대폰 결제 시)<br> 휴대폰 번호, 통신사, 결제 승인번호<br> (계좌이체 시)<br>
												은행명, 계좌번호, 예금주<br> (현금 영수증 발급 시)<br> 휴대폰 번호, 이메일<br>
												( 취소·환불을 위한 대급지급 요청 시)<br> 은행명, 계좌번호, 예금주명<br> <br>
												<div>
													- 서비스 이용: <br> 서비스 이용시간/이용기록, 접수로그, 이용컨텐츠, 접속IP정보,
													기기모델명, 브라우저 정보
												</div></td>
											<td><b><i>전자상거래 상 소비자 보호에 관한 법률에 따라 5년간 보관</i></b></td>
										</tr>
									</tbody>
								</table>
								<p></p>
								<ul class="dot_txt">
									<li>※ 위 동의 내용을 거부하실 수 있으나, 동의를 거부하실 경우 서비스를 이용하실 수 없습니다.</li>
									<li>※ 개인정보 처리와 관련된 상세 내용은 '개인정보처리방침'을 참고</li>
								</ul>
							</div>
						</div>


						<!-- 이 위까지 레이어팝업 본문 -->
						<div class="b-area"></div>
						<a href="javascript:void(0)" onclick="closeLayer('hd_pops_2')"><img
							class="cancel"
							src="${pageContext.request.contextPath}/resources/img/cancel2.png"></a>
					</div>

					<div id="hd_pops_3" class="c3 layer-shadow">
						<!-- 이 아래부터 레이어팝업 본문 -->
						<h2>개인정보 제 3자 제공 동의(필수)</h2>
						<p>
						<div class="scroller"
							style="transform: translate(0px, 0px) translateZ(0px);">
							<div class="txt">
								<table border="1" class="pop_table">
									<tbody>
										<tr>
											<th style="width: 25%;">제공받는 자</th>
											<th style="width: 25%;">제공 목적</th>
											<th style="width: 25%;">제공하는 항목</th>
											<th style="width: 25%;">제공받는 자의 개인정보 보유 및 이용기간</th>
										</tr>
										<tr>
											<td><b>${vo.room_title} 호텔</b></td>
											<td><b>숙박예약서비스 이용계약 이행<br>(서비스 제공, 확인, 이용자 정보
													확인)
											</b></td>
											<td>예약한 숙박서비스의 이용자 정보(예약자 이름, 휴대폰번호, 예약번호, 예약한 업체명, 예약한
												객실명, 결제금액)</td>
											<td><b>예약서비스 제공 완료 후 6개월</b></td>
										</tr>
										<!---->
										<!---->
									</tbody>
								</table>
								<p></p>
								<ul class="dot_txt">
									<li>※ 위 동의 내용을 거부하실 수 있으나, 동의를 거부하실 경우 서비스를 이용하실 수 없습니다.</li>
									<li>※ 개인정보 처리와 관련된 상세 내용은 '개인정보처리방침'을 참고</li>
								</ul>
							</div>
						</div>
						<!-- 이 위까지 레이어팝업 본문 -->
						<div class="b-area"></div>
						<a href="javascript:void(0)" onclick="closeLayer('hd_pops_3')"><img
							class="cancel"
							src="${pageContext.request.contextPath}/resources/img/cancel2.png"></a>
					</div>

					<div id="hd_pops_4" class="c4 layer-shadow">
						<!-- 이 아래부터 레이어팝업 본문 -->
						<h2>만 14세 이상 확인(필수)</h2>
						<div class="txt">
							<p class="subtitle">
								<strong>부캉스(BuCanCe)</strong>는 <b>만 14세 미만 아동</b>의 <b>서비스
									이용을 제한</b>하고 있습니다.
							</p>
							<p>
								정보통신망 이용촉진 및 정보보호 등에 관한 법률에는 만 14세 미만 아동의 개인정보 수집 시 법정대리인 동의를
								받도록 규정하고 있으며, <i>만 14세 미만 아동이 법정대리인 동의없이 서비스 이용이 확인된 경우 서비스
									이용이 제한될 수 있음을 알려드립니다.</i>
							</p>
						</div>


						<!-- 이 위까지 레이어팝업 본문 -->
						<div class="b-area"></div>
						<a href="javascript:void(0)" onclick="closeLayer('hd_pops_4')"><img
							class="cancel"
							src="${pageContext.request.contextPath}/resources/img/cancel2.png"></a>
					</div>


				</div>

				<!-- 팝업내용 -->






				<!-- 아임포트 -->
				<script type="text/javascript"
					src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
				<script type="text/javascript"
					src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
			          merchant_uid: "${accId}",  //고유 id
			          name: '${vo.room_title}',  //상품이름
// 			          amount: '${vo.room_fcost}', //가격
			          amount: 100, //가격
			          buyer_email: "${email}",
			          buyer_name: "${user_name}",
			          buyer_tel: "${tel}",
			          buyer_addr: "${address1}",
			          buyer_postcode: "${zip}",
			      }, function (rsp) { // callback
			          if (rsp.success) {
			        	// http://localhost:8088/accomodation/roomList
			              // 결제 성공 시 로직,
			             alert('결제성공');
			             $.ajax({
			 				type:"GET",
			 				url :"${pageContext.request.contextPath}/accomodation/roomPayDB",
			 				data : {
			 					accId: "${accId}",  //고유 id
			 					accKind: $("#payment-select option:selected").val(),
			 					accName: '${vo.room_title}',  //상품이름
// 						        amount: '${vo.room_fcost}', //가격
						        accAmount: 100, //가격
						        email: "${email}",
						        user_name: "${user_name}",
						        tel: "${tel}",
						        address1: "${address1}",
						        zip: "${zip}",
						        id : "${id}",
						        sort : "acc",
						        roomSort : "${vo.room_subTitle}",
						        endTime : "${vo.accendtime}",
						        useTime : "${vo.accusetime}",
						        checkIn : "${vo.checkin}",
						        checkOut : "${vo.checkout}",
						        license : "${license}"
			 				},
			 				contentType: "application/json",
			 				success : function(data){
			 					alert('성공');
			 					
			 					
			 				}
			 			
			 			}); //ajax끝
			 			
			              //결제내역페이지로이동
			             location.href= "${pageContext.request.contextPath}/accomodation/roomReComplete?accId="+"${accId}";	
			          } else {
			         	
			              // 결제 실패 시 로직, 뒤로가기
			              alert('결제실패');
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
					<div class="room-booking"
						style="border: solid gray; box-shadow: 5px 5px 5px 5px gray; background-color: #FAFAFA; border-radius: 10px;">
						<p></p>
						<h3><b>결제 정보</b></h3>
						<form onSubmit="return false;">
							<!-- 뒤로가기 할 주소 -->
							<input type="hidden" value="<%=request.getHeader("REFERER")%>"
								id="reload">
							<!-- 뒤로가기 할 주소 -->
							<div class="check-date">
								<label for="date-out"><b>호텔명</b></label> <input type="text"
									id="date-out" value="${vo.room_title}" readonly
									style="font-weight: bold;"> <i class=""></i>
							</div>
							<div class="check-date">
								<label for="date-in"><b>입실시간</b></label> <input type="text"
									id="date-in" readonly
									value="${vo.checkin } &nbsp;  ${vo.room_endtime} 시까지"
									style="font-weight: bold;"> <i class="icon_calendar"></i>
							</div>

							<div class="check-date">
								<label for="date-out">퇴실시간</label> <input type="text"
									id="date-out" readonly
									value="${vo.checkout} &nbsp; ${vo.room_usetime} 시까지"
									style="font-weight: bold;"> <i class="icon_calendar"></i>
							</div>

							<div class="check-date">
								<label for="date-out">서명:</label> <input type="text"
									value=${user_name } id="date-out" style="font-weight: bold;">
								<i class=""></i>
							</div>
							<div class="check-date">

								<c:if test="${license==0}">
									<label for="date-out"><strong>총 결제 금액 (VAT포함)</strong></label>
									<input type="text" id="date-out" value="${vo.room_fcost} 원"
										readonly style="font-weight: bold; font-size: 20px">
								</c:if>

								<c:if test="${license==1}">
									<label for="date-out"><strong style="color: red">총
											결제 금액 (멤버쉽 할인, VAT포함)</strong></label>
									<input type="text" id="date-out"
										value="<fmt:formatNumber type="number" maxFractionDigits="0"  value="${vo.room_fcost*0.9}" /> 원"
										style="color: red; font-weight: bold; font-size: 20px"
										readonly>
								</c:if>
								<i class=""></i>
								<p></p>
								<ul>
									<li>해당 객실가는 세금, 봉사료가 포함된 금액입니다</li>
									<li>결제완료 후 예약자 이름으로 바로 체크인 하시면 됩니다</li>
								</ul>
							</div>


							<button type="button" onclick="requestPay()"
								class="btn btn-primary"
								style="border: solid white; box-shadow: 5px 5px 5px 5px gray; border-radius: 10px;">
								<span style="color: black"><b>결제하기</b></span>
							</button>

							<button type="button" onclick="cancelPay()"
								class="btn btn-block btn-danger btn-lg"
								style="border: solid white; box-shadow: 5px 5px 5px 5px gray; border-radius: 10px;">
								<span style="color: black"><b>취소하기</b></span>
							</button>
							<p></p>
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