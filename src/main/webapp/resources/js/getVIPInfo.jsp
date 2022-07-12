<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

	$(function(){
		
		$('#profitBtn').click(function(){
			var date = $("input[name=searchDate]").val();
			
			if(date == ""){
				alert("조회할 날짜를 선택해주세요");
			} else {
				location.href = '/pmMembers?date='+date;
			}
			
			
		});
		
	});
	

</script>