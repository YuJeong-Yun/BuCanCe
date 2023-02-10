<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Outlined|
Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/plan/planWrite.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/plan/planWriteModal.css" />


	<!-- 모달 설명창 띄우기 -->
	<div id="plan-write-modal">
	  <div class="modal_body">
		<div class="testimonial-slider owl-carousel">
          <div class="ts-item">
              <img src="${pageContext.request.contextPath }/resources/img/plan/modal1.jpg" alt="설명1" />
              <button class="btn-close-modal">닫기</button>
          </div>
          <div class="ts-item">
              <img src="${pageContext.request.contextPath }/resources/img/plan/modal2.jpg" alt="설명2" />
              <button class="btn-close-modal">닫기</button>
          </div>
          <div class="ts-item">
              <img src="${pageContext.request.contextPath }/resources/img/plan/modal3.jpg" alt="설명3" />
              <button class="btn-close-modal">닫기</button>
          </div>
          <div class="ts-item">
              <img src="${pageContext.request.contextPath }/resources/img/plan/modal4.jpg" alt="설명4" />
              <button class="btn-close-modal">닫기</button>
          </div>
          <div class="ts-item">
              <img src="${pageContext.request.contextPath }/resources/img/plan/modal5.jpg" alt="설명5" />
              <button class="btn-close-modal">닫기</button>
          </div>
      	</div>
	
	  </div>
	</div>
	

	<!--그룹 멤버 보여주기 메뉴-->
	<section class="show-title-btn">
	  <div class="inner">
	    <span class="material-icons-outlined show-title">menu</span>
	  </div>
	</section>
	<!--그룹 멤버-->
	<section class="plan-title">
	  <div class="inner">
	  	<div class="title-content">${grpName }</div>
	  </div>
	</section>



	<!-- 관광지/맛집 상세정보 모달 -->
	<div class="modal fade" id="tourModal" tabindex="-1" aria-labelledby="tourModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
	        <div class="modal-title detail__title" id="tourModalLabel"></div>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <div class="detail__content">
	        	<img class="content__img" alt="" />
	        	<div>
	        		<span class="info">운영시간</span><div class="info-value content__runtime"></div>
	        	</div>
	        	<div>
	        		<span class="info">상세주소</span><div class="info-value content__addr"></div>
	        	</div>
	        	<div>
	        		<span class="info">홈페이지</span><div class="info-value content__homepage"></div>
	        	</div>
	        	<div class="content__content"></div>
	        </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary more">더 보러가기</button>
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
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
            <div class="btn-container">
              <button class="btn--move">저장 경로 확인</button>
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
           	<input type="text" name="search" class="search"  onKeypress="javascript:if(event.keyCode==13) {showSearhResult();}">
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
	                  <li class="tour-item t${tour.num }" onclick="selectTour(event)"  >
	                    <img src="${tour.thumbnail }" alt="" class="content__img" />
	                    <div class="description">
		                    <div class="content__title">${tour.title }</div>
		                    <span class="content__detail" data-bs-toggle="modal" data-bs-target="#tourModal" onclick="showDetailInfo(${tour.num})">
 								상세정보
							</span>
	                    </div>
	                    <input type="hidden" value="${tour.num }" class="num">
	                    <input type="hidden" value="${tour.lng }" class="lng">
	                    <input type="hidden" value="${tour.lat }" class="lat">
	                  </li>
	                </c:forEach>
                </ul>
                <ul class="search-result hidden">
                </ul>
              </div>
            </li>
            <!--숙박-->
            <li class="tour accomodation">
              <div class="tour__title" onclick="selectCategory(event)">
                <div class="material-icons-outlined icon">bed</div>숙소
              </div>
              <div class="tour__contents hidden">
                <ul>
					<li class="loading-icon">로딩중 ... &nbsp;
						<div class="spinner-border spinner-border-sm" role="status">
						  <span class="sr-only">Loading...</span>
						</div>
					</li>
                </ul>
                <ul class="search-result hidden">
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
	                    <img src="${rest.thumbnail }" alt="" class="content__img" />
	                    <div class="description">
		                    <div class="content__title">${rest.title }</div>
		                    <span class="content__detail" data-bs-toggle="modal" data-bs-target="#tourModal" onclick="showDetailInfo(${rest.num})">
 								상세정보
							</span>
	                    </div>
	                    <input type="hidden" value="${rest.num }" class="num">
	                    <input type="hidden" value="${rest.lng }" class="lng">
	                    <input type="hidden" value="${rest.lat }" class="lat">
	                  </li>
	                </c:forEach>
                </ul>
                <ul class="search-result hidden">
                </ul>
              </div>
            </li>
          </ul>
        </div>
      </div>
      
      

      <!--일정별 관광지 선택-->
      <ul class="date-plan-container hidden">
      <!--  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
			<!-- 저장된 플랜 있을 경우 출력 -->
			<c:forEach var="plan" items="${planList }">
				<li class="plan">
				  <!-- 날짜 출력 -->
				  <div class="plan__date" onclick="selectDate(event)">${plan[0] }</div>
				  <div class="plan__contents">
					<ul class="inner">
						<!-- 플랜 출력 -->
					    <c:forEach var="planItem" items="${plan[1] }">
						<li class="plan-item draggable" draggable="true">
						  <div class="tour-wrapper">
								<img src="${planItem.thumbnail }" alt="" class="content__img">
								<div class="content__title">${planItem.title }</div>
								<!-- 호텔 -->
								<c:if test="${planItem.t_category == -1}"> 
									<button class="delBtn" onclick="delSelectedTour(event,'a${planItem.num }')">x</button>
									<input type="hidden" value="a${planItem.num }" class="num">
									<div class="material-icons-outlined hotel">bed</div>
								</c:if>
								<!-- 관광지 -->
								<c:if test="${planItem.t_category == 0}"> 
									<button class="delBtn" onclick="delSelectedTour(event,'t${planItem.num }')">x</button>
									<input type="hidden" value="t${planItem.num }" class="num">
								</c:if>
								<!-- 맛집 -->
								<c:if test="${planItem.t_category == 1}"> 
									<button class="delBtn" onclick="delSelectedTour(event,'r${planItem.num }')">x</button>
									<input type="hidden" value="r${planItem.num }" class="num">
									<div class="material-icons-outlined restaurant">restaurant</div>
								</c:if>
							</div>
						 </li>
						 </c:forEach>
						</ul>
					</div>
				</li>
			</c:forEach>
		<!--  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
		</ul>

      <div class="btn-container hidden">
        <input type="button" value="선택 초기화" class="btn--reset" />
        <div>|</div>
        <input type="button" value="직선 경로 표시" class="btn--line-path" />
        <div>|</div>
      	<input type="button" value="경로 삭제" class="btn--del-path" />
    	<input type="button" value="경로 확인" class="btn--check-path" />
      </div>
    </div>
    <p id="result"></p>
  </section>





<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript">
	const path = '${pageContext.request.contextPath}';
	const grp_num = '${num}';
</script>
<script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xx4c685864b69a4b71966f8bda89ed2dd3"></script>
<script defer src="${pageContext.request.contextPath }/resources/js/plan/planWriteModal.js"></script>
<script defer src="${pageContext.request.contextPath }/resources/js/plan/planWrite.js"></script>
<jsp:include page="../include/footer.jsp"></jsp:include>