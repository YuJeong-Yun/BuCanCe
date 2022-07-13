<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<jsp:include page="../include/header.jsp" />



    <!-- Contact Section Begin -->
    <section class="contact-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                </div>
            </div>
            <!-- 지도 출력 -->
            <div class="map" id="map" style="height: 470px;">
            <!-- 지도 출력 -->
            </div>
        </div>
    </section>
    <!-- Contact Section End -->
<jsp:include page="${pageContext.request.contextPath}/resources/js/getTourMap.jsp"></jsp:include> 
<jsp:include page="../include/footer.jsp" />
