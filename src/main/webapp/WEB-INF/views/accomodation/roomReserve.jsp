<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Lora:400,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&display=swap" rel="stylesheet">

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
                <li class="active"><a href="./index.html">Home</a></li>
                <li><a href="./rooms.html">Rooms</a></li>
                <li><a href="./about-us.html">About Us</a></li>
                <li><a href="./pages.html">Pages</a>
                    <ul class="dropdown">
                        <li><a href="./room-details.html">Room Details</a></li>
                        <li><a href="./blog-details.html">Blog Details</a></li>
                        <li><a href="#">Family Room</a></li>
                        <li><a href="#">Premium Room</a></li>
                    </ul>
                </li>
                <li><a href="./blog.html">News</a></li>
                <li><a href="./contact.html">Contact</a></li>
            </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="top-social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-tripadvisor"></i></a>
            <a href="#"><i class="fa fa-instagram"></i></a>
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
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-tripadvisor"></i></a>
                                <a href="#"><i class="fa fa-instagram"></i></a>
                            </div>
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
                                    <li><a href="./index.html">Home</a></li>
                                    <li class="active"><a href="./rooms.html">Rooms</a></li>
                                    <li><a href="./about-us.html">About Us</a></li>
                                    <li><a href="./pages.html">Pages</a>
                                        <ul class="dropdown">
                                            <li><a href="./room-details.html">Room Details</a></li>
                                            <li><a href="./blog-details.html">Blog Details</a></li>
                                            <li><a href="#">Family Room</a></li>
                                            <li><a href="#">Premium Room</a></li>
                                        </ul>
                                    </li>
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
                        <h2>예약항목 선택</h2>
                        <div class="bt-option">
                            <a href="<%=request.getHeader("REFERER")%>">뒤로가기</a>
                            <span>${room_title}</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section End -->

    <!-- Rooms Section Begin -->
    
    <!-- 예약정보가 없을때 처리로직 -->
    <c:if test="${roomReserve=='[]'}">
    	<h1 style="text-align: center;">예약 마감</h1>
    </c:if>
    
    
    
    <section class="rooms-section spad">
        <div class="container">
            <div class="row">
            <c:set var="a" />
            <c:forEach items="${roomReserve}" begin="0" end="${roomReserve.size()}">
                <div class="col-lg-4 col-md-6">
                    <div class="room-item">
                       <a href="#">
                       <img src="${roomReserve.get(a).room_pic}" alt="acc" class="poster"  style="border: solid gray; box-shadow: 5px 5px 5px 5px gray; border-radius:10px;">
                    	<div class="ri-text"  style="border: solid	#65A2FF; box-shadow: 5px 5px 5px 5px gray; border-radius:10px;"  >
                            <h4>${roomReserve.get(a).room_title}</h4>
                            <table>
                                <tbody>
                                
                                <tr style="color: blue">
                                    
                                        <td class="r-o">대실:</td>
                                        
                                        <td>
                                        <c:if test='${roomReserve.get(a).room_fcost != ""}'>
                                        ${roomReserve.get(a).room_fcost} 원
										</c:if>
                                        
                                        <c:if test='${roomReserve.get(a).room_fcost == ""}'>
                                        숙소에 문의
										</c:if>
                                        </td>
                                    </tr>
                                
                                
  								    <tr style="color: blue">
                                    
                                        <td class="r-o" >(대)마감/이용:</td>
                                       <td>
                                         <c:if test='${roomReserve.get(a).room_fcost != ""}'>
                                        ${roomReserve.get(a).room_endtime}시/
                                        
                                          ${roomReserve.get(a).room_usetime}시간
                                        </c:if>
                                         <c:if test='${roomReserve.get(a).room_fcost == ""}'>
                                       숙소에 문의
                                       
                                        </c:if>
                                       </td>
                                   
                                       
                                    </tr>
                                    
                                   
                                    
                                    
                                    
                                    <tr style="color: red">
                                        <td class="r-o" >숙박:</td>
                                        
                                        <td>
                                        <c:if test="${roomReserve.get(a).room_reserve2 != 1}">
									
                                        ${fn:substring(roomReserve.get(a).room_lcost,0,roomReserve.get(a).room_reserve2.length()-1)} 원
									</c:if>
									
									 <c:if test="${roomReserve.get(a).room_reserve2 == 1}">
									
                                        숙소에 문의
									</c:if>
									</td>
                                    </tr>
                                
                                     <tr style="color: red">
                                    
                                        <td class="r-o">(숙)입실/퇴실:</td>
                                       <td>
                                         <c:if test='${roomReserve.get(a).room_lcost != "1"}'>
                                        ${roomReserve.get(a).room_accendtime}시/
                                        ${checkout}일
                                          ${roomReserve.get(a).room_accusetime}시
                                        </c:if>
                                         <c:if test='${roomReserve.get(a).room_lcost == "1"}'>
                                       숙소에 문의
                                       
                                        </c:if>
                                       </td>
                                   
                                       
                                    </tr>
                                    
                                    
                                    
                                    
                                    <tr style="color: red">
                                        <td class="r-o">총 숙박가격 :</td>
<%--                                         <td>${roomReserve.get(a).room_reserve2}</td> --%>
	                               <td>
									<c:if test="${roomReserve.get(a).room_reserve2 != 1 }">
									
                                        ${fn:substring(roomReserve.get(a).room_reserve2,0,roomReserve.get(a).room_reserve2.length()-1)} 원
									</c:if>
									<c:if test="${roomReserve.get(a).room_reserve2 == 1}">
                                        숙소에 문의
									</c:if>
									</td>
                                    </tr>
                                </tbody>
                                </a>
                            </table>
                          
                           
                          <c:if test="${roomReserve.get(a).room_fcost != ''}">
                            <form action="${pageContext.request.contextPath}/accomodation/roomPayment" style='display:inline'>
                           	<input type="hidden" name="room_title" value="${room_title}">
                           	<input type="hidden" name="room_reserve2" value="${fn:substring(roomReserve.get(a).room_reserve2,0,roomReserve.get(a).room_reserve2.length()-1)}">
                           	<input type="hidden" name="accendtime" value="${roomReserve.get(a).room_accendtime}">
                           	<input type="hidden" name="accusetime" value="${roomReserve.get(a).room_accusetime}">
                           	<input type="hidden" name="room_lcost" value="${roomReserve.get(a).room_lcost}">
                           	<input type="hidden" name="room_fcost" value="${roomReserve.get(a).room_fcost}">
                           	<input type="hidden" name="room_endtime" value="${roomReserve.get(a).room_endtime}">
                           	<input type="hidden" name="room_usetime" value="${roomReserve.get(a).room_usetime}">
                           	<input type="hidden" name="room_pic" value="${roomReserve.get(a).room_pic}">
                           	<input type="hidden" name="room_subTitle" value="${roomReserve.get(a).room_title}">
                           	<input type="hidden" name="checkout" value="${checkoutFull}">
                           	<input type="hidden" name="checkin" value="${checkinFull}">
                           	<input type="hidden" name="endtime" value="	${roomReserve.get(a).room_endtime}">
                           	<input type="hidden" name="usetime" value="${roomReserve.get(a).room_usetime}">
                           
<%--                            	${roomReserve.get(a).room_endtime}시 --%>
<%-- `			                ${roomReserve.get(a).room_usetime}시간 --%>
                          
                            <button type="submit" class="btn btn-primary">대실 예약하기</button> &nbsp; 
                         
                         </form>
                         
                         </c:if>
                         
                          <c:if test="${roomReserve.get(a).room_reserve2 != 1 }">
                           
                          <form action="${pageContext.request.contextPath}/accomodation/roomPayment2" style="display:inline">
                           	<input type="hidden" name="room_title" value="${room_title}">
                           	<input type="hidden" name="room_reserve2" value="${fn:substring(roomReserve.get(a).room_reserve2,0,roomReserve.get(a).room_reserve2.length()-1)}">
                           	<input type="hidden" name="accendtime" value="${roomReserve.get(a).room_accendtime}">
                           	<input type="hidden" name="accusetime" value="${roomReserve.get(a).room_accusetime}">
                           	<input type="hidden" name="room_lcost" value="${roomReserve.get(a).room_lcost}">
                           	<input type="hidden" name="room_fcost" value="${roomReserve.get(a).room_fcost}">
                           	<input type="hidden" name="room_endtime" value="${roomReserve.get(a).room_endtime}">
                           	<input type="hidden" name="room_usetime" value="${roomReserve.get(a).room_usetime}">
                           	<input type="hidden" name="room_pic" value="${roomReserve.get(a).room_pic}">
                           	<input type="hidden" name="room_subTitle" value="${roomReserve.get(a).room_title}">
                           	<input type="hidden" name="checkout" value="${checkoutFull}">
                           	<input type="hidden" name="checkin" value="${checkinFull}">
                           
                            <button type="submit" class="btn btn-primary">숙박 예약하기</button>
                            
                              </form>
                            
                            </c:if>
<%--                       <a href="${pageContext.request.contextPath}/accomodation/roomPayment" class="primary-btn">예약하기</a> --%>
                            
                           
                        </div>
                    </div>
                </div>
                <c:set var="a" value="${a=a+1}"/>
                </c:forEach>
                
                </div>
               
            </div>
        </div>
    </section>
    <!-- Rooms Section End -->

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