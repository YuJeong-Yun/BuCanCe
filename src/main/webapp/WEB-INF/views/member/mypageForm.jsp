<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/memberPage.css" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<body class = "memberBody">
<div class = "memberInputArea">
<div class = memberForm>
	<form action="/member/mypage" method="post">
		<a href = "/member/update">회원정보수정</a>
		<a href = "/member/delete">회원탈퇴</a>
	</form>
	
<div class = "menu-box">
	<ul class = "innerwrap" id ="tab" >
		<li><a href="#">내 그룹</a></li>
		<li><a href="#">일정</a></li>
		<li><a href="/member/favorite">찜한 여행지</a></li>
	</ul>
</div>
	
	
</div>
</div>
</body>
</html>

<%@ include file = "../include/footer.jsp" %>