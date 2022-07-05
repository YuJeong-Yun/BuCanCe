<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../include/header.jsp" />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  	
  	<c:if test="${ sessionScope.id == null }">
  	    <c:redirect url="${pageContext.request.contextPath }/login" />  	    
  	</c:if>
  	
  	<input type="button" value="로그아웃" onclick=" location.href='/logout'; ">
  	
  	<%
//   	  String id =(String) session.getAttribute("id");
//   	  if(id == null){
//   		  System.out.println("@@@@@@@@@JSP@@@@@@@@@@@");
//   		  response.sendRedirect("/member/login");
//   	  }
  	%>
  	
  	
  	<h3><a href="#">회원정보 조회</a></h3>
  	<h3><a href="#">회원정보 수정</a></h3>
  	<h3><a href="#">회원정보 삭제</a> </h3>
  	
  	<c:if test="${id == 'admin' }">
  		<h3><a href="#"> 회원정보 목록 조회 </a></h3>  	
  	</c:if>
  	
  	

</body>
</html>

<jsp:include page="../include/footer.jsp" />