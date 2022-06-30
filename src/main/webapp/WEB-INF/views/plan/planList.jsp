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
		                    	<!-- 초대 목록 확인 -->
		                    	<section class="invitation-list">
			                    	<div class="col-lg-8">
			                    		<p>
											<button class="btn btn-info" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample"
												aria-expanded="false" aria-controls="collapseExample">
												초대 목록 확인
											</button>
											<span class="acceptListCnt">${grpAcceptList.size() }</span>
										</p>
										<c:if test="${(license eq 'free' and grpList.size() < 1) || (license eq 'premium' and grpList.size() < 10) }">
										<div class="collapse" id="collapseExample">
											<div class="card card-body acceptListBox">
												<c:if test="${grpAcceptList.size() == 0 }">
													<div class="no-accept-list">받은 그룹 초대 내역이 없습니다.</div>
												</c:if>
												<ul class="grp-accept-list">
												<c:forEach var="grpAccept" items="${grpAcceptList }">
													<li>
														<div class="grp--sender">${grpAccept.sender } 님이 <strong>${grpAccept.grp_name }</strong> 에 초대하셨습니다.</div>
														<form action="javascript:void(0)">
															<button class="btn accept" onclick="acceptGrp(event, ${grpAccept.grp_num})">수락</button>
															<button class="btn refusal" onclick="refuseGrp(event, ${grpAccept.grp_num})">거절</button>
														</form>
													</li>
												</c:forEach>
												</ul>
											</div>
										</div>
										</c:if>
										<!-- 생성 가능한 최대 플랜 수인 경우 초대 받을 수 없음 -->
										<c:if test="${(license eq 'free' and grpList.size() >= 1) || (license eq 'premium' and grpList.size() == 10) }">
											<div class="collapse" id="collapseExample">
												<div class="card card-body acceptListBox">
													<div class="no-accept-list">생성 가능한 최대 플랜 수 입니다.<br>초대를 받을 수 없습니다.</div>
												</div>
											</div>
										</c:if>
									</div>
								</section>
								<!-- 초대 목록 확인 -->
								<!-- 플랜 생성 -->
								<section class="new-plan">
			                    	<div class="col-lg-4">
				                        <form action="/plan/planContent" method="post">
				                        	<c:if test="${(license eq 'free' and grpList.size() == 0) or (license eq 'premium' and grpList.size() < 10)}">
					                        	<!-- Button trigger modal -->
												<button type="button" class="add-group" data-bs-toggle="modal" data-bs-target="#exampleModal">
												  플랜 생성하기
												</button>
											</c:if>
											<!-- Modal -->
											<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
											  <div class="modal-dialog">
											    <div class="modal-content">
											      <div class="modal-header">
											        <h5 class="modal-title" id="exampleModalLabel">Plan Name</h5>
											      </div>
											      <div class="modal-body">
											        <div class="input-group input-group-sm mb-3">
													  <input type="text" name="grp_name" placeholder="플랜명을 작성하세요" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
													</div>
											      </div>
											      <div class="modal-footer">
											        <input type="submit" class="btn btn-primary" data-bs-dismiss="modal" value="확인">
											      </div>
											    </div>
											  </div>
											</div>
				                        </form>
			                        </div>
			                    </section>
		                        <!-- 플랜 생성 -->
		                        <!-- 플랜 목록 -->
		                        <section class="plan-list">
			                    	<div class="col-lg-6">
			                    		<ul class="plan-container">
			                    			<c:forEach var="grp" items="${grpList }">
			                    				<li class="${grp.grp_num }">
					                    			<input type="button" class="plan" value="${grp.grp_name }" onclick="location.href='/plan/planContent/${grp.grp_num }';">
				                    			</li>
			                    			</c:forEach>
		                    			</ul>
			                    	</div>
		                    	</section>
		                    	<!-- 플랜 목록 -->
		                    </div>
		                    
		                    
		                    
                            <br>
                            <!-- 구독권 구매 이동 -->
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
<script type="text/javascript">
	//무료 회원일 경우 최신 1개 빼고 선택 불가 처리(유료->무료 전환됐을 경우 이전 플랜은 삭제하지 않고 표시해줌)
	const license = '${license}';
	const planButtons = document.querySelectorAll('.plan-container li input');
	
	if(license == "free") {
		for (let i = 1; i < planButtons.length; i++) {
			planButtons[i].disabled = 'true';
			planButtons[i].style.backgroundColor = '#777';
			planButtons[i].style.color = '#ddd';
			planButtons[i].style.cursor = 'not-allowed';
			
		} // for
	};
</script>
<jsp:include page="../include/footer.jsp" />
