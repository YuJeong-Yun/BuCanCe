<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Outlined|
Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/plan/planContent.css" />




	<!--그룹 멤버 보여주기 메뉴-->
	<section class="show-grp-menu">
	  <div class="container">
	    <span class="material-icons-outlined show-grp">menu</span>
	  </div>
	</section>
	<!--그룹 멤버-->
	<section class="grp-member">
	  <div class="container">
	    <ul class="member-container">
	      <c:forEach var="member" items="${grpMemberList }">
	      	<!-- 방장은 별 표시 -->
	      	<c:if test="">
		     </c:if>
		      <li>
		        <div class="member--profile"><img src="${pageContext.request.contextPath }/resources/img/who.jpg" /></div>
		        <div class="member--id">${member.id }</div>
		        <div class="member--name">${member.name }</div>
		      </li>
	      </c:forEach>
	      <li class="add-member">
	      	<!-- Button trigger modal -->
		    <span class="material-icons-outlined add-group" data-bs-toggle="modal" data-bs-target="#exampleModal">add_circle</span>
	      </li>
	    </ul>
	  </div>
	</section>
	<!-- Modal -->
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
			  <input type="text" class="form-control member-search-input" placeholder="아이디를 입력하세요." aria-label="Recipient's username" aria-describedby="button-addon2">
			  <button class="btn btn-outline-secondary member-serach" type="button" id="button-addon2">검색</button>
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


  <!--플랜 작성-->
  <section class="make-plan">
    <div class="inner">
      <!-- 지도 + 관광지 선택 -->
      <div class="tour-container">
        <div class="tour-map">
          <div class="menu">
            <!--여행 일정 선택-->
            <div class="choice-date">
              <input type="date" name="tour_date_start" class="start-date">
              &nbsp;&nbsp;~&nbsp;&nbsp;
              <input type="date" name="tour_date_end" class="end-date">
              <br>
              <input type="button" value="일정 선택" class="set-date">
            </div>
            <div class="button-container">
              <button class="reset">초기화</button>
              <button class="save">저장</button>
            </div>
          </div>
          <div class="tour-map">
            <div id="map_div">
            </div>        
          </div>
        </div>
        <div class="tour-list-container">
          <!--검색창-->
          <div class="search-container">
            <input type="text" name="search" class="search">
            <span class="material-icons-outlined search-icon">search</span>
          </div>
          <!--관광지 리스트-->
          <ul class="tour-list">
            <!--관광지-->
            <li class="tour">
              <div class="tour__title tour-active" onclick="selectCategory(event)">
                <div class="material-icons-outlined icon">map</div>관광지
              </div>
              <div class="tour__contents">
                <ul>
                  <li class="tour-item tour1" onclick="selectTour(event)">
                    <img src="./img/who.jpg" alt="" class="content__img" />
                    <div class="content__title">식물원입니다.식물원입니다식물원입니다</div>
                    <input type="hidden" value="10" class="num">
                    <input type="hidden" value="30.00" class="lng">
                    <input type="hidden" value="30.00" class="lat">
                  </li>
                </ul>
              </div>
            </li>
            <!--숙박-->
            <li class="tour">
              <div class="tour__title" onclick="selectCategory(event)">
                <div class="material-icons-outlined icon">bed</div>숙소
              </div>
              <div class="tour__contents hidden">
                <ul>
                </ul>
              </div>
            </li>
            <!--맛집-->
            <li class="tour">
              <div class="tour__title" onclick="selectCategory(event)">
                <div class="material-icons-outlined icon">restaurant</div>맛집
              </div>
              <div class="tour__contents hidden">
                <ul>
                </ul>
              </div>
            </li>
          </ul>
        </div>
      </div>

      <!--일정별 관광지 선택-->
      <ul class="date-plan-container">
        <li class="plan">
          <div class="plan__date date-active" onclick="selectDate()">7 / 4</div>
          <div class="plan__contents">
            <ul class="inner">
              <li class="plan-item draggable" draggable="true">
                <div class="tour-wrapper">
                  <img src="./img/who.jpg" alt="" class="content__img" />
                  <div class="content__title">관광지1</div>
                  <button class="delBtn" onclick="delSelectedTour(event, 1)">x</button>
                  <input type="hidden" value="10" class="num">
                </div>
              </li>
              <li class="plan-item draggable">
                <div class="tour-wrapper" draggable="true">
                  <img src="./img/who.jpg" alt="" class="content__img" />
                  <div class="content__title">관광지1</div>
                  <button class="delBtn" onclick="delSelectedTour(event, 1)">x</button>
                  <input type="hidden" value="10" class="num">
                </div>
              </li>
              <li class="plan-item draggable">
                <div class="tour-wrapper" draggable="true">
                  <img src="./img/who.jpg" alt="" class="content__img" />
                  <div class="content__title">관광지1</div>
                  <button class="delBtn" onclick="delSelectedTour(event, 1)">x</button>
                  <input type="hidden" value="10" class="num">
                </div>
              </li>
            </ul>
          </div>
        </li>
        <!-- <li class="plan">
          <div class="plan__date">7 / 4</div>
          <div class="plan__contents" style="display: none;">
            <ul class="container">
              <li>
                <img src="./img/who.jpg" alt="" class="content__img" />
                <div class="content__title">관광지1</div>
              </li>
            </ul>
          </div>
        </li> -->
      </ul>



    </div>
  </section>








<script src="${pageContext.request.contextPath }/resources/js/plan/planContent.js"></script>
<jsp:include page="../include/footer.jsp"></jsp:include>