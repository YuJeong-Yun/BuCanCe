<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="../include/header.jsp" />
<html>
<style type="text/css">
li {
	list-style: none;
	float: left;
	padding: 6px;
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
				<select id="category" name="category" onchange="search()">
					<option value="전체">카테고리 선택</option>
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
			<input type="text" class="form-control" placeholder="검색어를 입력하세요">
		</div>
		<div class="input-group-btn">
			<button class="btn btn-default" type="submit">
				검색 <i class="glyphicon glyphicon-search"></i>
			</button>
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
						<a href="/board/read?num=${vo.num }"><img
							src="${vo.MAIN_IMG_THUMB }" alt=""></a>
						<div class="ri-text">
							<h4>${vo.PLACE }</h4>
							<div>
								<i class="fa fa-hand-pointer-o" aria-hidden="true"></i>${vo.totalCount }<i
									class="fa fa-commenting-o" aria-hidden="true"></i> 댓글 <i
									class="fa fa-heart-o" aria-hidden="true"></i>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
			<div class="box-footer clearfix">
				<ul>
					<c:if test="${pageMaker.prev}">
						<li><a href="list?page=${pageMaker.startPage - 1}">이전</a></li>
					</c:if>

					<c:forEach begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}" var="idx">
						<li
							<c:out value=" ${pageMaker.cri.page == idx? 'class=active':''}"/>>
							<a href="list?page=${idx}">${idx}</a>
						</li>
					</c:forEach>

					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li><a href="list?page=${pageMaker.endPage + 1}">다음</a></li>
					</c:if>
				</ul>
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
						$('#b-list').append(listHTML);

					});
				},
				error : function(err) {
					console.log(err);
				}
			});
		} else {
			$.ajax({
				url : 'http://localhost:8088/board/ajaxListByCategory',
				type : 'get',
				data : {
					category : c
				},
				success : function(list) {
					$('#b-list').empty();
					$.each(list, function(index, item) {
						var listHTML = getListHTML(item);
						$('#b-list').append(listHTML);

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
				+ '"><img src="'+obj.main_IMG_THUMB+'" alt=""></a>'
				+ '<div class="ri-text">'
				+ '<h4>'
				+ obj.place
				+ '</h4>'
				+ '<div>'
				+ '<i class="fa fa-hand-pointer-o" aria-hidden="true"></i> 조회수 <i class="fa fa-commenting-o" aria-hidden="true"></i> 댓글'
				+ '<i class="fa fa-heart-o" aria-hidden="true"></i>' + '</div>'
				+ '</div>' + '</div>' + '</div>';
	}
</script>
</html>