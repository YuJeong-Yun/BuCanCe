<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 아임포트 -->
				<script type="text/javascript"
					src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
				<script type="text/javascript"
					src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
				<script type="text/javascript">

				function selectAll(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('checkOne');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				if("${id}"=='')
				{
				alert('로그인이 필요합니다');
				location.href="${pageContext.request.contextPath}/login";
				}
					
				
				
				
				
				function dEI(elementID){
					return document.getElementById(elementID);
				}
				function openLayer(IdName, tpos, lpos){
					var pop = dEI(IdName);
					pop.style.top = tpos + "px";
					pop.style.left = lpos + "px";
					pop.style.display = "block";
				}
				function closeLayer( IdName ){
					var pop = dEI(IdName);
					pop.style.display = "none";
				}

				
		var IMP = window.IMP; // 생략 가능
		IMP.init("imp49919207"); // 예: imp00000000

		
function requestPay() {
			
			//예약가격가져오기
			const str = document.getElementById('date-out2').value;
			const regex = /[^0-9]/g;
			const result = str.replace(regex, "");
			const number = parseInt(result);
			//예약가격가져오기
			
			
			
			if(!$('#checkOne').is(':checked')){
				alert('숙소이용규칙 및 취소/환불규정에 동의가 필요합니다.');
				
			}else if(!$('#checkTwo').is(':checked')){
				alert('개인정보 수집 및 이용 동의가 필요합니다.');
			}
			else if(!$('#checkThree').is(':checked')){
				alert('개인정보 제 3자 제공 동의가 필요합니다.');
			}
			else if(!$('#checkFour').is(':checked')){
				alert('만 14세 이상의 확인이 필요합니다.');
			}else{
				alert('결제를 시작합니다.');
				   // IMP.request_pay(param, callback) 결제창 호출
			      IMP.request_pay({ // param
			    	  pg: $("#payment-select option:selected").val(),
// 			          pay_method: "card",
			          merchant_uid: "${accId}",  //고유 id
			          name: '${vo.room_title} ${vo.room_subTitle}',  //상품이름
			          amount: number, //가격
			          buyer_email: "${email}",
			          buyer_name: "${user_name}",
			          buyer_tel: "${tel}",
			          buyer_addr: "${address1}",
			          buyer_postcode: "${zip}",
			      }, function (rsp) { // callback
			          if (rsp.success) {
			        	// http://localhost:8088/accomodation/roomList
			              // 결제 성공 시 로직,
			             alert('결제성공');
			             $.ajax({
			 				type:"GET",
			 				url :"${pageContext.request.contextPath}/accomodation/roomPayDB",
			 				data : {
			 					accId: "${accId}",  //고유 id
			 					accKind: $("#payment-select option:selected").val(),
			 					accName: '${vo.room_title}',  //상품이름
			 					accAmount: number, //가격
						        email: "${email}",
						        user_name: "${user_name}",
						        tel: "${tel}",
						        address1: "${address1}",
						        zip: "${zip}",
						        id : "${id}",
						        sort : "acc",
						        roomSort : "${vo.room_subTitle}",
						        endTime : "${vo.accendtime}",
						        useTime : "${vo.accusetime}",
						        checkIn : "${vo.checkin}",
						        checkOut : "${vo.checkout}",
						        license : "${license}"
			 				},
			 				contentType: "application/json",
			 				success : function(data){
			 					alert('성공');
			 					
			 					
			 				}
			 			
			 			}); //ajax끝
			 			
			              //결제내역페이지로이동
			             location.href= "${pageContext.request.contextPath}/accomodation/roomReComplete?accId="+"${accId}";	
			          } else {
			         	
			              // 결제 실패 시 로직, 뒤로가기
			              alert('결제실패');
			              //결제 실패시 뒤로가기
			              location.href=document.getElementById("reload").value;
			          }
			      });
			}
			
			
	   
	    }

		
		
		
	    function cancelPay() {
	    	
	    	alert('예약목록창으로 이동');
	    	location.href=document.getElementById("reload").value;
	    	
	    }
		
		
</script>
				<!-- 아임포트 -->
    