<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<jsp:include page="../include/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/board.css" type="text/css">	
	 
	

    <!-- Room Details Section Begin -->
    <!-- DB 정보 출력 -->

    <section class="room-details-section spad">
        <div class="container">
            <div class="row">
                    <div class="room-details-item">
                    	<div id="imageZone">
                    		<img src="${resVO.img }">
    					</div>
    				<div class="rd-text">	
                        <div class="rd-title">
                            <h3 style="font-family: 'NanumSquareBold' !important;">${resVO.title }</h3>
                        </div>
                      <table id="resInfo">
                                <tbody>
                                    <tr>
                                        <td class="r-o">전화번호</td>
                                        <td>${resVO.tel }</td>
                                    </tr>
                                    <tr>
                                        <td class="r-o">운영시간</td>
                                        <td>${resVO.usage_day }</td>
                                    </tr>
                                    <tr>
                                        <td class="r-o">상세주소</td>
                                        <td>${resVO.addr_full }</td>
                                    </tr>
                                    <tr>
                                        <td class="r-o">찜하기</td>
                                        <td><button type="button" id="updateThumb">
                            				<img id="like_img" src="${pageContext.request.contextPath}/resources/img/busan/empty_heart.png">
                            				</button>
                            			</td>
                                    </tr>
                                </tbody>
                     </table>
                     <p class="f-para">${resVO.contents }</p>
                     </div>  
                     <div id="btn_group">
                     <button type="button" id="list_btn" class="w-btn w-btn-indigo">목록</button>
                     </div>
                        <br>
                 <!-- DB 정보 출력 -->  
                        
                 <!-- 리뷰 시작 -->       
     			 <div class="menu-item">
                        <div class="nav-menu" style="text-align: left !important; cursor: pointer;">
                            <nav class="mainmenu" id="readMenu">
                                <ul>
                                    <li class="active" id="review"><a>리뷰</a></li>
                                    <li id="blogReview"><a>블로그리뷰</a></li>
                                    <li id="loca"><a>위치</a></li>
                                </ul>
                            </nav>
                        </div>
        		 </div>
                    </div>
                
                <!-- 리뷰 창 -->   
		<!-- 댓글 구현 -->
		<div id="writeReview">
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
						<form name="commentForm" method="post" id="reviewForm">
						
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
								<textarea rows="5" cols="50" name="content" id="contentArea"></textarea>
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
  	                <!-- 리뷰 창 -->      
                    
                    <!-- 블로그 리뷰 출력 -->
                    <div class="review-add" id="review-add">
	                    <div class="rd-reviews" id="blogList" style="display: none;">
	               		</div>
	               		
                         <div class="col-lg-12">
		                    <div class="load-more" style="display: none;" id="load-more">
		                    	<span class="primary-btn">Load More</span>
		                    </div>
	               		</div>
                    <!-- 블로그 리뷰 출력 -->
                       </div>
                    <!-- 위치 지도 출력 -->
	               		<div id="map" style="width:100%;height:550px; display: none;"></div>
                    <!-- 위치 지도 출력 -->
                        <!-- 리뷰 끝 -->
                    </div>
            </div>
    </section>
   
   <!-- Room Details Section End -->
	<script type="text/javascript">
	const path = '${pageContext.request.contextPath}';
	const b_num = '${resVO.num}';
	const t_category = '${resVO.t_category}';
	const title = '${resVO.title}';
	const addr = '${resVO.addr}';
	const addr2 = '${param.addr}';
	const lat = '${resVO.lat}';
	const lng = '${resVO.lng}';
	const id = '${sessionScope.id}';
	const page = "${scri.page}";
	const perPageNum = "${scri.perPageNum}";
	</script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5b3d692ed9e41ded5eedc5a2578cee55&libraries=services"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/board/InfoDetail.js"></script>
	<jsp:include page="../include/footer.jsp" />