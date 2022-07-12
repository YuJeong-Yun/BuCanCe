<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	
	
	// 날짜 형식 변환
	function formatDate(date){
		var year = date.getFullYear();
		var month = date.getMonth()+1;
		month = (month >= 10)? month : '0'+month;
		var day = date.getDate();
		day = (day >= 10)? day : '0'+day;
		
		return year+'-'+month+'-'+day;
	}

	$(function(){
		
		
		$('#today').click(function(){
			var date = new Date();
			document.getElementById("startDate").value = formatDate(date);
			document.getElementById("endDate").value = formatDate(date);
		});
		
		$('#week').click(function(){
			var date = new Date();
			document.getElementById("endDate").value = formatDate(date);
			var calDate = new Date(date.setDate(date.getDate()-6));
			document.getElementById("startDate").value = formatDate(calDate);
		});
		
		$('#1month').click(function(){
			var date = new Date();
			document.getElementById("endDate").value = formatDate(date);
			var calDate = new Date(date.setMonth(date.getMonth()-1));
			document.getElementById("startDate").value = formatDate(calDate);
		});
		
		$('#3months').click(function(){
			var date = new Date();
			document.getElementById("endDate").value = formatDate(date);
			var calDate = new Date(date.setMonth(date.getMonth()-3));
			document.getElementById("startDate").value = formatDate(calDate);
		});
		
		$('#6months').click(function(){
			var date = new Date();
			document.getElementById("endDate").value = formatDate(date);
			var calDate = new Date(date.setMonth(date.getMonth()-6));
			document.getElementById("startDate").value = formatDate(calDate);
		});
		
		
		
		$('#profitBtn').click(function(){
			var sDate = $("input[name=startDate]").val();
			var eDate = $("input[name=endDate]").val();
			var date = sDate+" "+eDate;
			
			if(sDate == "" || eDate == ""){
				alert("조회할 날짜를 선택해주세요");
			} else {
				location.href = '/pmMembers?date='+date;
			}
			
			
		});
		
	}); // JQuery
	

</script>