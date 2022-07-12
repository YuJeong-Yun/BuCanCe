<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../include/header.jsp" />
<jsp:include page="${pageContext.request.contextPath}/resources/js/busanMap.jsp"></jsp:include>


    <!-- Contact Section Begin -->
    <section class="contact-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                </div>
            </div>
            <div class="map" id="map" style="height: 470px;">
            	<script type="text/javascript">
            		var container = document.getElementById('map');
            		var options = {
            				center : new kakao.maps.LatLng(35.198362,129.053922),
            				level : 10
            		};
            		var map = new kakao.maps.Map(container,options);
            		
            		Initialization(map);
            		DrawPolygon();
            	</script>
            </div>
        </div>
    </section>
    <!-- Contact Section End -->
  
<jsp:include page="../include/footer.jsp" />
