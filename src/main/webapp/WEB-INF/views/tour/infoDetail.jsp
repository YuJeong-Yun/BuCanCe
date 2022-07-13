<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
	<jsp:include page="../include/header.jsp" />
	<jsp:include page="${pageContext.request.contextPath}/resources/js/getInfoDetail.jsp"></jsp:include>
	 
	

    <!-- Room Details Section Begin -->
    <section class="room-details-section spad">
        <div class="container">
            <div class="row">
                    <div class="room-details-item">
                    	<div id="imageZone">
                    		<img src="${resVO.img }">
    					</div>
    				<div class="rd-text">	
                        <div class="rd-title">
                            <h3 style="font-family: 'NanumSquareBold' !important;">${resVO.title }</h3>
                        </div>
                      <table id="resInfo">
                                <tbody>
                                    <tr>
                                        <td class="r-o">전화번호</td>
                                        <td>${resVO.tel }</td>
                                    </tr>
                                    <tr>
                                        <td class="r-o">운영시간</td>
                                        <td>${resVO.usage_day }</td>
                                    </tr>
                                    <tr>
                                        <td class="r-o">상세주소</td>
                                        <td>${resVO.addr_full }</td>
                                    </tr>
                                    <tr>
                                        <td class="r-o">찜하기</td>
                                        <td><button type="button" id="updateThumb">
                            				<img id="like_img" src="${pageContext.request.contextPath}/resources/img/busan/empty_heart.png">
                            				</button>
                            			</td>
                                    </tr>
                                </tbody>
                     </table>
                     <p class="f-para">${resVO.contents }</p>
                     </div>  
                        <br>
     			 <div class="menu-item">
                        <div class="nav-menu" style="text-align: left !important; cursor: pointer;">
                            <nav class="mainmenu">
                                <ul>
                                    <li class="active" id="review"><a style="font-family: 'NanumBarunGothicLight' !important;">리뷰</a></li>
                                    <li id="blogReview" style="font-family: 'NanumBarunGothicLight' !important;"><a>블로그리뷰</a></li>
                                    <li id="loca" style="font-family: 'NanumBarunGothicLight' !important;"><a>위치</a></li>
                                </ul>
                            </nav>
                        </div>
        		 </div>
                    </div>
                    
                    
                    <div class="review-add" id="review-add">
	                    <div class="rd-reviews" id="blogList" style="display: none;">
	               		</div>
	               		
                         <div class="col-lg-12">
		                    <div class="load-more" style="display: none;" id="load-more">
		                    	<span class="primary-btn">Load More</span>
		                    </div>
	               		</div>
	               		
	               		
	               		<div id="map" style="width:100%;height:550px; display: none;"></div>
	               		
	                    
	                    <div id="writeReview">
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
                                            <i class="icon_star"></i>
                                            <i class="icon_star"></i>
                                            <i class="icon_star"></i>
                                            <i class="icon_star"></i>
                                            <i class="icon_star-half_alt"></i>
                                        </div>
                                    </div>
                                    <textarea placeholder="Your Review"></textarea>
                                    <button type="submit">Submit Now</button>
                                </div>
                            </div>
                        </form>
                        </div>
                        
                       </div>
                    </div>
            </div>
    </section>
   
    <!-- Room Details Section End -->
    <jsp:include page="../include/footer.jsp" />