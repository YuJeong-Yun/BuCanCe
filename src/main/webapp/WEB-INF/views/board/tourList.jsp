<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="../include/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/board.css" type="text/css">


<!-- Breadcrumb Section Begin -->
<div class="breadcrumb-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<h2 class="nanumFont" style="display: inline-block; margin-left: 6em; margin-right: 1em;">부캉스! 어디가지?</h2>
	                <!-- 날씨출력 -->
                    <div id="weatherInfo" style="display: inline-block;"></div>
                    <!-- 날씨출력 -->
                   	<div id="cateMenu" style="position: absolute; left: 43.2%; top: 95%;">
		                    <select id="category" onchange="search()">
								<option>카테고리 선택</option>
								<option value="all">전체보기</option>
								<option value="강서구">강서구</option>
								<option value="금정구">금정구</option>
								<option value="기장군">기장군</option>
								<option value="남구">남구</option>
								<option value="동구">동구</option>
								<option value="동래구">동래구</option>
								<option value="부산진구">부산진구</option>
								<option value="북구">북구</option>
								<option value="사상구">사상구</option>
								<option value="사하구">사하구</option>
								<option value="서구">서구</option>
								<option value="수영구">수영구</option>
								<option value="연제구">연제구</option>
								<option value="영도구">영도구</option>
								<option value="중구">중구</option>
								<option value="해운대구">해운대구</option>
							</select>
					</div> 
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Breadcrumb Section End -->

    <div class="top-nav" style="border-bottom: none; margin-bottom: 1em;">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                     <div class="weatherInfo" style="width: 227.750px; height: 150px;"></div>
                     <button type="button" class="b-btn b-btn-indigo" id="spot" onclick="location.href='/board/tourList?t_category=0&addr=${param.addr}'">관광지</button>
                        <button type="button" class="b-btn b-btn-indigo" id="eating" onclick="location.href='/board/tourList?t_category=1&addr=${param.addr}'">맛집</button>
                    </div>
                    <div class="col-lg-6">
                        <div class="tn-right">
                        	<div id="searchAllMenu">
		                        <i class="fa fa-search" aria-hidden="true"></i>
		                        <input type="text" name="keyword" id="keywordInput" placeholder="검색어를 입력하세요"/>
		                        <button class="w-btn w-btn-indigo" type="submit" id="searchBtn">
									검색
								</button>
							</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	    <div class="top-nav" style="border-bottom: none; margin-bottom: 1em;">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                    </div>
                    <div class="col-lg-6">
                        <div class="tn-right">
                        	<span id="alignText">
		                        <a href="/board/tourAlign?seq=thumbCnt&t_category=${param.t_category }&addr=${param.addr }">추천순▼ | </a>
		                        <a href="/board/tourAlign?seq=commentCnt&t_category=${param.t_category }&addr=${param.addr }">댓글많은순▼ | </a>
		                        <a href="/board/tourAlign?seq=totalCnt&t_category=${param.t_category }&addr=${param.addr }">조회순▼</a>
                       		</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>


<!-- Rooms Section Begin -->
<section class="rooms-section spad">
	<div class="container">
		<div id="b-list" class="row">
			<c:forEach var="vo" items="${boardList }">
				<div class="col-lg-4 col-md-6">
					<div class="room-item">
						<a href="/board/infoDetail?num=${vo.num}&page=${scri.page}&perPageNum=${scri.perPageNum}&t_category=${vo.t_category}&addr=${scri.addr }">
						<img src="${vo.thumbnail }" alt=""></a>
						<div class="info">
							<h4>${vo.title }</h4>
							<div>
								<i class="fa fa-hand-pointer-o" aria-hidden="true"></i>${vo.totalCnt }
								<i class="fa fa-commenting-o" aria-hidden="true"></i>${vo.commentCnt }
								<i class="fa fa-heart-o" aria-hidden="true"></i>${vo.thumbCnt }
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
			<div id="paging" style="text-align: center; padding-top: 20px;">
			<c:if test="${not empty pageMaker }">
					<c:if test="${pageMaker.prev}">
						<a href="tourList${pageMaker.makeSearch(pageMaker.startPage - 1)}&t_category=${param.t_category}&addr=${param.addr}">이전</a>
					</c:if>

					<c:forEach begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}" var="idx">
						<a href="tourList${pageMaker.makeSearch(idx)}&t_category=${param.t_category}&addr=${param.addr}">${idx}</a>
					</c:forEach>

					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<a href="tourList${pageMaker.makeSearch(pageMaker.endPage + 1)}&t_category=${param.t_category}&addr=${param.addr}">다음</a>
					</c:if>
			</c:if>		
			</div>
	</div>
</section>
<!-- Rooms Section End -->
<script type="text/javascript">
	const addr = '${param.addr}';
	const t_category = '${param.t_category}';
</script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/board/Weather.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/board/TourList.js"></script>
<jsp:include page="../include/footer.jsp" />

</html>