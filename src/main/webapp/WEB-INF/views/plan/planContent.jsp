<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../include/header.jsp" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Outlined|
Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/plan/planContent.css" />





  <!--그룹 멤버 보여주기 메뉴-->
  <section class="show-grp-menu">
    <div class="inner">
      <span class="material-icons-outlined show-grp">menu</span>
    </div>
  </section>
  <!--그룹 멤버-->
  <section class="grp-member">
    <div class="inner">
      <ul class="member-container">
        <c:forEach var="member" items="${grpMemberList }">
	        <li>
			  <!-- 방장이면 별 표시 -->
			  <c:if test="${plan.leader eq member.id }">
				<span class="material-icons-outlined leader">star</span>
			  </c:if>
	          <div class="member--profile">
			 	<!-- 프로필 있을 경우 -->
			 	<c:if test="${member.profile ne null }">
                    <img src="${pageContext.request.contextPath }${member.profile}"
                    width="60" height="60" style="border-radius : 90px">
                </c:if>
                <!-- 프로필 없을 경우 -->
                <c:if test="${member.profile eq null }">
                   <img src="${pageContext.request.contextPath }/resources/img/profile/profile1.png"
                   width="60" height="60" style="border-radius : 90px">
                </c:if>
	          </div>
	          <div class="member--id">${member.id }</div>
	          <div class="member--name">${member.name }</div>
	        </li>
        </c:forEach>
		<!-- 방장인 경우 -->
		<c:if test="${plan.leader eq sessionScope.id }">
			<!--초대중인 멤버 출력 -->
			<c:forEach var="invitingMember" items="${invitingList }">
				<li>
					<div class="invite-cancle" onclick="inviteCancle(event, '${invitingMember.receiver }');">초대 취소</div>
					<div class="member--id">${invitingMember.receiver}</div>
					<div class="member--name">${invitingMember.name}</div>
				</li>
			</c:forEach>
			<!-- 초대 버튼 출력 -->
			<li class="invite-member">
				<!-- Button trigger modal -->
				<span class="material-icons-outlined add-group" data-bs-toggle="modal" data-bs-target="#exampleModal">add_circle</span>
			</li>
		</c:if>
      </ul>
    </div>
  </section>
  <!-- 회원 초대 Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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



  <!--여행 일정 확인-->
  <section class="tour-plan">
    <div class="inner">
      <!-- 플랜 이름 -->
      <div class="title">${plan.grp_name }</div>
      <div class="description">
      	<div class="desc-title"><span class="material-icons">bookmarks</span>플랜 수정 정보</div>
      	<!-- 마지막 수정시간 -->
      	<div class="last-update">
      	  <f:formatDate value="${plan.lastUpdate }" pattern="yyyy-MM-dd HH:mm"/> 
      	  <!-- 정보 없으면 - 출력 -->
      	  <c:if test="${plan.lastUpdate eq null }">-</c:if>
      	</div>
      	<!-- 마지막 작성자 -->
      	<div class="last-writer">
      	  <strong>${plan.writer }</strong>
      	  <!-- 정보 없으면 - 출력 -->
      	  <c:if test="${plan.writer eq null }">-</c:if>
      	</div>
      </div>

      <ul class="plan-container">
        <!-- 저장된 플랜 없을 경우 출력 -->
      	<c:if test="${planList eq null}">
      		<div class="no-plan">그룹 멤버들과 공유할 플랜을 작성해보세요!</div>
      	</c:if>
      	<!-- 플랜 출력 -->
        <c:forEach var="datePlan"  items="${planList }">
	        <li class="plan">
	          <div class="plan__date">${datePlan[0] }</div>
	          <div class="plan__item">
	            <ul class="item__contents">
	              <c:forEach var="planItem" items="${datePlan[1] }">
		              <li>
		                <img src="${planItem.thumbnail }" alt="" class="item__img" />
		                <div class="item__title">${planItem.title }</div>
		                <span class="material-icons-outlined arrow">arrow_circle_right</span>
		                <!-- 맛집이면 맛집 아이콘 표시 -->
		                <c:if test="${planItem.t_category == 1 }">
   							<div class="material-icons-outlined restaurant">restaurant</div>
		                </c:if>
		                <!-- 숙소이면 숙소 아이콘 표시 -->
		                <c:if test="${planItem.t_category == -1 }">
   							<div class="material-icons-outlined hotel">bed</div>
		                </c:if>
		              </li>
	              </c:forEach>
	            </ul>
	          </div>
	        </li>
        </c:forEach>
      </ul>


	  <div class="btn-container">
        <button class="list-btn" onclick="location.href='/plan/planList';">목록</button>
        <span class="separator">|</span>
        <button class="update-btn" onclick="location.href='/plan/planWrite/${num}';">플랜 수정</button>
        <button class="del-btn" onclick="delPlan(event)">플랜 삭제</button>
      </div>
    </div>
  </section>




<div class="inner">
  <div class="ocean">
    <div class="wave"></div>
    <div class="wave"></div>
  </div>
</div>






<script type="text/javascript">
	const path = '${pageContext.request.contextPath}';
	const grpNum = '${num}';
</script>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"	crossorigin="anonymous"></script>
<script defer src="${pageContext.request.contextPath }/resources/js/plan/planContent.js"></script>
<jsp:include page="../include/footer.jsp"></jsp:include>