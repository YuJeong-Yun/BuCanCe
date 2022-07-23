<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<jsp:include page="./include/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main.css" />

<!-- <style>
.owl-carousel{
background-position: center center;
}
</style> 
 -->
    <!-- Hero Section Begin -->
    <section class="hero-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="hero-text">
                        <h1>BuCance</h1>
                        <p>어디 갈지 고민 중이라면, 부캉스와 함께 일정 세워 보는 건 어떠세요?</p>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-5 offset-xl-2 offset-lg-1">
                </div>
            </div>
        </div>
        <div class="hero-slider owl-carousel">
            <div class="hs-item set-bg" data-setbg="${pageContext.request.contextPath}/resources/img/busan/busan1.jpg" style="background-position: center center;"></div>
            <div class="hs-item set-bg" data-setbg="${pageContext.request.contextPath}/resources/img/busan/busan2.jpg" style="background-position: center center;"></div>
            <div class="hs-item set-bg" data-setbg="${pageContext.request.contextPath}/resources/img/busan/busan3.jpg" style="background-position: center center;"></div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- About Us Section Begin -->
<!--     <section class="aboutus-section spad"> -->
<!--         <div class="container"> -->
<!--             <div class="row"> -->
<!--                 <div class="col-lg-6"> -->
<!--                     <div class="about-text"> -->
<!--                         <div class="section-title"> -->
<!--                             <span>About Us</span> -->
<!--                             <h2>Intercontinental LA <br />Westlake Hotel</h2> -->
<!--                         </div> -->
<!--                         <p class="f-para">Sona.com is a leading online accommodation site. We’re passionate about -->
<!--                             travel. Every day, we inspire and reach millions of travelers across 90 local websites in 41 -->
<!--                             languages.</p> -->
<!--                         <p class="s-para">So when it comes to booking the perfect hotel, vacation rental, resort, -->
<!--                             apartment, guest house, or tree house, we’ve got you covered.</p> -->
<!--                         <a href="#" class="primary-btn about-btn">Read More</a> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="col-lg-6"> -->
<!--                     <div class="about-pic"> -->
<!--                         <div class="row"> -->
<!--                             <div class="col-sm-6"> -->
<%--                                 <img src="${pageContext.request.contextPath}/resources/img/about/about-1.jpg" alt=""> --%>
<!--                             </div> -->
<!--                             <div class="col-sm-6"> -->
<%--                                 <img src="${pageContext.request.contextPath}/resources/img/about/about-2.jpg" alt=""> --%>
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </section> -->
    <!-- About Us Section End -->

    <!-- Services Section End -->
    <section class="services-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <span>서비스 둘러보기</span>
                        <h2>Our Services</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6 col-sm-6">
                    <div class="service-item">
                        <i class="flaticon-036-parking"></i>
                        <h4>Tour Spot</h4>
                        <p>부산의 행정구역별 관광지를 한 눈에 확인해 보세요.<br>방문객들의 리뷰를 통해 마음에 드는 관광지를 골라보세요!</p>
                    </div>
                </div>
                <div class="col-lg-6 col-sm-6">
                    <div class="service-item">
                        <i class="flaticon-033-dinner"></i>
                        <h4>Restaurant</h4>
                        <p>사람들의 리뷰를 통해 찐맛집을 찾아보세요.</p>
                    </div>
                </div>
                <div class="col-lg-6 col-sm-6">
                    <div class="service-item">
                        <i class="flaticon-026-bed"></i>
                        <h4>Accomodation</h4>
                        <p>숙소를 예약하러 헤맬 필요가 없습니다. <br>숙소 예약까지 부캉스에서 한 번에 해결하세요.</p>
                    </div>
                </div>
                <div class="col-lg-6 col-sm-6">
                    <div class="service-item">
                        <i class="flaticon-042-menu"></i>
                        <h4>Tour Plan</h4>
                        <p>함께 여행할 친구들을 그룹으로 초대하세요.<br>그룹 멤버들과 내가 짠 플랜을 공유할 수 있습니다.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Services Section End -->

    <!-- Home Room Section Begin -->
<!--     <section class="hp-room-section"> -->
<!--         <div class="container-fluid"> -->
<!--             <div class="hp-room-items"> -->
<!--                 <div class="row"> -->
<!--                     <div class="col-lg-3 col-md-6"> -->
<%--                         <div class="hp-room-item set-bg" data-setbg="${pageContext.request.contextPath}/resources/img/room/room-b1.jpg"> --%>
<!--                             <div class="hr-text"> -->
<!--                                 <h3>Double Room</h3> -->
<!--                                 <h2>199$<span>/Pernight</span></h2> -->
<!--                                 <table> -->
<!--                                     <tbody> -->
<!--                                         <tr> -->
<!--                                             <td class="r-o">Size:</td> -->
<!--                                             <td>30 ft</td> -->
<!--                                         </tr> -->
<!--                                         <tr> -->
<!--                                             <td class="r-o">Capacity:</td> -->
<!--                                             <td>Max persion 5</td> -->
<!--                                         </tr> -->
<!--                                         <tr> -->
<!--                                             <td class="r-o">Bed:</td> -->
<!--                                             <td>King Beds</td> -->
<!--                                         </tr> -->
<!--                                         <tr> -->
<!--                                             <td class="r-o">Services:</td> -->
<!--                                             <td>Wifi, Television, Bathroom,...</td> -->
<!--                                         </tr> -->
<!--                                     </tbody> -->
<!--                                 </table> -->
<!--                                 <a href="#" class="primary-btn">More Details</a> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="col-lg-3 col-md-6"> -->
<%--                         <div class="hp-room-item set-bg" data-setbg="${pageContext.request.contextPath}/resources/img/room/room-b2.jpg"> --%>
<!--                             <div class="hr-text"> -->
<!--                                 <h3>Premium King Room</h3> -->
<!--                                 <h2>159$<span>/Pernight</span></h2> -->
<!--                                 <table> -->
<!--                                     <tbody> -->
<!--                                         <tr> -->
<!--                                             <td class="r-o">Size:</td> -->
<!--                                             <td>30 ft</td> -->
<!--                                         </tr> -->
<!--                                         <tr> -->
<!--                                             <td class="r-o">Capacity:</td> -->
<!--                                             <td>Max persion 5</td> -->
<!--                                         </tr> -->
<!--                                         <tr> -->
<!--                                             <td class="r-o">Bed:</td> -->
<!--                                             <td>King Beds</td> -->
<!--                                         </tr> -->
<!--                                         <tr> -->
<!--                                             <td class="r-o">Services:</td> -->
<!--                                             <td>Wifi, Television, Bathroom,...</td> -->
<!--                                         </tr> -->
<!--                                     </tbody> -->
<!--                                 </table> -->
<!--                                 <a href="#" class="primary-btn">More Details</a> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="col-lg-3 col-md-6"> -->
<%--                         <div class="hp-room-item set-bg" data-setbg="${pageContext.request.contextPath}/resources/img/room/room-b3.jpg"> --%>
<!--                             <div class="hr-text"> -->
<!--                                 <h3>Deluxe Room</h3> -->
<!--                                 <h2>198$<span>/Pernight</span></h2> -->
<!--                                 <table> -->
<!--                                     <tbody> -->
<!--                                         <tr> -->
<!--                                             <td class="r-o">Size:</td> -->
<!--                                             <td>30 ft</td> -->
<!--                                         </tr> -->
<!--                                         <tr> -->
<!--                                             <td class="r-o">Capacity:</td> -->
<!--                                             <td>Max persion 5</td> -->
<!--                                         </tr> -->
<!--                                         <tr> -->
<!--                                             <td class="r-o">Bed:</td> -->
<!--                                             <td>King Beds</td> -->
<!--                                         </tr> -->
<!--                                         <tr> -->
<!--                                             <td class="r-o">Services:</td> -->
<!--                                             <td>Wifi, Television, Bathroom,...</td> -->
<!--                                         </tr> -->
<!--                                     </tbody> -->
<!--                                 </table> -->
<!--                                 <a href="#" class="primary-btn">More Details</a> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="col-lg-3 col-md-6"> -->
<%--                         <div class="hp-room-item set-bg" data-setbg="${pageContext.request.contextPath}/resources/img/room/room-b4.jpg"> --%>
<!--                             <div class="hr-text"> -->
<!--                                 <h3>Family Room</h3> -->
<!--                                 <h2>299$<span>/Pernight</span></h2> -->
<!--                                 <table> -->
<!--                                     <tbody> -->
<!--                                         <tr> -->
<!--                                             <td class="r-o">Size:</td> -->
<!--                                             <td>30 ft</td> -->
<!--                                         </tr> -->
<!--                                         <tr> -->
<!--                                             <td class="r-o">Capacity:</td> -->
<!--                                             <td>Max persion 5</td> -->
<!--                                         </tr> -->
<!--                                         <tr> -->
<!--                                             <td class="r-o">Bed:</td> -->
<!--                                             <td>King Beds</td> -->
<!--                                         </tr> -->
<!--                                         <tr> -->
<!--                                             <td class="r-o">Services:</td> -->
<!--                                             <td>Wifi, Television, Bathroom,...</td> -->
<!--                                         </tr> -->
<!--                                     </tbody> -->
<!--                                 </table> -->
<!--                                 <a href="#" class="primary-btn">More Details</a> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </section> -->
    <!-- Home Room Section End -->

    <!-- Testimonial Section Begin -->
<!--     <section class="testimonial-section spad"> -->
<!--         <div class="container"> -->
<!--             <div class="row"> -->
<!--                 <div class="col-lg-12"> -->
<!--                     <div class="section-title"> -->
<!--                         <span>Testimonials</span> -->
<!--                         <h2>What Customers Say?</h2> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--             <div class="row"> -->
<!--                 <div class="col-lg-8 offset-lg-2"> -->
<!--                     <div class="testimonial-slider owl-carousel"> -->
<!--                         <div class="ts-item"> -->
<!--                             <p>After a construction project took longer than expected, my husband, my daughter and I -->
<!--                                 needed a place to stay for a few nights. As a Chicago resident, we know a lot about our -->
<!--                                 city, neighborhood and the types of housing options available and absolutely love our -->
<!--                                 vacation at Sona Hotel.</p> -->
<!--                             <div class="ti-author"> -->
<!--                                 <div class="rating"> -->
<!--                                     <i class="icon_star"></i> -->
<!--                                     <i class="icon_star"></i> -->
<!--                                     <i class="icon_star"></i> -->
<!--                                     <i class="icon_star"></i> -->
<!--                                     <i class="icon_star-half_alt"></i> -->
<!--                                 </div> -->
<!--                                 <h5> - Alexander Vasquez</h5> -->
<!--                             </div> -->
<%--                             <img src="${pageContext.request.contextPath}/resources/img/testimonial-logo.png" alt=""> --%>
<!--                         </div> -->
<!--                         <div class="ts-item"> -->
<!--                             <p>After a construction project took longer than expected, my husband, my daughter and I -->
<!--                                 needed a place to stay for a few nights. As a Chicago resident, we know a lot about our -->
<!--                                 city, neighborhood and the types of housing options available and absolutely love our -->
<!--                                 vacation at Sona Hotel.</p> -->
<!--                             <div class="ti-author"> -->
<!--                                 <div class="rating"> -->
<!--                                     <i class="icon_star"></i> -->
<!--                                     <i class="icon_star"></i> -->
<!--                                     <i class="icon_star"></i> -->
<!--                                     <i class="icon_star"></i> -->
<!--                                     <i class="icon_star-half_alt"></i> -->
<!--                                 </div> -->
<!--                                 <h5> - Alexander Vasquez</h5> -->
<!--                             </div> -->
<%--                             <img src="${pageContext.request.contextPath}/resources/img/testimonial-logo.png" alt=""> --%>
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </section> -->
    <!-- Testimonial Section End -->

    <!-- Blog Section Begin -->
<!--     <section class="blog-section spad"> -->
<!--         <div class="container"> -->
<!--             <div class="row"> -->
<!--                 <div class="col-lg-12"> -->
<!--                     <div class="section-title"> -->
<!--                         <span>Hotel News</span> -->
<!--                         <h2>Our Blog & Event</h2> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--             <div class="row"> -->
<!--                 <div class="col-lg-4"> -->
<%--                     <div class="blog-item set-bg" data-setbg="${pageContext.request.contextPath}/resources/img/blog/blog-1.jpg"> --%>
<!--                         <div class="bi-text"> -->
<!--                             <span class="b-tag">Travel Trip</span> -->
<!--                             <h4><a href="#">Tremblant In Canada</a></h4> -->
<!--                             <div class="b-time"><i class="icon_clock_alt"></i> 15th April, 2019</div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="col-lg-4"> -->
<%--                     <div class="blog-item set-bg" data-setbg="${pageContext.request.contextPath}/resources/img/blog/blog-2.jpg"> --%>
<!--                         <div class="bi-text"> -->
<!--                             <span class="b-tag">Camping</span> -->
<!--                             <h4><a href="#">Choosing A Static Caravan</a></h4> -->
<!--                             <div class="b-time"><i class="icon_clock_alt"></i> 15th April, 2019</div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="col-lg-4"> -->
<%--                     <div class="blog-item set-bg" data-setbg="${pageContext.request.contextPath}/resources/img/blog/blog-3.jpg"> --%>
<!--                         <div class="bi-text"> -->
<!--                             <span class="b-tag">Event</span> -->
<!--                             <h4><a href="#">Copper Canyon</a></h4> -->
<!--                             <div class="b-time"><i class="icon_clock_alt"></i> 21th April, 2019</div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="col-lg-8"> -->
<%--                     <div class="blog-item small-size set-bg" data-setbg="${pageContext.request.contextPath}/resources/img/blog/blog-wide.jpg"> --%>
<!--                         <div class="bi-text"> -->
<!--                             <span class="b-tag">Event</span> -->
<!--                             <h4><a href="#">Trip To Iqaluit In Nunavut A Canadian Arctic City</a></h4> -->
<!--                             <div class="b-time"><i class="icon_clock_alt"></i> 08th April, 2019</div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="col-lg-4"> -->
<%--                     <div class="blog-item small-size set-bg" data-setbg="${pageContext.request.contextPath}/resources/img/blog/blog-10.jpg"> --%>
<!--                         <div class="bi-text"> -->
<!--                             <span class="b-tag">Travel</span> -->
<!--                             <h4><a href="#">Traveling To Barcelona</a></h4> -->
<!--                             <div class="b-time"><i class="icon_clock_alt"></i> 12th April, 2019</div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </section> -->
    <!-- Blog Section End -->
    
    
    <!-- 여행 플랜 -->
    <section id="tour-plan">
    	<div class="container">
    		<img src="${pageContext.request.contextPath }/resources/img/main/plan1.png" alt="여행 플랜1" class="plan1" />
    		<img src="${pageContext.request.contextPath }/resources/img/main/plan2.png" alt="여행 플랜2" class="plan2" />
    		<div class="description-1">
    			<div>함께 여행할 친구들을 그룹에 초대해<br>플랜을 공유하세요.</div>
    		</div>
    		<div class="description-2">
    			<div class="title">부캉스의 회원은 누구나 이용 가능!</div>
    			<button onclick="location.href='${pageContext.request.contextPath}/plan/planList';">플랜 작성하러 가기</button>
    			<a href="${pageContext.request.contextPath }/member/join" class="no-member">지금 회원 가입하러 가기</a>
    		</div>
    	</div>
    </section>
    
    
    <!-- 행정구역별 관광지 -->
    <section id="tour-map">
	   	<div class="map-container">
	   		<img src="${pageContext.request.contextPath }/resources/img/main/tourmap.jpg" alt="투어 맵" />
	   		<button onclick="location.href='${pageContext.request.contextPath}/board/tourMap';">지금 보러 가기</button>
	   	</div>
    </section>

<jsp:include page="./include/footer.jsp" />