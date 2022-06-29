<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../include/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/plan/planList.css" />

	<!-- 타이틀 -->
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
    <!-- 타이틀 -->


	



	<!-- 플랜 생성 -->	
    <section class="room-details-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12"  align="center">
                    <div class="room-details-item">
                        <div class="rd-text">
		                    <div class="room-booking">
		                    	<div class="col-lg-8">
		                    		<!-- 초대 목록 확인 -->
		                    		<p>
										<button class="btn btn-info" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample"
											aria-expanded="false" aria-controls="collapseExample">
											초대 목록 확인
										</button>
									</p>
									<div class="collapse" id="collapseExample">
										<div class="card card-body">
											<c:if test="${grpAcceptList.size() == 0 }">
												<div class="no-accept-list">받은 그룹 초대 내역이 없습니다.</div>
											</c:if>
											<ul class="grp-accept-list">
											<c:forEach var="grpAccept" items="${grpAcceptList }">
												<li>
													<div class="grp--sender">${grpAccept.sender } 님이 <strong>${grpAccept.grp_name }</strong> 에 초대하셨습니다.</div>
													<form action="javascript:void(0)">
														<button class="btn accept" onclick="acceptGrp(event, ${grpAccept.grp_num})">수락</button>
														<button class="btn refusal" onclick="">거절</button>
													</form>
												</li>
											</c:forEach>
											</ul>
										</div>
									</div>
									<!-- 초대 목록 확인 -->
								</div>
		                    	<div class="col-lg-4">
			                        <form action="/plan/planContent" method="post">
			                        	<!-- Button trigger modal -->
										<button class="add-group" type="submit" class="btn btn-primary">
										  플랜 생성하기
										</button>
			                        </form>
		                        </div>
		                    </div>
                            <br>
                            <c:if test="${license eq 'free' }">
                            	<p class="f-para">더 많은 플랜을 작성하고 싶다면?</p>
                            	<a href="javascript:void(0)" class="buy-subscription">프리미엄 회원으로 업그레이드하기</a>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 플랜 생성 -->
    
    
    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath }/resources/js/plan/planList.js"></script>
<jsp:include page="../include/footer.jsp" />
