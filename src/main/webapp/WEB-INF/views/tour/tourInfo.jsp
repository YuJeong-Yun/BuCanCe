<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../include/header.jsp" />


        
    <!-- Breadcrumb Section Begin -->
    <div class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2>${resVO[0].addr }</h2>
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
                        <a href="/tour/infoDetail?title=${vo.title }"><img src="${vo.img }" alt=""></a>
                        <div class="ri-text">
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