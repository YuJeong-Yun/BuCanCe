<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../include/header.jsp" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Outlined|
		Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet">
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
			<div class="col-lg-12" align="center">
				<div class="room-details-item">
					<div class="rd-text">
						<div class="room-booking">
							<!-- 초대 목록 확인 -->
							<section class="invitation-list">
								<div class="col-lg-8">
									<p>
										<button class="btn btn-info" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample"
											aria-expanded="false" aria-controls="collapseExample">초대 목록 확인</button>
										<span class="acceptListCnt">${grpAcceptList.size() }</span>
									</p>
									<div class="collapse" id="collapseExample">
										<div class="card card-body acceptListBox">
											<!-- 받은 초대 내역 없으면 출력  -->
											<c:if test="${grpAcceptList.size() == 0 }">
												<div class="no-accept-list">받은 그룹 초대 내역이 없습니다.</div>
											</c:if>
											<ul class="grp-accept-list">
												<c:forEach var="grpAccept" items="${grpAcceptList }">
													<li>
														<div class="grp--sender">${grpAccept.sender } 님이 <strong>${grpAccept.grp_name }</strong> 에 초대하셨습니다.
														</div>
														<form action="javascript:void(0)">
															<button class="btn accept" onclick="acceptGrp(event, ${grpAccept.grp_num})">수락</button>
															<button class="btn refusal" onclick="refuseGrp(event, ${grpAccept.grp_num})">거절</button>
														</form>
													</li>
												</c:forEach>
											</ul>
										</div>
									</div>

								</div>
							</section>
							<!-- 플랜 생성 -->
							<section class="new-plan">
								<div class="col-lg-4">
									<form action="/plan/addPlan" method="post" name="plan-form" onsubmit="return check();">
										<!-- Button trigger modal -->
										<button type="button" class="add-plan" data-bs-toggle="modal" data-bs-target="#exampleModal">
											플랜 생성하기</button>
										<!-- Modal -->
										<div class="modal fade" id="exampleModal" tabindex="-1"
											aria-labelledby="exampleModalLabel" aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLabel">Plan Name</h5>
													</div>
													<div class="modal-body">
														<div class="input-group input-group-sm mb-3">
															<input type="text" name="grp_name" maxlength="20"
																placeholder="플랜명을 작성하세요" class="form-control grp-name" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
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
							<!-- 플랜 목록 -->
							<section class="plan-list">
								<div class="col-lg-10">
								    <!-- 회원 유형 / 플랜 수 표시 -->
									<div class="plan-cnt">${license} 회원 - <span class="cnt-now"></span> / <span class="cnt-max"></span></div>
									<ul class="plan-container">
										<!-- 소속 그룹 목록 출력 -->
										<c:forEach var="grp" items="${grpList }" varStatus="status">
											<li class="grp${grp.grp_num }">
												<input type="button" class="plan" value="${grp.grp_name }" onclick="location.href='/plan/planWrite/${grp.grp_num }';">
												<ul class="member-container">
													<!-- 해당 그룹 소속된 멤버 출력 -->
													<c:forEach var="member" items="${grpMemberList.get(status.index) }">
														<li>
															<!-- 방장이면 별 표시 -->
															<c:if test="${grp.leader eq member.id }">
																<span class="material-icons-outlined leader">star</span>
															</c:if>
															<div class="member--profile">
																<img src="${pageContext.request.contextPath }/resources/img/who.jpg" />
															</div>
															<div class="member--id">${member.id}</div>
															<div class="member--name">${member.name}</div>
														</li>
													</c:forEach>
													<!-- 방장인 경우 -->
													<c:if test="${grp.leader eq sessionScope.id }">
														<!-- 초대중인 멤버 출력 -->
														<c:forEach var="invitingMember" items="${invitingMemberList.get(status.index) }">
															<li>
																<div class="invite-cancle" onclick="inviteCancle(event, ${grp.grp_num}, '${invitingMember.receiver }');">초대 취소</div>
																<div class="member--id">${invitingMember.receiver}</div>
																<div class="member--name">${invitingMember.name}</div>
															</li>
														</c:forEach>
														<!-- 초대 버튼 출력 -->
														<li class="invite-member">
													      	<!-- Button trigger modal -->
														    <span class="material-icons-outlined add-group" data-bs-toggle="modal" data-bs-target="#exampleModal2" onclick="setGrpNum(${grp.grp_num})">add_circle</span>
														</li>
													</c:if>
												</ul> 
												<!-- 플랜 삭제 버튼 -->
												<div class="material-icons-outlined delete-plan" onclick="delPlan(event, ${grp.grp_num });">clear</div>
											</li>
										</c:forEach>
										<!-- Modal -->
										<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
										  <div class="modal-dialog">
										    <div class="modal-content">
										      <div class="modal-header">
										        <h5 class="modal-title" id="exampleModalLabel">Invite Member</h5>
										        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										      </div>
										      <div class="modal-body">
												<!-- 모달 본문 -->
										        <div class="input-group mb-3"> <!-- 아이디 검색창 -->
												  <input type="text" class="form-control member-search-input" placeholder="아이디를 입력하세요." aria-label="Recipient's username" aria-describedby="button-addon2" onKeypress="javascript:if(event.keyCode==13) {showMember();}">
												  <button class="btn btn-outline-secondary member-serach" type="button" id="button-addon2" onclick="showMember();">검색</button>
												</div>
										       	<ul class="member-list"> <!-- 검색 결과 회원 리스트 -->
												</ul>
										      </div>
										      <div class="modal-footer">
										        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">완료</button>
										      </div>
										    </div>
										  </div>
										</div>
									</ul>
								</div>
							</section>
						</div>



						<br>
						<!-- 구독권 구매 이동 -->
						<c:if test="${license eq 'free' }">
							<p class="f-para">더 많은 플랜을 작성하고 싶다면?</p>
							<a href="javascript:void(0)" class="buy-subscription">프리미엄	회원으로 업그레이드하기</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>



<script type="text/javascript">
	const path = '${pageContext.request.contextPath}';
	//무료 회원일 경우 플랜 최신 1개 빼고 선택 불가 처리(유료->무료 전환됐을 경우 이전 플랜은 삭제하지 않고 표시해줌)
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
	
	
	// 현재 생성된 플랜 수 표시 (무료 0-1개 / 유료 0-10개)
	const grpCnt = '${grpList.size() }';
	const nowCnt = document.querySelector('.plan-cnt .cnt-now');
	const maxCnt = document.querySelector('.plan-cnt .cnt-max');
	
	if(license == "free"){
		maxCnt.innerText = 1;
	}else {
		maxCnt.innerText = 10;
	}
	
	if(license == "free" && grpCnt >= 1 ) {
		nowCnt.innerText = 1;
	} else {
		nowCnt.innerText = grpCnt;
	}
</script>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"	crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath }/resources/js/plan/planList.js"></script>

<jsp:include page="../include/footer.jsp" />
