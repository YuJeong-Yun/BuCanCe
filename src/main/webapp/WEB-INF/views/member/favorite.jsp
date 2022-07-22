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
<script type = "text/javascript">

function deleteThumb(){

	$.ajax({
	        url:'/deleteThumb', //Controller에서 인식할 주소
 	        type:'GET', //POST 방식으로 전달
	        data:{b_num:b_num},
 	        success:function(){
 	        	alert("찜 취소 성공");
 	        	location.href="/favorite";
 	        },
			error:function(error){
				alert("찜 취소 실패");
			}
	})
	};

</script>
	<!-- 1조건 : 세션에 저장된 id값과 thumb 테이블에 저장된 _id 값이 동일 -->
	<!-- 2조건 : thumb 테이블의 B_num과 tourist_spot 테이블의 num 컬럼값이 같고(and) -->
	<!-- 3조건 : thumb 테이블의 b_category와 tourist_spot 테이블의 t_category 값이 같아야됨. -->
	
<!-- Breadcrumb Section End -->

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