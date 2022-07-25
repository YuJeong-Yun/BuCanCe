<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="../include/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/board.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/member.css" type="text/css">


<!-- Breadcrumb Section Begin -->
<div class="breadcrumb-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<h2 class="nanumFont" >나의 찜목록</h2>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Breadcrumb Section End -->

<section class="rooms-section spad">
	<div class="container">
		<div id="b-list" class="row">
			<c:forEach var="vo" items="${thumbList }">
				<div class="col-lg-3 col-md-6">
					<div class="room-item" id="thumbItem">
						<img src="${vo.thumbnail }" id="thumbnail">
						<span id="thumbX" onclick="javascript:delCheck(${vo.num});">🗙</span>
						<div class="info">
							<h4><a href="/board/infoDetail?num=${vo.num}&page=${scri.page}&perPageNum=${scri.perPageNum}&t_category=${vo.t_category}&addr=favorite" id="thumbA">${vo.title }</a></h4>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<div id="paging" style="text-align: center; padding-top: 20px;">
	<c:if test="${not empty pageMaker }">
			<c:if test="${pageMaker.prev}">
				<a href="favorite${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a>
			</c:if>

			<c:forEach begin="${pageMaker.startPage}"
				end="${pageMaker.endPage}" var="idx">
				<a href="favorite${pageMaker.makeSearch(idx)}">${idx}</a>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<a href="favorite${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a>
			</c:if>
	</c:if>		
	</div>
</section>
<!-- Rooms Section End -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/member/favorite.js"></script> 
<jsp:include page="../include/footer.jsp" />

</html>