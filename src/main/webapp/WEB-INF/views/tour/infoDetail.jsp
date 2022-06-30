<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
	<jsp:include page="../include/header.jsp" />
	<jsp:include page="${pageContext.request.contextPath}/resources/js/getInfoDetail.jsp"></jsp:include> 
	

   <!-- Breadcrumb Section Begin -->
    <div class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section End -->

    <!-- Room Details Section Begin -->
    <section class="room-details-section spad">
        <div class="container">
            <div class="row">
                    <div class="room-details-item">
                        <img src="${resVO.img }" alt="">
                            <div class="rd-title">
                                <h3>${resVO.title }</h3>
                                <div class="rdt-right">
                                    <a href="#">Booking Now</a>
                                </div>
                            </div>
                        <br>
     			 <div class="menu-item">
                        <div class="nav-menu" style="text-align: left !important; cursor: pointer;">
                            <nav class="mainmenu">
                                <ul>
                                    <li class="active" id="review"><a>리뷰</a></li>
                                    <li id="blogReview"><a>블로그리뷰</a></li>
                                </ul>
                            </nav>
                        </div>
        		 </div>
                    </div>
                    
                    
                    <div class="review-add" id="review-add">
	                    <div class="rd-reviews" id="blogList" style="display: none;">
                           <div class="ri-text">
                           </div>
	               		</div>
	               		
                         <div class="col-lg-12">
		                    <div class="load-more" style="display: none;" id="load-more">
		                        <a href="#" class="primary-btn">Load More</a>
		                    </div>
	               		</div>
	                    
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