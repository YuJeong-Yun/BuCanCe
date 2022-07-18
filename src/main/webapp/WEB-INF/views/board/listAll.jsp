<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="../include/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css"/>
<html>
<style type="text/css">
.paging a {
	font-size: 16px;
	color: #707079;
	border: 1px solid #EFD4B9;
	border-radius: 2px;
	padding: 7px 13px 5px;
	margin-right: 7px;
	display: inline-block;
}

</style>
<!-- Breadcrumb Section Begin -->
<div class="breadcrumb-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<h2>부산관광명소</h2>

				</div>
			</div>
		</div>
	</div>
</div>
<!-- Breadcrumb Section End -->
<div>
	<form class="navbar-form">
		<div class="input-group">
			<div class="form-group navbar-left">
				<select id="category" class="category" name="searchType"
					onchange="search()">
					<option value="tc"
						<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>카테고리 선택</option>
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
					<!-- <option value="연제구">연제구</option> -->
					<option value="영도구">영도구</option>
					<option value="중구">중구</option>
					<option value="해운대구">해운대구</option>
				</select>
			</div>
		<div class="search-box">
			<input type="text" name="keyword" id="keywordInput" class="search" value="${scri.keyword}" placeholder="검색어를 입력하세요" />
			<button class="BTN" type="submit" id="searchBtn"><i class="fa fa-search" aria-hidden="true"></i>
			</button>
		</div>
		</div>
	</form>
</div>
<!-- Rooms Section Begin -->
<section class="rooms-section spad">
	<div class="container">
		<div id="b-list" class="row">
			<c:forEach var="vo" items="${boardList }">
				<div class="col-lg-4 col-md-6">
					<div class="room-item">
						<a href="/board/read?num=${vo.num}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}">
						<img src="${vo.thumbnail }" alt=""></a>
						<div class="ri-text">
						<h4><c:out value="${vo.title}" /></h4> 
							<div>
								<i class="fa fa-hand-pointer-o" aria-hidden="true"></i>${vo.totalCnt }
								<i class="fa fa-commenting-o" aria-hidden="true"></i>
								${vo.commentCnt } <i class="fa fa-heart-o" aria-hidden="true"></i>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="box-footer clearfix">
			<div class = "paging" style="text-align: center; padding-top: 20px;">
					<c:if test="${pageMaker.prev}">
						<a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a>
					</c:if>
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
					</c:forEach>
					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a>
					</c:if>
			</div>
			<div></div>
		</div>
	</div>
</section>
<!-- Rooms Section End -->
<jsp:include page="../include/footer.jsp" />

<script>
	$(document).ready(function() {

	});

	function search() {
		let c = $('#category option:selected').val();

		if (c == '전체') {
			$.ajax({
				url : 'http://localhost:8088/board/ajaxListAll',
				type : 'get',
				data : {},
				success : function(list) {
					$('#b-list').empty();
					$.each(list, function(index, item) {
						var listHTML = getListHTML(item);
						console.log(item);
						if ((list.length - 1) == index) {
						} else {
							$('#b-list').append(listHTML);

						}
					});
				},
				error : function(err) {
					console.log(err);
				}
			});
		} else {
			$
					.ajax({
						url : 'http://localhost:8088/board/ajaxListByCategory',
						type : 'get',
						data : {
							category : c
						},
						success : function(list) {
							$('#b-list').empty();
							if (list[list.length - 1].totalCount < list[list.length - 1].cri.perPageNum) {
								$('.clearfix').attr("hidden", "true");
							} else {
								$('.clearfix').removeAttr("hidden");
							}

							$.each(list, function(index, item) {
								if ((list.length - 1) != index) {
									var listHTML = getListHTML(item);
									$('#b-list').append(listHTML);
								}

							});
						},
						error : function(err) {
						}
					});
		}
	}
	function getListHTML(obj) {

		return '<div class="col-lg-4 col-md-6">'
				+ '<div class="room-item">'
				+ '<a href="/board/read?num='
				+ obj.num
				+ '"><img src="'+obj.thumbnail+'" alt=""></a>'
				+ '<div class="ri-text">'
				+ '<h4>'
				+ obj.title
				+ '</h4>'
				+ '<div>'
				+ '<i class="fa fa-hand-pointer-o" aria-hidden="true"></i> '+obj.totalCnt+' <i class="fa fa-commenting-o" aria-hidden="true"></i> '+obj.commentCnt+''
				+ '<i class="fa fa-heart-o" aria-hidden="true"></i>' + '</div>'
				+ '</div>' + '</div>' + '</div>';
	}
</script>

<script type="text/javascript">
	$(function() {
		$('#searchBtn').click(
				function() {
					self.location = "list" + '${pageMaker.makeQuery(1)}'
							+ "&searchType="
							+ $("select option:selected").val() + "&keyword="
							+ encodeURIComponent($('#keywordInput').val());
				});
	});
</script>
</html>