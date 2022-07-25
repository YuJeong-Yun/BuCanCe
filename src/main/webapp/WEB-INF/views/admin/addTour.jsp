<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<jsp:include page="../include/headerAdmin.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/admin.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/sb-admin-2.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/sb-admin-2.min.css" type="text/css">

	    <div id="wrapper">
		<jsp:include page="../include/sideMenuAdmin.jsp" />
		
		<div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">관광/맛집 게시글 작성</h1>
                            </div>
                            <form class="user" name="fr" method="post">
                            	<div id="formRadio">
	                                  <input type="radio" value="0" checked="checked" name="category"> 관광지 &nbsp;&nbsp;&nbsp;&nbsp;                            
	                                  <input type="radio" value="1" name="category"> 맛집
	                            </div>      
                                <div class="form-group">
                                        <input type="text" class="form-control form-control-user" name="title" placeholder="글제목">
                                </div>
                                        <textarea cols="5" rows="7" class="form-control form-control-user" id="ta" placeholder="글내용" name="contents"></textarea>
                                <div class="form-group row">
                                	<div class="col-sm-3 mb-3 mb-sm-0">
                                    <input type="text" class="form-control form-control-user" name="addr" id="addr1" placeholder="주소검색" onclick="findAddr()" readonly>
                                    </div>
                                    <div class="col-sm-9">
                                    <input type="text" class="form-control form-control-user" name="addr_full" id="addr2" placeholder="주소검색" onclick="findAddr()" readonly>
                                    </div>
                                </div>
                                <div class="form-group">
                                        이미지 첨부 : &nbsp;&nbsp;&nbsp;<input type="text" class="form-control form-control-user" value="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjA2MjJfMjA3%2FMDAxNjU1ODYyMTU5NTY0.nq2f6teqRKAUnqw57Uy-Q_vL0boXESRjEeG8Re8elLMg.RBT2fBKkPIfAHQw-uoNv8F8IBbut0mYDdeJNkaIu8Dwg.JPEG.ys60247%2FIMG_7874.jpg&type=sc960_832" name="img">
                                </div>
                                <div class="form-group" id="last">
                                        썸네일 첨부 : &nbsp;&nbsp;&nbsp;<input type="text" class="form-control form-control-user" value="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjA2MjJfMjA3%2FMDAxNjU1ODYyMTU5NTY0.nq2f6teqRKAUnqw57Uy-Q_vL0boXESRjEeG8Re8elLMg.RBT2fBKkPIfAHQw-uoNv8F8IBbut0mYDdeJNkaIu8Dwg.JPEG.ys60247%2FIMG_7874.jpg&type=a340" name="thumbnail"><br><br>
                                 </div>
                                <div id="menu" onclick="addMenu();"><a>항목 추가하기 ▼</a></div>
                                   <ul id="sideUl">
								      <li id="convenientli" value="convenient">편의시설</li>
								      <li id="priceli" value="price">가격정보</li>
								      <li id="telli" value="tel">전화번호</li>
								      <li id="trfc_infoli" value="trfc_info">교통정보</li>
								      <li id="hldy_infoli" value="hldy_info">휴무일</li>
								      <li id="subtitleli" value="subtitle">부제목</li>
								      <li id="usage_dayli" value="usage_day">운영시간</li>
								      <li id="urlli" value="url">사이트주소</li>
								    </ul>
							</form>
                        </div>
							<hr>
							<button type="button" class="w-btn" id="upload" onclick="uploadContent();">업로드하기</button>
                    </div>
                </div>
            </div>
        </div>

    </div>


    </div>
    
<script type="text/javascript">
	const result = '${param.result}';

</script>    
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin/addTour.js"></script>
<jsp:include page="../include/footer.jsp" />
