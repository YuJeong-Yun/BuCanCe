<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ include file = "../include/header.jsp" %>

<%
    String clientId = "mh2HJRSmhFxLpWvyHva1";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:8088/callback", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);
%>

<%
	if( request.getAttribute( "flag" ) != null && !request.getAttribute( "flag" ).equals( "" ) ) {
		int flag = (Integer)request.getAttribute( "flag" );
		
		out.println( " " );
		if( flag == 0 ) {	//로그인성공
			out.println( " alert('로그인에 성공했습니다.'); " );
			out.println( " location.href='./member/index'" );
		} else if( flag == 1 ) {	//비번틀림
			out.println( " alert('비밀번호가 틀립니다.'); " );
			out.println( " location.href='./member/loginForm' " );
		} else if( flag == 2 ) {	//회원정보없음
			out.println( " alert('회원정보가 없습니다.'); " );
			out.println( " location.href='./member/loginForm' " );
		} else {					//기타 에러났을 때 또는 맨처음 시작
			out.println( " location.href='./member/loginForm' " );
		}
		out.println( "  " );
	};
%>

<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/memberPage.css" >
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body class = "memberBody">
<div class="memberForm">
<div class = "memberInputArea">
	<form action="/member/login.do" method="post">
		<span class = "memberInputGroup">
			<input type ="text" name="id" id = "inputBox" placeholder="아이디">
		</span>
		<span class = "memberInputGroup">
			<input type ="password" name="pw" id = "inputBox" placeholder = "비밀번호">
		</span>
		<span class = "memberInputGroup">
			<input type="submit" value="로그인" >
			<input type="button" value="회원가입" onclick=" location.href='/member/insert';" >
		</span>
		<!-- 사용자가 email 등 data 수신을 동의하지 않았을 경우 scope로 추가적으로 동의를 받아야 한다. -->
			<a href="https://kauth.kakao.com/oauth/authorize?client_id=c30d4acffaf14e6c0a33f269940ff070&redirect_uri=http://localhost:8088/member/kakao_login
&response_type=code&scope=account_email"> 
		<img src="/resources/img/kakao_login_medium_narrow.png" style="height:60px"></a><br>
			<a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=mh2HJRSmhFxLpWvyHva1&redirect_uri=http%3A%2F%2Flocalhost%3A8088%2Fcallback&state=063e8713-b6a0-4235-b05f-b64982f7a6f8">
		<img src="/resources/img/btnG_perfect.png" style="height:60px"></a></div><br>
	</form>

</div>
</div>
</body>
</html>
<%@ include file = "../include/footer.jsp" %>