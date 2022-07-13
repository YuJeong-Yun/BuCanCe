<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../include/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/memberPage.css" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Daum postcode API -->
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
var result_pwd = false;

//Daum postcode API
function daumPostcode() {
  new daum.Postcode({
      oncomplete: function(data) {
          // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

          // 각 주소의 노출 규칙에 따라 주소를 조합한다.
          // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
          var addr = ''; // 주소 변수
          var extraAddr = ''; // 참고항목 변수

          //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
          if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
              addr = data.roadAddress;
          } else { // 사용자가 지번 주소를 선택했을 경우(J)
              addr = data.jibunAddress;
          }

          // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
          if(data.userSelectedType === 'R'){
              // 법정동명이 있을 경우 추가한다. (법정리는 제외)
              // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
              if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                  extraAddr += data.bname;
              }
              // 건물명이 있고, 공동주택일 경우 추가한다.
              if(data.buildingName !== '' && data.apartment === 'Y'){
                  extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
              }
              // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
              if(extraAddr !== ''){
                  extraAddr = ' (' + extraAddr + ')';
              }
           // 참고항목의 유무에 따라 최종 주소를 만든다.
              addr += (extraAddr !== '' ? extraAddr : '');
          
          } 

          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          document.getElementById("zip").value = data.zonecode;
          document.getElementById("address1").value = addr;
          // 커서를 상세주소 필드로 이동한다.
          document.getElementById("address2").focus();
      }
  }).open();
}

<!-- Daum postcode API -->
	
function checkForm(){
	
	var regId = /^[a-z0-9]{4,12}$/; // id 유효성검사
	var regPw = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,12}$/; // 비번 유효성검사
	var regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 메일 유효성검사
	var regName = /^[가-힣]{2,4}$/; // 이름 유효성검사
    var regTel = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/; // 전화번호 유호성검사
	
    var id = document.getElementById("id");
    var pw = document.getElementById("pw");
    var name = document.getElementById("user_name");
    var email = document.getElementById("email");
    var tel = document.getElementById("tel");
    
    var pwd1 = document.getElementById("pw").value;
    var pwd2 = document.getElementById("pw2").value;
    
	if($("#id").val()==""){ // 아이디 공백 검사
	    alert("아이디를 입력하지 않으셨습니다.");
		$("#id").focus();
		return false;
	} else if(!regId.test(id.value)){ // 아이디 유효성검사
		alert("아이디는 4~12자의 영문 소문자와 숫자로만 입력하여 주세요.");
		$("#id").focus();
		return false;
	} else if($("#pw").val()==""){ // 비밀번호 공백 검사
    	alert("비밀번호를 입력하지 않으셨습니다.");
    	$("#pw").focus();
    	return false;
    } else if(!regPw.test(pw.value)){ // 비밀번호 유효성검사 
		alert("비밀번호는 8~12자의 영문 대소문자와 숫자, 특수문자를 사용해주세요.");
		$("#pw").focus();
		return false;
	} else if($("#pw").val()!=$("#pw2").val()) { // 비밀번호 확인 검사
        alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
        $("#pw").focus();
        return false;
	} else if($("#user_name").val()==""){ // 이름 공백 검사
	    alert("이름을 입력하지 않으셨습니다.");
		$("#user_name").focus();
		return false;
    } else if(!regName.test(name.value)){ // 이름 유효성검사
		alert("한글만 입력해주세요.");
    	$("#user_name").focus();
		return false;
	} else if($("#email").val()==""){ // 이메일 공백 검사
		alert("메일주소를 입력하지 않으셨습니다.");
		$("#email").focus();
		return false;
	} else if(!regEmail.test(email.value)){ // 이메일 유효성 검사
		alert("올바른 이메일 형식이 아닙니다.");
		return false;
	} else if($("#tel").val()==""){ // 전화번호 공백 검사
		alert("전화번호를 입력하지 않으셨습니다.");
		$("#tel").focus();
		return false;
	} else if(!regTel.test(tel.value)){ // 전화번호 유효성 검사
		alert("숫자로만 입력하세요.");
		$("#tel").focus();
		return false;
	} else if($("#address2").val()==""){
		alert("나머지 주소를 입력하지 않으셨습니다.");
		$("#address2").focus();
		return false;
    } else {
    	
    	alert("회원가입이 완료되었습니다.")
    
    }
    
}

function checkId(){
    var id = $("#id").val(); //id값이 "id"인 입력란의 값을 저장
    var checkUserId = $("#checkId1");
    var reId = /^[a-z0-9]{4,12}$/;

    if(!reId.test(id)){
     		checkUserId.html("<font color='red'><b>아이디는 영문, 숫자로 4-12 글자 입니다.</b></font>");
     	}else{
     	   $.ajax({
     	        url:'/idCheck', //Controller에서 인식할 주소
     	        type:'POST', //POST 방식으로 전달
     	        data:{id:id},
     	        success:function(cnt){
     	        if(cnt != 1){
     	         		checkUserId.html("<font color='green'><b>사용 가능한 아이디 입니다.</b></font>");
     	            } else {
     	         		checkUserId.html("<font color='red'><b>이미 사용중인 아이디 입니다.</b></font>");
     	            }
     	        },
     	        
     	        error:function(){
     	            alert("에러입니다");
     	            
     	        }
//     	         return;
     	    })
     	}
     	}
    	
function checkPwd(){
	var pwd1 = $("#pw").val();
	var checkSpan = $("#checkPwd1");
	var reg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,12}$/;
	
 	if(!reg.test(pwd1)){
 		checkSpan.html("<font color='red'><b>8~12자의 영문 대소문자와 숫자로만 입력</b></font>");
 	}else{
 		checkSpan.html("<font color='green'><b>사용가능한 비밀번호</b></font>");
 		result_pwd = true;
 	}
};

/* 비밀번호 재입력 일치 검사 메서드 */
function checkPwd2(){
  var pwd1 = document.getElementById("pw").value;
  var pwd2 = document.getElementById("pw2").value;
  var checkSpan = document.getElementById("checkPwd2");
  if(pwd2 != ""){
	   	if(pwd2 == pwd1){
	    	checkSpan.innerHTML = "<font color='green'><b>비밀번호가 일치합니다.</b></font>";
	    }else{
	   		checkSpan.innerHTML = "<font color='red'><b>비밀번호가 일치하지 않습니다.</b></font>";
	   		result_pwd = true;
	   	}
  }
}

function checkName(){
	    	var name = $("#user_name").val();
	    	var checkSpan3 = $("#checkName");
	    	var regName = /^[가-힣]{2,4}$/;
	    	
	     	if(!regName.test(name)){
	     		checkSpan3.html("<font color='red'><b>형식이 맞지 않습니다.</b></font>");
	     	}else{
	     		checkSpan3.html("<font color='green'><b>사용가능한 성명</b></font>");
	     		result_pwd = true;
	     	}
	    }

function checkMtel(){
	    	var mTel = $("#tel").val();
	    	var checkSpan4 = $("#checkTel");
	        var regTel = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
	    	
	     	if(!regTel.test(mTel)){
	     		checkSpan4.html("<font color='red'><b>형식이 맞지 않습니다.</b></font>");
	     	}else{
	     		checkSpan4.html("<font color='green'><b>사용가능한 전화번호</b></font>");
	     		result_pwd = true;
	     	}
	    }

function checkEmail(){
	    	var email = $("#email").val();
	    	var checkSpan5 = $("#checkEmail");
	    	var regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	    	
	     	if(!regEmail.test(email)){
	     		checkSpan5.html("<font color='red'><b>형식이 맞지 않습니다.</b></font>");
	     	}else{
	     		checkSpan5.html("<font color='green'><b>사용가능한 메일주소</b></font>");
	     		result_pwd = true;
	     	}
	    }

</script>
</head>

<body class = "memberBody">
<div class = "memberInputArea">
    	<form action="${pageContext.request.contextPath }/insert" method="post" onsubmit="return checkForm()">
			<span class = "memberInputGroup"><input type="text" id = "id" name="id" placeholder="아이디" onblur = "checkId()" ></span><span id="checkId1">&nbsp;</span>
			<span class = "memberInputGroup"><input type ="password" name="pw" id = "pw" placeholder = "비밀번호" onblur="checkPwd()"></span><span id="checkPwd1"> &nbsp;</span>
			<span class = "memberInputGroup"><input type="password" name="pw2" id ="pw2" placeholder="비밀번호 확인" onblur="checkPwd2()"></span><span id="checkPwd2"> &nbsp;</span>
			<span class = "memberInputGroup"><input type="text" class = "inputBox" name="user_name"  id = "user_name" onblur="checkName()" placeholder="이름"></span><span id="checkName">&nbsp;</span>
			<span class = "memberInputGroup"><input type="text" class = "inputBox" name="email"  id = "email" onblur="checkEmail()" placeholder = "이메일"></span><span id="checkEmail">&nbsp;</span>
			<span class = "memberInputGroup"><input type="text" class = "inputBox" name="tel" id = "tel" onblur="checkMtel()" placeholder =  "전화번호"></span><span id="checkTel">&nbsp;</span>
			<input type="text" class="inputBox" name="zip" id = "zip" placeholder = "우편번호"><input type="button" id="search" class="dup" onclick="daumPostcode()" value="우편번호찾기">
			<label>&nbsp;</label><input type="text" id="address1" name="address1" value="" class="address1" readonly>
			<label>&nbsp;</label><input type="text" id="address2" name="address2" class="address2" placeholder="상세주소를 입력하세요." required="">
    	    <input type="submit" value="회원가입" >
    	</form>
</div>
</body>
</html>
<%@ include file = "../include/footer.jsp" %>