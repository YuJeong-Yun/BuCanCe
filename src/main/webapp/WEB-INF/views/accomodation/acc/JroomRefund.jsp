<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script>
  function refundPay() {
	  
alert('확인후 24시간 이내에 환불이 완료됩니다.');
var result = confirm("정말로 환불 하시겠습니까?");
	
if(result){ //result == true 
		 
		  
	$.ajax({
	   	url : "${pageContext.request.contextPath}/accomodation/roomRfDB", // 예: http://www.myservice.com/payments/cancel
	      type : "GET",
	      contentType : "application/json",
	      data : {
	    	rfId : "${rfId}",
	        accId : "${vo.accId}", // 예: ORD20180131-0000011
	        accAmount : "${vo.accAmount}", // 환불금액
	        accName : "${vo.accName}", //환불한 숙소 이름
	        roomSort : "${vo.roomSort}", //환불한 상품 이름
	        sort : "${vo.sort}", //대실 or 숙박
	        accKind : "${vo.accKind}", //결제방법
	        checkIn : "${vo.checkIn}", //체크인 
	        checkOut : "${vo.checkOut}", //체크아웃
	        id : "${vo.id}",
	        license : "${vo.license}"
	      },
	      "dataType": "json"
	      
	    });
		  
		  alert('환불성공')
		  location.href="${pageContext.request.contextPath}/accomodation/roomReList";
	  }else{
		  return;		  
	  }

   
  }
  
  
  function cancelPay(){
	  alert('환불취소');
	  location.href="${pageContext.request.contextPath}/accomodation/roomReList";
// 	  location.href=document.getElementById("reload").value;
  }
  
	
</script>     