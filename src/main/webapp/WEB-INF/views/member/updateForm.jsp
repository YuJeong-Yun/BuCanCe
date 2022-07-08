<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/memberPage.css" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

window.onload = function checkLi(){
	var liSpan = $("#checkLicense");
        if(${memberVO.license } == 1){
			liSpan.html("<font color='green'><b>현재 구독중입니다.</b></font>");
		} else {
			liSpan.html("<font color='red'><b>구독상태가 아닙니다.</b></font>");
		}
};

</script>
</head>
<body>
		<h1>updateForm.jsp</h1>
		
		<h2>회원정보 수정</h2>
		
		<fieldset>
		<!-- action 속성값이 없는경우 자신의 주소를 호출 -->
    	<form action="/update?id=<%=id %>" method="post" >
    	    아이디 : <input type ="text" name="id" value="${memberVO.id }" readonly><br>
    	    비밀번호 : <input type ="password" name="pw" placeholder="비밀번호를 입력하시오."><br>
    	    이름 : <input type="text" name="user_name" value ="${memberVO.user_name }"><br>
    	    전화번호 : <input type="text" name="tel" value="${memberVO.tel}"><br>
    	    이메일 : <input type="text" name="email" value="${memberVO.email}"><br>
    	    구독 상태 : <input type = "hidden" id = "license" name ="license"><span id="checkLicense">&nbsp;</span><br>
    	    <a href="#"><input type="button" value = "구독하기"></a><br>
    	    
    	    <input type="submit" value="수정완료" >
    	</form>    
    </fieldset>
		
		
</body>
</html>

<%@ include file = "../include/footer.jsp" %>