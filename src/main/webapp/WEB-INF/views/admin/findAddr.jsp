<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소찾기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/admin.css" type="text/css">
</head>
<body>
	<div id="findWrapper">
		<input type="text" placeholder="검색어를 입력해주세요." id="title">
		<button onclick="searchAddr();">검색</button>
	</div>
</body>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin/addTour.js"></script>
</html>