<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        <h2>예약목록 페이지</h2>
                        <div class="bt-option">
                            <a href="${pageContext.request.contextPath}/accomodation/roomList">Home</a>
                            <span>Rooms</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section End -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script><!-- jQuery CDN --->
    <!-- Rooms Section Begin -->
    <section class="rooms-section spad">
        <div class="container">
            <div class="row">
            <c:set var="a" value="0"/>
				<c:forEach items="${UserPayList}" begin="0" end="${UserPayList.size()}">
                <div class="col-lg-4 col-md-6" >
                    <div class="room-item">
                        <img src="${pageContext.request.contextPath}/resources/img/room/room-1.jpg" alt="">
                        <div class="ri-text">
							<h5>주문번호 : ${UserPayList.get(a).accId}</h5>
							<br>
                            <h4>${UserPayList.get(a).accName}
                            
                             <c:if test="${UserPayList.get(a).license==1}">
                            	<br><a style="color :red">(할인)</a>
                            </c:if>
                            </h4>
                            <h5>${UserPayList.get(a).roomSort}</h5>
                            <table>
                                <tbody >
                                    <tr>
                                        <td class="r-o">예약명:</td>
                                        <td>${UserPayList.get(a).user_name}</td>
                                    </tr>
                                   
                                        <c:if test="${UserPayList.get(a).sort=='ds'}">
                                        <tr>
                                        <td class="r-o">종류:</td>
                                        <td>대실</td>
                                        </tr>
                                        </c:if>
                                        
                                        
                                        <c:if test="${UserPayList.get(a).sort=='acc'}">
                                        <tr>
                                        <td class="r-o">종류:</td>
                                       <td>숙박</td>
                               		  </tr>
                               		  
                               		   </c:if>
                                    
                                    
                                    
                                    <tr>
                                        <td class="r-o">기간 :</td>
                                        <td>${UserPayList.get(a).checkIn} ~ ${UserPayList.get(a).checkOut}</td>
                                    </tr>
                                    
                                    
                                    <tr>
                                    
                                    <c:if test="${UserPayList.get(a).sort=='ds'}">
                                        <td class="r-o">마감/이용시간 :</td>
                                        <td>${UserPayList.get(a).endTime}시 / ${UserPayList.get(a).useTime}시간</td>
                                 	</c:if>
                                 	
                                    <c:if test="${UserPayList.get(a).sort=='acc'}">
                                        <td class="r-o">입실/퇴실시간 :</td>
                                        <td>${UserPayList.get(a).useTime}시 / ${UserPayList.get(a).endTime}시</td>
                                 	</c:if>
                                 	
                                    </tr>
                                    
                                    
                                     <tr>
                                        <td class="r-o">비용 :</td>
                                        <td>${UserPayList.get(a).accAmount}원</td>
                                    </tr>
                                    
                                    <tr>
                                    <td>결제시간: </td>
                                    <td>${UserPayList.get(a).accDate}</td>
                                </tr>
                                    
                                    
                                </tbody>
                            </table>
                            
                            <form action="${pageContext.request.contextPath}/accomodation/roomRefund" method="post">
                            <input type="hidden" name="accId" value="${UserPayList.get(a).accId}">
                            <input type="hidden" name="accName" value="${UserPayList.get(a).accName}">
                            <input type="hidden" name="roomSort" value="${UserPayList.get(a).roomSort}">
                           	<input type="hidden" name="user_name" value="${UserPayList.get(a).user_name}">
                           	<input type="hidden" name="sort" value="${UserPayList.get(a).sort}">
                           	<input type="hidden" name="checkIn" value="${UserPayList.get(a).checkIn}">
                           	<input type="hidden" name="checkOut" value="${UserPayList.get(a).checkOut}">
                           	<input type="hidden" name="useTime" value="${UserPayList.get(a).useTime}">
                           	<input type="hidden" name="endTime" value="${UserPayList.get(a).endTime}">
                           	<input type="hidden" name="accAmount" value="${UserPayList.get(a).accAmount}">
                            <input type="hidden" name="accKind" value="${UserPayList.get(a).accKind}">
							<input type="hidden" name="id" value="${UserPayList.get(a).id}">
							<input type="hidden" name="license" value="${UserPayList.get(a).license}">
							
                            
                            <c:if test="${UserPayList.get(a).status!='refund'}">
                            <button type="submit" style="color : blue">환불하기</button>
                            </c:if>
                              <c:if test="${UserPayList.get(a).status=='refund'}">
                              <button type="button" style="color : red">환불처리</button>
                               </c:if>
                       		</form>
                       		
                       </div>
						</div>
                        </div>

    <c:set var="a" value="${a=a+1}"/>
                        </c:forEach>
                        <div class="col-lg-12">
					<div class="room-pagination">
                        
                    </div>
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