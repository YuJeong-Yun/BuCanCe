<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <a id="kakao-login-btn"></a>
    <a href="http://developers.kakao.com/logout">Logout</a>
    <script type='text/javascript'>
        //<![CDATA[
        // 사용할 앱의 JavaScript 키를 설정해 주세요.
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
      //]]>
    </script>
</body>
</html>