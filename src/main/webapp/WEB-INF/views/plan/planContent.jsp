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
        <li>
          <div class="member--profile"><img src="img/who.jpg" /></div>
          <div class="member--id">yun1</div>
          <div class="member--name">유정</div>
        </li>
        <li>
          <div class="member--profile"><img src="img/who.jpg" /></div>
          <div class="member--id">yun1</div>
          <div class="member--name">유정</div>
        </li>
        <li>
          <div class="member--profile"><img src="img/who.jpg" /></div>
          <div class="member--id">yun1</div>
          <div class="member--name">유정</div>
        </li>
        <li class="add-member">
          <span class="material-icons-outlined">add_circle</span>
        </li>
      </ul>
    </div>
  </section>



  <!--여행 일정 확인-->
  <section class="tour-plan">
    <div class="inner">
      <div class="title">부캉스</div>

      <ul class="plan-container">
        <li class="plan">
          <div class="plan__date">7/24</div>
          <div class="plan__item">
            <ul class="item__contents">
              <li>
                <img src="./img/who.jpg" alt="" class="item__img" />
                <div class="item__title">타이틀입니다. 수산원타이틀입니다. 수산원타이틀입니다. 수산원타이틀입니다. 수산원</div>
                <span class="material-icons-outlined arrow">arrow_circle_right</span>
              </li>
              <li>
                <img src="./img/who.jpg" alt="" class="item__img" />
                <div class="item__title">타이틀입니다. 수산원타이틀입니다. 수산원타이틀입니다. 수산원타이틀입니다. 수산원</div>
                <span class="material-icons-outlined arrow">arrow_circle_right</span>
              </li>
              <li>
                <img src="./img/who.jpg" alt="" class="item__img" />
                <div class="item__title">타이틀입니다. 수산원타이틀입니다. 수산원타이틀입니다. 수산원타이틀입니다. 수산원</div>
                <span class="material-icons-outlined arrow">arrow_circle_right</span>
              </li>
              <li>
                <img src="./img/who.jpg" alt="" class="item__img" />
                <div class="item__title">타이틀입니다. 수산원타이틀입니다. 수산원타이틀입니다. 수산원타이틀입니다. 수산원</div>
                <span class="material-icons-outlined arrow">arrow_circle_right</span>
              </li>
              <li>
                <img src="./img/who.jpg" alt="" class="item__img" />
                <div class="item__title">타이틀입니다. 수산원타이틀입니다. 수산원타이틀입니다. 수산원타이틀입니다. 수산원</div>
                <span class="material-icons-outlined arrow">arrow_circle_right</span>
              </li>
              <li>
                <img src="./img/who.jpg" alt="" class="item__img" />
                <div class="item__title">타이틀입니다. 수산원타이틀입니다. 수산원타이틀입니다. 수산원타이틀입니다. 수산원</div>
                <span class="material-icons-outlined arrow">arrow_circle_right</span>
              </li>
              <li>
                <img src="./img/who.jpg" alt="" class="item__img" />
                <div class="item__title">타이틀입니다. 수산원타이틀입니다. 수산원타이틀입니다. 수산원타이틀입니다. 수산원</div>
                <span class="material-icons-outlined arrow">arrow_circle_right</span>
              </li>
              </li>
              <li>
                <img src="./img/who.jpg" alt="" class="item__img" />
                <div class="item__title">타이틀입니다. 수산원타이틀입니다. 수산원타이틀입니다. 수산원타이틀입니다. 수산원</div>
                <span class="material-icons-outlined arrow">arrow_circle_right</span>
              </li>
              </li>
              <li>
                <img src="./img/who.jpg" alt="" class="item__img" />
                <div class="item__title">타이틀입니다. 수산원타이틀입니다. 수산원타이틀입니다. 수산원타이틀입니다. 수산원</div>
                <span class="material-icons-outlined arrow">arrow_circle_right</span>
              </li>
            </ul>
          </div>
        </li>

        <li class="plan">
          <div class="plan__date">7/24</div>
          <div class="plan__item">
            <ul class="item__contents">
              <li>
                <img src="./img/who.jpg" alt="" class="item__img" />
                <div class="item__title">관광지명</div>
              </li>
              <li>
                <img src="./img/who.jpg" alt="" class="item__img" />
                <div class="item__title">관광지명</div>
              </li>
            </ul>
          </div>
        </li>
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
</script>
<script src="${pageContext.request.contextPath }/resources/css/plan/planContent.js?v=<%=System.currentTimeMillis() %>"></script>
<jsp:include page="../include/footer.jsp"></jsp:include>