 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style type="text/css">
#btn_group {
	border: 1px solid skyblue;
	background-color: rgba(0, 0, 0, 0);
	color: skyblue;
	padding: 5px;
	border-radius: 10px;
	text-align: center;	
	}

</style>
	<script type="text/javascript">
	
	function popupClose(form) {
		form.target = opener.name;
		form.submit();
		if (opener != null) {
			opener.insert = null;
			self.close();
		}

	}
	</script>
	
</head>
<body>
		<section id="container">
				<form name="deleteForm" role="form" method="post" action="/board/commentDelete" target="deleteComment">
					<input type="hidden" name="num" value="${commentDelete.num}" readonly="readonly"/>
					<input type="hidden" id="cno" name="cno" value="${commentDelete.cno}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="t_category" name="t_category" value="${scri.t_category}"> 
					<input type="hidden" id="addr" name="addr" value="${scri.addr}"> 
					<div id= "btn_group">
						<p>삭제 후에는 복구가 불가능합니다. 삭제 하시겠습니까?</p>
						<button type="submit" class="delete_btn" onclick="window.close()">삭제</button>
						<button type="button" class="cancel_btn" onclick="window.close()">취소</button>
					</div>
				</form>
			</section>
		
		
</body>
</html> 