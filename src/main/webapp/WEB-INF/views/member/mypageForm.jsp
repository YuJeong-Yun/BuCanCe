<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/memberPage.css" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<div id = "memberMypage">
	<a href = "/order/deleteKey" style="float: right;">정기결제 정지</a>
	<section class = "info wid2">
		<form action="/member/mypage" method="post">
			<a href = "/member/update">회원정보수정</a>
			<a href = "/member/delete">회원탈퇴</a>
		</form>
	</section>
	<section class = "memberMenu wid3">
		<ul>
			<li><a href="#">내 그룹</a></li>
			<li><a href="#">일정</a></li>
			<li><a href="/member/favorite">찜한 여행지</a></li>
		</ul>
	</section>
</div>
</body>
</html>

<%@ include file = "../include/footer.jsp" %>
