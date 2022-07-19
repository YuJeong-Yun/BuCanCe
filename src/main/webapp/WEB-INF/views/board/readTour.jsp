<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../include/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/hyejin.css" type="text/css">

<!-- Breadcrumb Section Begin -->
<div class="breadcrumb-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12"></div>
		</div>
	</div>
</div>
<!-- 화면 -->
<!-- Room Details Section Begin -->
<section class="room-details-section spad">
	<div class="container">
		<div class="row">
			<div class="room-details-item">
				<div id="imageZone">
					<img src="${vo.img }">
				</div>
				<div class="rd-text">
					<div class="rd-title">
						<h3 style="font-family: 'NanumSquareBold' !important;">${vo.title }
						</h3>
					</div>
					<table id="resInfo">
						<tbody>
							<tr>
								<td class="r-o">전화번호</td>
								<td>${vo.tel }</td>
							</tr>
							<tr>
								<td class="r-o">운영시간</td>
								<td>${vo.usage_day }</td>
							</tr>
							<tr>
								<td class="r-o">상세주소</td>
								<td>${vo.addr_full }</td>
							</tr>
							<tr>
								<td class="r-o">오시는길</td>
								<td>${vo.trfc_info}</td>
							</tr>
							<tr>
								<td class="r-o">편의</td>
								<td>${vo.convenient}</td>
							</tr>
							<tr>
								<td class="r-o">홈페이지</td>
								<td><a href="${vo.url}">${vo.url }</a></td>
							</tr>
                            <tr>
	                         <td class="r-o">찜하기</td>
	                         <td>
	                         	<button type="button" id="updateThumb">
	             				<img id="like_img" src="${pageContext.request.contextPath}/resources/img/busan/empty_heart.png">
	             				</button>
	             			</td>
                          </tr>
						</tbody>
					</table>
					<p class="f-para">${vo.contents }</p>
				</div>
				<button type="button" id="list_btn" class="w-btn w-btn-indigo">목록</button>
				<div class="menu-item">
					<div class="nav-menu"
						style="text-align: left !important; cursor: pointer;">
						<nav class="mainmenu" id="readMenu">
							<ul>
								<li class="active" id="review"><a>리뷰</a></li>
								<li id="blogReview"><a>블로그리뷰</a></li>
								<li id="loca"><a>위치</a></li>
							</ul>
						</nav>
					</div>
				</div>
				<!-- 댓글 구현 -->
				<div id="comment1">
					<div id="comment">
						<ol class="commentList">
							<c:forEach items="${commentList}" var="commentList">
								<p>
									${commentList.writer} /
									<fmt:formatDate value="${commentList.regdate}"
										pattern="yyyy-MM-dd" />/ 
										<c:if test="${commentList.visit==1}">방문했어요</c:if>
										<c:if test="${commentList.visit==0}">방문 전입니다</c:if>

								</p>
								<p>${commentList.content}</p>
								<div>
									<button type="button" class="commentModifyBtn"
										data-cno="${commentList.cno }">수정</button>
									<button type="button" class="commentDeleteBtn"
										data-cno="${commentList.cno }">삭제</button>
								</div>
								<hr>
							</c:forEach>
						</ol>
						<!-- 리뷰 -->
						<h4>Add Review</h4>
					</div>
					<div>
						<form name="commentForm" method="post">
						
						<p class="rev-radi">
							<input type="radio" id="rev_visit" name="visit" value="1" checked="checked" onchange="visited"> <label for="visit1"> 방문했어요</label><br>
							<input type="radio" id="rev_visit" name="visit" value="0" onchange="visited"> <label for="visit2"> 방문 전입니다</label>
						</p> 
						
							<input type="hidden" name="num" id="num" value="${vo.num}" /> 

							<p>
								<label for="id">댓글 작성자</label> <input type="text" name="id" id="id" value=" ${id }">
							</p>
							<p>
								<textarea rows="5" cols="50" name="content" id="content"></textarea>
							</p>
							<p>
								<button type="button" class="commentWriteBtn">댓글 작성</button>
							</p>
						</form>

					</div>
				</div>
			</div>
		</div>
		<div class="review-add" id="review-add">
			<div class="rd-reviews" id="blogList" style="display: none;"></div>

			<div class="col-lg-12">
				<div class="load-more" style="display: none; cursor: pointer;"
					id="load-more">
					<span class="primary-btn">Load More</span>
				</div>
			</div>
		</div>
	</div>
	<br>

</section>
<!-- Room Details Section End -->
<script type="text/javascript">
const path = '${pageContext.request.contextPath}';
const b_num = '${vo.num}';
const t_category = '${vo.t_category}';
const title = '${vo.title}';
const addr = '${vo.addr}';
const id = '${sessionScope.id}';
</script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/board/InfoDetail.js"></script>
<jsp:include page="../include/footer.jsp" />

<script type="text/javascript">

	
	$(function(){
		
	//댓글 작성
		$(".commentWriteBtn").on("click", function() {
			var formObj = $("form[name='commentForm']");
			var test = $(".rev-radi:checked").val();
			formObj.attr("action", "/board/commentWrite");
			formObj.submit();
		});

		//댓글 수정 View
		$(".commentModifyBtn").on(
				"click",
				function() {
					location.href = "/board/commentModify?num=${vo.num}"
							+ "&page=${scri.page}"
							+ "&perPageNum=${scri.perPageNum}"
							+ "&searchType=${scri.searchType}"
							+ "&keyword=${scri.keyword}" + "&cno="
							+ $(this).attr("data-cno");
				});

		//댓글 삭제 View
		$(".commentDeleteBtn").on(
				"click",
				function() {
					location.href = "/board/commentDelete?num=${vo.num}"
							+ "&page=${scri.page}"
							+ "&perPageNum=${scri.perPageNum}"
							+ "&searchType=${scri.searchType}"
							+ "&keyword=${scri.keyword}" + "&cno="
							+ $(this).attr("data-cno");
	});// 댓글
		// 목록 (수정중)
		$("#list_btn").on("click", function(){
		location.href = "/board/tourAll?page=${scri.page}"
		+"&perPageNum=${scri.perPageNum}"
		+"&t_category=${vo.t_category}";
		});
	}); // JQuery
	

</script>


