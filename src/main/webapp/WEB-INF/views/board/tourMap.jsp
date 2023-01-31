<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/board.css" type="text/css">



    <!-- Contact Section Begin -->
    <section class="contact-section spad">
    	<div class="container">
	            <div class="map" id="map" style=" width: 45%; display: inline-block;"></div>
	            <div id="mapTitle">
	            	<div class="one">
	            	<h2>행정구역별 부산의 명소 찾기</h2>
	            	</div>
	            	<p>
		            구역별 부산의 명소와 맛집을 찾아 나만의 여행 계획을 세워보세요
		            부캉스의 회원이라면 누구나 플래너 서비스를 이용할 수 있어요!
		            <a href="/plan/planList">여행 계획 세우기</a>
	            	</p>
	            </div>
	    </div>        
    </section>
    <!-- Contact Section End -->
<script type="text/javascript">
const path = '${pageContext.request.contextPath}';
</script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=99fbd6629cf7202febfa5d915b1ff3c3"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/board/TourMap.js"></script>
<jsp:include page="../include/footer.jsp" />
