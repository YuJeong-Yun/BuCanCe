<%@page import="com.bcc.persistence.MemberDAO"%>
<%@page import="org.springframework.stereotype.Service"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Sona Template">
    <meta name="keywords" content="Sona, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sona | Template</title>
    
    <style type="text/css">
    @import url("https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css");
	@import url("https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css");
    </style>
    
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Lora:400,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
    
    <!-- Google Chart -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    

    <!-- Css Styles -->
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/hyejin.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/yd.css" type="text/css">

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
        <div class="search-icon  search-switch">
            <i class="icon_search"></i>
        </div>
        <div class="header-configure-area">
            <div class="language-option">
                <img src="${pageContext.request.contextPath}/resources/img/flag.jpg" alt="">
                <span>EN <i class="fa fa-angle-down"></i></span>
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
                <li class="active"><a href="./index.html">NOTICE</a>
                   <ul class="dropdown">
                        <li><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                    </ul>
                </li>
                <li><a href="./rooms.html">TOUR</a>
	                <ul class="dropdown">
                        <li><a href="#">TourList</a></li>
                        <li><a href="#">Reviews</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
	                    </ul>
	                </li>
                <li><a href="./about-us.html">HOTEL</a>
	                <ul class="dropdown">
                        <li><a href="${pageContext.request.contextPath }/accomodation/roomList">인기숙소</a></li>
                        <li><a href="${pageContext.request.contextPath }/accomodation/roomReList">예약내역</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
	                    </ul>
	                </li>
                <li><a href="./pages.html">PLAN</a>
                    <ul class="dropdown">
                        <li><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="top-social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-tripadvisor"></i></a>
            <a href="#"><i class="fa fa-instagram"></i></a>
        </div>

<!-- 로그인 / 회원가입 / 로그아웃 -->

<%
	String id = null;
	if(session.getAttribute("id")!=null){
	id = (String)session.getAttribute("id");
}
	if(id==null){
%>
	<div id="login">
	<a href="/login">LOGIN</a> | 
	<a href="/insert">JOIN</a>
	</div>

<%	
	}else{ %>
	

	<div id="login">
	<%=id%>님 로그인 중입니다!!
	<a href="/mypage?id=<%=id %>">MYPAGE</a>
	<a href="/logout">LOGOUT</a>
	</div>
<%		
	}
%>
	
<!-- 로그인 / 회원가입 / 로그아웃 -->	

        <ul class="top-widget">
            <li><i class="fa fa-phone"></i> (12) 345 67890</li>
            <li><i class="fa fa-envelope"></i> info.colorlib@gmail.com</li>
        </ul>
    </div>
    <!-- Offcanvas Menu Section End -->

    <!-- Header Section Begin -->
    <header class="header-section">
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
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-tripadvisor"></i></a>
                                <a href="#"><i class="fa fa-instagram"></i></a>
                            </div>
                            
<!-- 로그인 / 회원가입 / 로그아웃 -->

<%

	if(id==null){
%>
	<div id="login">
	<a href="/login">LOGIN</a> | 
	<a href="/insert">JOIN</a>
	</div>

<%	
	}else{ %>
	

	<div id="login">
	<%=id%>님 로그인 중입니다!!
	<a href="/mypage?id=<%=id %>">MYPAGE</a>
	<a href="/logout">LOGOUT</a>
	</div>
<%		
	}
%>
	
<!-- 로그인 / 회원가입 / 로그아웃 -->	


                            <a href="#" class="bk-btn">Booking Now</a>
                            <div class="language-option">
                                <img src="${pageContext.request.contextPath}/resources/img/flag.jpg" alt="">
                                <span>EN <i class="fa fa-angle-down"></i></span>
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
                            <a href="./index.html">
                                <img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="">
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-10">
                        <div class="nav-menu">
                            <nav class="mainmenu">
                                <ul>
					                <li class="active"><a href="./index.html">NOTICE</a>
					                   <ul class="dropdown">
					                        <li><a href="#">1</a></li>
					                        <li><a href="#">2</a></li>
					                        <li><a href="#">3</a></li>
					                        <li><a href="#">4</a></li>
					                    </ul>
					                </li>
					                <li><a href="/tourMap">TOUR</a>
<!-- 						                <ul class="dropdown"> -->
<!-- 					                        <li><a href="#">1</a></li> -->
<!-- 					                        <li><a href="#">2</a></li> -->
<!-- 					                        <li><a href="#">3</a></li> -->
<!-- 					                        <li><a href="#">4</a></li> -->
<!-- 						                    </ul> -->
						                </li>
					                <li><a href="./about-us.html">HOTEL</a>
						                <ul class="dropdown">
					                        <li><a href="${pageContext.request.contextPath }/accomodation/roomList">인기숙소</a></li>
					                        <li><a href="${pageContext.request.contextPath }/accomodation/roomReList">예약내역</a></li>
					                        <li><a href="#">3</a></li>
					                        <li><a href="#">4</a></li>
						                    </ul>
						                </li>
					                <li><a href="./pages.html">PLAN</a>
					                    <ul class="dropdown">
					                        <li><a href="/order/goods">구독권</a></li>
					                        <li><a href="/plan/planList">여행 계획</a></li>
					                        <li><a href="#">3</a></li>
					                        <li><a href="#">4</a></li>
					                    </ul>
					                </li>
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