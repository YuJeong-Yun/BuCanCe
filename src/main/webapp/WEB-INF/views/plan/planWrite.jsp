<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Outlined|
Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/plan/planWrite.css" />




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
		      	<!-- 방장은 별 표시 -->
		      	<c:if test="${leader eq member.id }">
		      		<span class="material-icons-outlined leader">star</span>
			    </c:if>
			    <div class="member--profile"><img src="${pageContext.request.contextPath }/resources/img/who.jpg" /></div>
			    <div class="member--id">${member.id }</div>
			    <div class="member--name">${member.name }</div>
		    </li>
	      </c:forEach>
	    </ul>
	  </div>
	</section>


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
            <div class="btn-container">
              <button class="btn--reset">초기화</button>
              <button class="btn--save">저장</button>
            </div>
          </div>
          <div class="map-wrapper">
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
                	<c:forEach var="tour" items="${tourlist }">
	                  <li class="tour-item t${tour.num }" onclick="selectTour(event)">
	                    <img src="${tour.main_img_thumb }" alt="" class="content__img" />
	                    <div class="content__title">${tour.main_title }</div>
	                    <input type="hidden" value="${tour.num }" class="num">
	                    <input type="hidden" value="${tour.lng }" class="lng">
	                    <input type="hidden" value="${tour.lat }" class="lat">
	                  </li>
	                </c:forEach>
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
                	<c:forEach var="hotel" items="${hotellist }">
	                  <li class="tour-item a${hotel.num }" onclick="selectTour(event)">
	                    <img src="${hotel.img }" alt="" class="content__img" />
	                    <div class="content__title">${hotel.title }</div>
	                    <input type="hidden" value="${hotel.num }" class="num">
	                    <input type="hidden" value="${hotel.lng }" class="lng">
	                    <input type="hidden" value="${hotel.lat }" class="lat">
	                  </li>
	                </c:forEach>
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
                   <c:forEach var="rest" items="${restlist }">
	                  <li class="tour-item r${rest.num }" onclick="selectTour(event)">
	                    <img src="${rest.thumb_img }" alt="" class="content__img" />
	                    <div class="content__title">${rest.title }</div>
	                    <input type="hidden" value="${rest.num }" class="num">
	                    <input type="hidden" value="${rest.lng }" class="lng">
	                    <input type="hidden" value="${rest.lat }" class="lat">
	                  </li>
	                </c:forEach>
                </ul>
              </div>
            </li>
          </ul>
        </div>
      </div>

      <!--일정별 관광지 선택-->
      <ul class="date-plan-container hidden">
      </ul>

      <div class="btn-container">
      	<input type="button" value="최적 경로 찾기" class="best-path">
    	<input type="button" value="길찾기" class="path">
      </div>
    </div>
    <p id="result"></p>
  </section>






<script type="text/javascript">
	const path = '${pageContext.request.contextPath}';
</script>
<script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xx4c685864b69a4b71966f8bda89ed2dd3"></script>
<script src="${pageContext.request.contextPath }/resources/js/plan/planWrite.js"></script>
<jsp:include page="../include/footer.jsp"></jsp:include>