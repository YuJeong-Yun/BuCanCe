<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
//지역 select 고를때 동작
//해당지역을 골랐을때 지역에 해당하는 숙소목록을 보여줌
function selectArea(){
	idForm.submit();
	
	var input = document.getElementById("place_name"); 

	input.value = null;
	${select_place=""}
	
}
</script>
