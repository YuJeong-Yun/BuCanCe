<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	          <div class="member--profile"><img src="${pageContext.request.contextPath }/resources/img/who.jpg" /></div>
	          <div class="member--id">${member.id }</div>
	          <div class="member--name">${member.name }</div>
	        </li>
        </c:forEach>
      </ul>
    </div>
  </section>



  <!--여행 일정 확인-->
  <section class="tour-plan">
    <div class="inner">
      <div class="title">부캉스</div>

      <ul class="plan-container">
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
		                <c:if test="${planItem.t_category == 1 }">
   							<div class="material-icons-outlined restaurant">restaurant</div>
		                </c:if>
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


      <button class="update-btn">플랜 수정</button>
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
	const grp_num = '${num}';
</script>
<script src="${pageContext.request.contextPath }/resources/js/plan/planContent.js?v=<%=System.currentTimeMillis() %>"></script>
<jsp:include page="../include/footer.jsp"></jsp:include>