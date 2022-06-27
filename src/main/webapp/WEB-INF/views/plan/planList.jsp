<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="../include/header.jsp" />
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/group/planList.css" /> --%>

    <!-- Breadcrumb Section Begin -->
    <div class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2>Tour Plan</h2>
                        <div class="bt-option">
                            <span>그룹으로 초대해 함께 플랜을 작성해 보세요!</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section End -->




	
    <!-- Room Details Section Begin -->
    <section class="room-details-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12"  align="center">
                    <div class="room-details-item">
                        <div class="rd-text">
		                    <div class="room-booking">
		                    	<div class="col-lg-4">
			                        <form action="/plan/planContent">
			                        	<!-- Button trigger modal -->
										<button class="add-group" type="submit" class="btn btn-primary">
										  플랜 생성하기
										</button>
			                        </form>
		                        </div>
		                    </div>
                            <br><br><br><br>
                            <p class="f-para">더 많은 플랜을 작성하고 싶다면?</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
 
    </section>
    <!-- Room Details Section End -->
    
<jsp:include page="../include/footer.jsp" />
