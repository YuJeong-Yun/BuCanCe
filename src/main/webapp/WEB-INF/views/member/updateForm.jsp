<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/memberPage.css" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

window.onload = function checkLi(){
	var liSpan = $("#checkLicense");
	var liBtn = $("#licenseBtn");
        if(${memberVO.license } == 1){
			liSpan.html("<font color='green'><b>현재 구독중입니다.</b></font>");
			$("#liOnBtn").hide();
		} else {
			liSpan.html("<font color='red'><b>구독상태가 아닙니다.</b></font>");
			$("#liOffBtn").hide();
		}
};

function liUp(){
	var li = $("#license").val()
	
	$.ajax({
	        url:'/member/liUp', //Controller에서 인식할 주소
 	        type:'POST', //POST 방식으로 전달
 	        data:{li:li},
 	        success:function(){
 	        	alert("구독을 시작했습니다.");
 	        	location.href="/member/update";
 	        },
			error:function(){
				alert("liUp에러");
			}
	})
	};

function liDown(){
	var li = $("#license").val()

	$.ajax({
	        url:'/member/liDown', //Controller에서 인식할 주소
 	        type:'POST', //POST 방식으로 전달
 	        data:{li:li},
 	        success:function(){
 	        	alert("구독을 취소하였습니다.");
 	        	location.href="/member/update";
 	        },
			error:function(error){
				alert("Lidown에러");
			}
	})
	};

</script>
</head>
<body>
		<h2>회원정보 수정</h2>
	<div>
		<!-- action 속성값이 없는경우 자신의 주소를 호출 -->

    	<form action="/member/update" method="post" >
    	    <label>아이디 : </label>
    	    <input type ="text" name="id" value="${memberVO.id }" readonly><br>
    	    <label>비밀번호 : </label>
    	    <input type ="password" name="pw" placeholder="비밀번호를 입력하시오."><br>
    	    <label>이름 : </label>
    	    <input type="text" name="name" value ="${memberVO.name }" readonly><br>
    	    <label>전화번호 : </label>
    	    <input type="text" name="tel" value="${memberVO.tel}" ><br>
    	    <label>이메일 : </label>
    	    <input type="text" name="email" value="${memberVO.email}" ><br>
    	    <label>구독 상태 : </label>
    	    <input type = "hidden" id = "license" name ="license" value="${memberVO.license }"><span id="checkLicense">&nbsp;</span>
    	    <input type = "button" id = "liOnBtn" onclick = "liUp()" value = "구독하기">
    	    <input type = "button" id = "liOffBtn" onclick = "liDown()" value = "구독취소"><br>
    	    <input type ="submit" value="수정완료" >
    	</form>
	</div>	
</body>
</html>

<%@ include file = "../include/footer.jsp" %>