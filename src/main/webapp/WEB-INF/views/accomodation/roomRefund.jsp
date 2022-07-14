<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



    <!-- Header Section Begin -->
    <jsp:include page="../include/header.jsp" />
    <!-- Header End -->

    <!-- Contact Section Begin -->
    <section class="contact-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <div class="contact-text">
                        <h2>환불페이지</h2>
                        <p>
                        이용해주셔서 감사합니다!
                        </p>
                        
                    <div class="room-item">
                        <div class="ri-text" style="border: solid #00abb9; box-shadow: 5px 5px 5px 5px gray; border-radius:10px;">
                        <table class="table"style=" box-shadow: 5px 5px 5px 5px gray; background-color: white; border-radius: 10px;" >
                            <tbody>
                                <tr>
                                    <td >호텔</td>
                                    <td>${vo.accName}</td>
                                </tr>
                                
                                <tr>
                                    <td >종류 </td>
                                    <c:if test="${vo.sort=='ds'}">
                                    <td>대실</td>
                                    </c:if>
                                    <c:if test="${vo.sort=='acc'}">
                                    <td>숙박</td>
                                    </c:if>
                                </tr>
                                <tr>
                                    <td >상품명 </td>
                                    <td>${vo.roomSort }</td>
                                </tr>
                                <tr>
                                    <td>예약<br>기간 </td>
                                    <td>${vo.checkIn} ~ <br>  ${vo.checkOut}</td>
                                </tr>
                              
                              	<c:if test="${vo.sort=='ds'}">
                                <tr>
                                    <td>이용시간 (마감)</td>
                                    <td >${vo.useTime}시간 (${vo.endTime}시까지)</td>
                                    
                                </tr>
                              	</c:if>
                              
                              <c:if test="${vo.sort=='acc'}">
                                <tr>
                                    <td>이용시간 (입/퇴실)</td>
                                    <td >${vo.useTime}시부터 (${vo.endTime}시까지)</td>
                                    
                                </tr>
                              	</c:if>
                              
                                <tr>
                                    <td>예약명 </td>
                                    <td>${vo.user_name}</td>
                                </tr>
                                <tr>
                                    <td>비용 </td>
                                    <td>${vo.accAmount}원</td>
                                </tr>
                                <tr><td></td><td></td></tr>
                              
                                
                            </tbody>
                        </table>
                   
                         <button type="button" onclick="refundPay()" class="btn btn-block btn-success btn"><b>환불하기</b></button>
                         <button type="button" onclick="cancelPay()" class="btn btn-block btn-danger btn"><b>취소하기</b></button>
                    </div>
                    </div>
                    </div>
                </div>
               </div>
        </div>
    </section>
    <!-- Contact Section End -->

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





    <!-- Footer Section Begin -->
   <jsp:include page="../include/footer.jsp" />
    <!-- Footer Section End -->

