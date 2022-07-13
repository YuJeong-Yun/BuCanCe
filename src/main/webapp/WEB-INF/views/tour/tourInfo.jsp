<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../include/header.jsp" />
<jsp:include page="${pageContext.request.contextPath}/resources/js/getWeather.jsp"></jsp:include>



        
    <!-- Breadcrumb Section Begin -->
    <div class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2 class="nanumFont" style="display: inline-block;">${addr }</h2>
                        <div id="cateMenu" style="position: absolute; left: 44.2%; top: 95%;">
		                    <select id="category" name="searchType" onchange="search()">
								<option value="tc"
									<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>카테고리 선택</option>
								<option value="강서구" value2="tc" <c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>강서구</option>
								<option value="강서구"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>강서구</option>
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
								<!-- <option value="연제구">연제구</option> -->
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
                     <div id="weatherInfo" style="display: inline-block;"></div>
                    </div>
                    <div class="col-lg-6">
                        <div class="tn-right">
                        	<div id="searchMenu">
		                        <i class="fa fa-search" aria-hidden="true"></i>
		                        <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"  placeholder="검색어를 입력하세요"/>
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
                        <button type="button" class="b-btn b-btn-indigo" id="spot" onclick="location.href='/board/list'">관광지</button>
                        <button type="button" class="b-btn b-btn-indigo" id="eating" onclick="location.href='/tourInfo?addr=${addr}'">맛집</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    <!-- Rooms Section Begin -->
    <section class="rooms-section spad">
        <div class="container">
            <div class="row">
                <c:forEach var="vo" items="${resVO }">
                <div class="col-lg-4 col-md-6">
                    <div class="room-item">
                        <a href="/infoDetail?title=${vo.title }"><img src="${vo.thumbnail }" alt=""></a>
                        <div class="info">
                            <h4>${vo.title }</h4>
                            <div>
	                            <i class="fa fa-hand-pointer-o" aria-hidden="true"></i> ${vo.totalCnt }
	                            <i class="fa fa-commenting-o" aria-hidden="true"></i> ${vo.commentCnt }
	                            <i class="fa fa-heart-o" aria-hidden="true"></i> ${vo.thumbCnt }
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </section>
    <!-- Rooms Section End -->
<jsp:include page="../include/footer.jsp" />

</html>