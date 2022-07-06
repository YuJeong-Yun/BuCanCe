<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../include/header.jsp" />
<jsp:include page="${pageContext.request.contextPath}/resources/js/getWeather.jsp"></jsp:include>



        
    <!-- Breadcrumb Section Begin -->
    <div class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2 class="nanumFont" style="display: inline-block; margin-left: 5em;">${addr }</h2>
                    <div id="weatherInfo" style="display: inline-block; margin-left: 2em;">
               		</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section End -->
    

    <!-- Rooms Section Begin -->
    <section class="rooms-section spad">
        <div class="container">
            <div class="row">
                <c:forEach var="vo" items="${resVO }">
                <div class="col-lg-4 col-md-6">
                    <div class="room-item">
                        <a href="/infoDetail?title=${vo.title }"><img src="${vo.thumb_img }" alt=""></a>
                        <div class="info">
                            <h4>${vo.title }</h4>
                            <div>
	                            <i class="fa fa-hand-pointer-o" aria-hidden="true"></i> 조회수
	                            <i class="fa fa-commenting-o" aria-hidden="true"></i> 댓글
	                            <i class="fa fa-thumbs-o-up" aria-hidden="true"></i>
	                            <i class="fa fa-heart-o" aria-hidden="true"></i>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </section>
    <!-- Rooms Section End -->
<jsp:include page="../include/footer.jsp" />

</html>