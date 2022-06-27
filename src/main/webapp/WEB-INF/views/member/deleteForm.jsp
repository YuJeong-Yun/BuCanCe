<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  	<h1>deleteForm.jsp</h1>
  	
  	<fieldset>
  	  <form action="/member/delete" method="post">
  	  	 비밀번호 : <input type="password" name="userpw">
  	  	 <input type="submit" value="회원탈퇴">
  	  </form>  	
  	</fieldset>
  	
  	

</body>
</html>