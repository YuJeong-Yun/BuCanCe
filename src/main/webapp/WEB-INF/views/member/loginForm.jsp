<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file = "../include/header.jsp" %>
<%
	if( request.getAttribute( "flag" ) != null && !request.getAttribute( "flag" ).equals( "" ) ) {
		int flag = (Integer)request.getAttribute( "flag" );
		
		out.println( " " );
		if( flag == 0 ) {	//로그인성공
			out.println( " alert('로그인에 성공했습니다.'); " );
			out.println( " location.href='./index'" );
		} else if( flag == 1 ) {	//비번틀림
			out.println( " alert('비밀번호가 틀립니다.'); " );
			out.println( " location.href='./loginForm' " );
		} else if( flag == 2 ) {	//회원정보없음
			out.println( " alert('회원정보가 없습니다.'); " );
			out.println( " location.href='./loginForm' " );
		} else {					//기타 에러났을 때 또는 맨처음 시작
			out.println( " location.href='./loginForm' " );
		}
		out.println( "  " );
	};
%>

<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/memberPage.css" >
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body class = "memberBody">
<div class="memberForm">
<div class = "memberInputArea">
	<form action="/login.do" method="post">
		<span class = "memberInputGroup">
			<input type ="text" name="id" id = "inputBox" placeholder="아이디">
		</span>
		<span class = "memberInputGroup">
			<input type ="password" name="pw" id = "inputBox" placeholder = "비밀번호">
		</span>
		<span class = "memberInputGroup">
			<input type="submit" value="로그인" >
			<input type="button" value="회원가입" onclick=" location.href='/insert';" >
		</span>
	</form>
	    <a id="kakao-login-btn"></a>
		<a href="http://developers.kakao.com/logout">Logout</a>
	    <script type='text/javascript'>
        Kakao.init('6f4aa7a7f682933ec08dc156f29cb9cf');
        // 카카오 로그인 버튼을 생성합니다.
        Kakao.Auth.createLoginButton({
            container: '#kakao-login-btn',
            success: function (authObj) {
                alert(JSON.stringify(authObj));
            },
            fail: function (err) {
                alert(JSON.stringify(err));
            }
        });

		</script>

</div>
</div>
</body>
</html>
<%@ include file = "../include/footer.jsp" %>