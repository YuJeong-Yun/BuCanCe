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
    					</div>
                        <div class="rd-title">
                            <h3>${resVO.title }</h3>
                        </div>
                        <br>
     			 <div class="menu-item">
                        <div class="nav-menu" style="text-align: left !important; cursor: pointer;">
                            <nav class="mainmenu">
                                <ul>
                                    <li class="active" id="review"><a>리뷰</a></li>
                                    <li id="blogReview"><a href="/tour/infoDetail?title=${resVO.title }">블로그리뷰</a></li>
                                    <li><a href="/tour/locationMap">위치</a></li>
                                </ul>
                            </nav>
                        </div>
        		 </div>
               </div>
             </div>
          </div>
    </section>
   
    <!-- Room Details Section End -->
    <jsp:include page="../include/footer.jsp" />