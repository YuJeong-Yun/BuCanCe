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
    <title>부산 여행은 부캉스</title>
    
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Lora:400,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/flaticon.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css">
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
        <div class="header-configure-area">
            <a href="#" class="bk-btn">Bucance</a>
        </div>
        <nav class="mainmenu mobile-menu">
            <ul>
                <li><a href="#">TOUR</a>
	                <ul class="dropdown">
	                    <li><a href="/board/tourMap">관광지도</a></li>
                        <li><a href="/board/tourList?t_category=0&addr=all">모두보기</a></li>
	                    </ul>
	                </li>
                <li><a href="#">HOTEL</a>
	                <ul class="dropdown">
                        <li><a href="${pageContext.request.contextPath }/accomodation/roomList">인기숙소</a></li>
                        <li><a href="${pageContext.request.contextPath }/accomodation/roomReList">예약내역</a></li>
	                    </ul>
	                </li>
                <li><a href="#">PLAN</a>
                    <ul class="dropdown">
                        <li><a href="${pageContext.request.contextPath }/order/goods">구독권</a></li>
                        <li><a href="${pageContext.request.contextPath }/plan/planList">여행 계획</a></li>
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
	<a href="/member/login">LOGIN</a> | 
	<a href="/member/insert">JOIN</a>
	</div>
	<%	
	} else if(id.equals("admin")){
		%>
			<div id="login">
			관리자님 안녕하세요.
			<a href="/admin/profitChart">사이트관리</a>
			<a href="/member/logout">LOGOUT</a>
			</div>

<%	
	}else { %>
	
	<div id="login">
	<%=id%>님 로그인 중입니다!!<br>
	<a href="/member/mypage?id=<%=id %>">MYPAGE</a>
	<a href="/member/logout">LOGOUT</a>
	</div>

<%	
	}
%>
<!-- 로그인 / 회원가입 / 로그아웃 -->
    </div>
    <!-- Offcanvas Menu Section End -->




    <!-- Header Section Begin -->
    <header class="header-section">
        <div class="top-nav">
            <div class="container">
                <div class="row">
                            
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
                            <a href="/main">
                                <img src="${pageContext.request.contextPath}/resources/img/Bucance-logo.png" alt="">
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-10">
                        <div class="nav-menu">
                            <nav class="mainmenu">
                                <ul>
					                <li><a href="#">TOUR</a>
						                <ul class="dropdown">
					                        <li><a href="${pageContext.request.contextPath }/board/tourMap">관광지도</a></li>
					                        <li><a href="${pageContext.request.contextPath }/board/tourList?t_category=0&addr=all">모두보기</a></li>
					                    </ul> 
					                </li>
					                <li><a href="#">HOTEL</a>
						                <ul class="dropdown">
					                        <li><a href="${pageContext.request.contextPath }/accomodation/roomList">인기숙소</a></li>
					                        <li><a href="${pageContext.request.contextPath }/accomodation/roomReList">예약내역</a></li>
						                    </ul>
						                </li>
                					<li><a href="#">PLAN</a>
					                    <ul class="dropdown">
					                        <li><a href="${pageContext.request.contextPath }/order/goods">구독권</a></li>
					                        <li><a href="${pageContext.request.contextPath }/plan/planList">여행 계획</a></li>
					                    </ul>
					                </li>
					                <li class="active"><a href="${pageContext.request.contextPath }/member/mypage">MYPAGE</a></li>
					             </ul>
                            </nav>
                            <div class="nav-right search-switch">
<!-- 로그인 / 회원가입 / 로그아웃 -->

<%
	if(id==null){
%>



	 <div id="btn-group">
	 <button type="button" class="w-btn w-btn-indigo" onclick="location.href='/member/login'">LOGIN</button>
	</div>
	
	
	
	<%	
	} else if(id.equals("admin")){
		%>
			<div id="login">
			관리자님 안녕하세요.
			<a href="/admin/profitChart">사이트관리</a>
	 <button type="button" class="w-btn w-btn-indigo" onclick="location.href='/member/logout'">LOGOUT</button>
		<!-- 	<a href="/member/logout">LOGOUT</a> -->
			</div>
<%	
	}else { %>
	
	<div id="login">
	<%=id%>님 반갑습니다
	 <button type="button" class="w-btn w-btn-indigo" onclick="location.href='/member/logout'">LOGOUT</button>
	</div>

<%	
	}
%>
	
<!-- 로그인 / 회원가입 / 로그아웃 -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- Header End -->