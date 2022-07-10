<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../include/header.jsp" />

<!-- Breadcrumb Section Begin -->
<div class="breadcrumb-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12"></div>
		</div>
	</div>
</div>
<!-- 화면 -->
<section class="room-details-section spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<div class="room-details-item">
					<img src="${vo.MAIN_IMG_NORMAL }" alt="">
					<div class="rd-text">
						<div class="rd-title">
							<h3>${vo.MAIN_TITLE }</h3>
							<hr>
							<div class="rdt-right">
								<h4>${vo.SUBTITLE }</h4>
							</div>
							<br> <br> <br>
							<h6>${vo.ITEMCNTNTS }</h6>
							<br> <br> <br>
							<h6>오시는길 : ${vo.TRFC_INFO }</h6>
							<br> <br> <br>
							<h6>이용시간 : ${vo.USAGE_DAY_WEEK_AND_TIME }</h6>

						</div>

					</div>
				</div>
				<div class="menu-item">
					<div class="nav-menu"
						style="text-align: left !important; cursor: pointer;">
						<nav class="mainmenu">
							<ul>
								<li class="active" id="review"><a>리뷰</a></li>
								<li id="blogReview"><a>블로그리뷰</a></li>
								<li id="loca"><a>위치</a></li>

							</ul>
						</nav>
					</div>
				</div>

				<div class="review-add" id="review-add">
					<div class="rd-reviews" id="blogList" style="display: none;">
					</div>

					<div class="col-lg-12">
						<div class="load-more" style="display: none; cursor: pointer;"
							id="load-more">
							<span class="primary-btn">Load More</span>
						</div>
					</div>
					<br>
					<!-- 댓글 구현 -->
					<div id="comment">
						<ol class="commentList">
							<c:forEach items="${commentList}" var="commentList">
								<p>
									${commentList.writer} /
									<fmt:formatDate value="${commentList.regdate}"
										pattern="yyyy-MM-dd" />
								</p>
								<p>${commentList.content}</p>
								<hr>
							</c:forEach>
						</ol>
					</div>
					<!-- 리뷰 -->
					<div class="review-add">
						<h4>Add Review</h4>
						<p class="rev-radi">
							<input type="radio" id="rev_visit_yn1" name="visit" value="Y"
								checked /> <label for="visit_yn1"> 방문했어요</label>
						</p>
						<p class="rev-radi">
							<input type="radio" id="rev_visit_yn2" name="unvisited" value="N" />
							<label for="visit_yn2"> 방문전입니다</label>
						</p>
					</div>
					<div>

						<form name="commentForm" method="post">
							<input type="hidden" id="num" name="num" value="${read.num}" />
							<input type="hidden" id="page" name="page" value="${scri.page}">
							<input type="hidden" id="perPageNum" name="perPageNum"
								value="${scri.perPageNum}"> <input type="hidden"
								id="searchType" name="searchType" value="${scri.searchType}">
							<input type="hidden" id="keyword" name="keyword"
								value="${scri.keyword}">

							<p>
								<label>댓글 작성자</label> <input type="text" name="id"
									value=" ${id }">
							</p>
							<p>
								<textarea rows="5" cols="50" name="content" id="content"></textarea>
							</p>
							<p>
								<input type="hidden" name="num" value="${vo.num}">
								<button type="button" class="commentWriteBtn">댓글 작성</button>
							</p>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

</section>
<!-- Room Details Section End -->
<jsp:include page="../include/footer.jsp" />


<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	var searchTotal = '';
	var startPage = 1;
	var total = document.getElementsByClassName('ri-text').length + 10;
	var rePageCheck = false;
	var size = 3;

	$(function() {

		$('#blogReview')
				.click(
						function() {

							document.getElementById('review').className = "";
							document.getElementById('loca').className = "";
							document.getElementById('blogReview').className = "active";
							/* document.getElementById('writeReview').style.visibility = 'hidden';
							document.getElementById('map').style.display = 'none';*/
							document.getElementById('blogList').style.display = 'inline-block';
							document.getElementsByClassName('load-more')[0].style.display = 'inline-block';

							if (rePageCheck == false) {
								$
										.ajax({
											url : "/blog/getBlog?title=${vo.MAIN_TITLE}&start=1",
											success : function(data) {
												searchTotal = $(data[1]).get(0);
												$(data[0])
														.each(
																function(i, obj) {
																	$(
																			'.rd-reviews')
																			.append(
																					"<div class='ri-text'><a href="+obj.link+" target='_blank'><h2>"
																							+ obj.title
																							+ "</h2><p>"
																							+ obj.description
																							+ "</p></a></div>");
																});
											}
										});
							}

							rePageCheck = true;

						}); // blogReview

		$('#review')
				.click(
						function() {

							document.getElementById('blogReview').className = "";
							document.getElementById('loca').className = "";
							document.getElementById('review').className = "active";
							document.getElementById('blogList').style.display = 'none';
							document.getElementById('map').style.display = 'none';
							document.getElementsByClassName('load-more')[0].style.display = 'none';
							document.getElementById('writeReview').style.visibility = 'visible';

						}); // review

		function countStartPage() {
			console.log(searchTotal);
			if (total < (searchTotal)) {
				startPage = startPage + 10;
				return startPage;
			} else {
				alert("페이지의 끝입니다.");
			}

		}

		$('#load-more').click(
				function() {
					var start = countStartPage();
					console.log(start);

					$.ajax({
						url : "/blog/getBlog?title=${vo.MAIN_TITLE}&start="
								+ start,
						success : function(data) {
							$(data[0]).each(
									function(i, obj) {
										$('.rd-reviews').append(
												"<div class='ri-text'><a href="+obj.link+" target='_blank'><h2>"
														+ obj.title
														+ "</h2><p>"
														+ obj.description
														+ "</p></a></div>");
									});
						}
					});
					total = total + 10;
					console.log(total);

				});

		// 댓글 
		$(".commentWriteBtn").on("click", function() {
			var formObj = $("form[name='commentForm']");
			formObj.attr("action", "/board/commentWrite");
			formObj.submit();
		});
	}); // jQuery
</script>