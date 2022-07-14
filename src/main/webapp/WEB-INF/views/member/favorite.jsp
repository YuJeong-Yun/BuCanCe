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
window.onload = function thumbBase(){
	var checkLog = $("#checkLogin");
        if(${memberVO.id } != {id}){
			checkLog.html("<b>정보가 없습니다.</b>");
		}
};

</script>
	<!-- 1조건 : 세션에 저장된 id값과 thumb 테이블에 저장된 _id 값이 동일 -->
	<!-- 2조건 : thumb 테이블의 B_num과 tourist_spot 테이블의 num 컬럼값이 같고(and) -->
	<!-- 3조건 : thumb 테이블의 b_category와 tourist_spot 테이블의 t_category 값이 같아야됨. -->
	
<!-- Breadcrumb Section Begin -->
<div class="breadcrumb-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<h2>favorite.jsp</h2>

				</div>
			</div>
		</div>
	</div>
</div>
<!-- Breadcrumb Section End -->

<!-- Rooms Section Begin -->
<section class="rooms-section spad">
	<div class="container">
		<div id="b-list" class="row">

			<c:forEach var="vo" items="${boardList }">
				<div class="col-lg-4 col-md-6">
					<div class="room-item">
						<a href="/board/read?num=${vo.num }"><img
							src="${vo.thumbnail }" alt=""></a>
						<div class="ri-text">
							<h4>${vo.title }</h4>
							<div>
								<i class="fa fa-hand-pointer-o" aria-hidden="true"></i>${vo.totalCnt }
								<i class="fa fa-commenting-o" aria-hidden="true"></i> ${vo.commentCnt }
									 <i class="fa fa-heart-o" aria-hidden="true"></i>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>

</div>
			<div class="box-footer clearfix">
				<div>
					<ul>
						<c:if test="${pageMaker.prev}">
							<li><a
								href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
						</c:if>

						<c:forEach begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}" var="idx">
							<li><a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
						</c:forEach>

						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a
								href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
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
			$.ajax({
				url : 'http://localhost:8088/board/ajaxListByCategory',
				type : 'get',
				data : {
					category : c
				},
				success : function(list) {
					$('#b-list').empty();
				 if(list[list.length-1].totalCount < list[list.length-1].cri.perPageNum){
						$('.clearfix').attr("hidden","true");
					}else{
						$('.clearfix').removeAttr("hidden");
					}
				 
					$.each(list, function(index, item) {
						if((list.length-1) !=index){
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
				+ '<i class="fa fa-hand-pointer-o" aria-hidden="true"></i> 조회수 <i class="fa fa-commenting-o" aria-hidden="true"></i> 댓글'
				+ '<i class="fa fa-heart-o" aria-hidden="true"></i>' + '</div>'
				+ '</div>' + '</div>' + '</div>';
	}
</script>

  <script  type="text/javascript">
      $(function(){
        $('#searchBtn').click(function() {
          self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
        });
      });   
    </script>
</html>