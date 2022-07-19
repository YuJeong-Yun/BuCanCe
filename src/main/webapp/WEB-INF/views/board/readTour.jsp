<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../include/header.jsp" />
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css"/>
<style>
		textarea {
			width: 100%;
			height: 200px;
			padding: 10px;
			box-sizing: border-box;
			border: solid 2px #1E90FF;
			border-radius: 5px;
			font-size: 16px;
			resize: both;
		}
		input {
			width: 13%;
			height: 20px;
			padding: 10px;
			box-sizing: border-box;
			border: solid 2px #1E90FF;
			border-radius: 5px;
			font-size: 16px;
			resize: both;
		}
	</style>

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
							<i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 찜하기
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
							<td>
							<form name="readForm" role="form" method="post">
 							 <input type="hidden" id="num" name="num" value="${vo.num}" />
 							 <input type="hidden" id="page" name="page" value="${scri.page}"> 
							  <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
  							<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
 							 <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
							</form></td>
							</tr>
						</tbody>
					</table>
					<p class="f-para">${vo.contents }</p>
				</div>
				<div id ="btn_group">
				<button type="button" class="list_btn">목록</button>
				<div class="menu-item">
					<div class="nav-menu" style="text-align: left !important; cursor: pointer;">
						<nav class="mainmenu">
							<ul>
								<li class="active" id="review"><a>리뷰</a></li>
								<li id="blogReview"><a>블로그리뷰</a></li>

							</ul>
						</nav>
					</div>
				</div>
				</div>
				<!-- 댓글 목록 -->
				<div id="comment1">
					<div id="comment">
					<!-- 로그인 안 했을 경우 alert -->
						<ol class="commentList">
							<c:forEach items="${commentList}" var="commentList">
							 <div class="sc-author">
                                   <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQF5muH6piXfKA2yUyMkJwm0mJq6O4lU-1mFA&usqp=CAU" 
                                   width="60" height="60" style="border-radius : 90px"> 
								${commentList.writer}님 &nbsp;&nbsp;
									<fmt:formatDate value="${commentList.regdate}" pattern="yyyy-MM-dd" /> &nbsp;&nbsp;
									<b><c:if test="${commentList.visit==1}">방문했어요</c:if>
										<c:if test="${commentList.visit==0}">방문 전입니다</c:if></b>	
                                </div>
								<p>${commentList.content}</p>
								<div id ="btn_group">
								<c:if test = "${sessionScope.id eq commentList.writer}">
									<button type="button" class="commentModifyBtn" onclick="openUdt()" data-cno="${commentList.cno }">수정</button>
									<button type="button" class="commentDeleteBtn" onclick="openDel()" data-cno="${commentList.cno }">삭제</button>
										</c:if>
								</div>
								<hr>
							</c:forEach>
						</ol>
						<!-- 댓글 작성 -->
						<h4>Add Review</h4>
						<h6>리뷰 작성은 로그인 후 가능합니다 : )</h6>
						<br>
					</div>
					<div>
						<form name="commentForm" method="post">
						
						<p class="rev-radi">
							<input type="radio" id="rev_visit" name="visit" value="1" checked="checked" onchange="visited"> <label for="visit1"> 방문했어요</label><br>
							<input type="radio" id="rev_visit" name="visit" value="0" onchange="visited"> <label for="visit2"> 방문 전입니다</label>
						</p> 
						
							<input type="hidden" name="num" id="num" value="${vo.num}" /> 
							<input type="hidden" id="page" name="page" value="${scri.page}">
							<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
							<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}">
							<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
							
							<div id ="btn_group">
							 <c:if test = "${not empty sessionScope.id }">
							<p>
								<label for="id">댓글 작성자</label> 
								<input type="text" name="id" id="id" value=" ${id }">
							</p>
							<p>
								<textarea rows="5" cols="50" name="content" id="content"></textarea>
							</p>
							<p>
								<button type="button" class="commentWriteBtn">댓글 작성</button>
							</p>
							</c:if>
							</div> 
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
							document.getElementById('blogReview').className = "active";
							document.getElementById('comment1').style.display = 'none';
							document.getElementById('blogList').style.display = 'inline-block';
							document.getElementsByClassName('load-more')[0].style.display = 'inline-block';

							if (rePageCheck == false) {
								$
										.ajax({
											url : "/blog/getBlog?title=${vo.title}&start=1",
											success : function(data) {
												searchTotal = $(data[1]).get(0);
												$(data[0])
														.each(
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
							}

							rePageCheck = true;

						}); // blogReview

		$('#review')
				.click(
						function() {

							document.getElementById('blogReview').className = "";
							document.getElementById('review').className = "active";
							document.getElementById('blogList').style.display = 'none';
							document.getElementById('comment1').style.display = 'block';
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
						url : "/blog/getBlog?title=${vo.title}&start=" + start,
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

	}); // jQuery
	

	
	
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.min.js"></script>




 <script type="text/javascript">
 		 //댓글 작성
		$(".commentWriteBtn").on("click", function() {
			var formObj = $("form[name='commentForm']");
			var test = $(".rev-radi:checked").val();
			formObj.attr("action", "/board/commentWrite");
			formObj.submit();
		});
							
		//댓글 수정 팝업
			$(".commentModifyBtn").on("click", function openUdt(){
				window.name ="updateComment";
			window.open("/board/commentModify?num=${vo.num}"
					+ "&page=${scri.page}"
					+ "&perPageNum=${scri.perPageNum}"
					+ "&searchType=${scri.searchType}"
					+ "&keyword=${scri.keyword}" + "&cno="
					+ $(this).attr("data-cno"), "container", "width=500, height=300, resizable= no, scrollbars= no");
		});
							
	//댓글 삭제 팝업
	$(".commentDeleteBtn").on("click",function openDel() {
		window.name = "deleteComment";
				window.open("/board/commentDelete?num=${vo.num}"
						+ "&page=${scri.page}"
						+ "&perPageNum=${scri.perPageNum}"
						+ "&searchType=${scri.searchType}"
						+ "&keyword=${scri.keyword}" + "&cno="
						+ $(this).attr("data-cno"),"container", "width=500, height=300, resizable= no, scrollbars= no");
	})
	
	
	
		// 목록 
		$(".list_btn").on("click", function(){
		location.href = "/board/list?&page=${scri.page}"
		+"&perPageNum=${scri.perPageNum}"
		+"&searchType=${scri.searchType}&keyword=${scri.keyword}&t_category=0";
		});

</script> 


