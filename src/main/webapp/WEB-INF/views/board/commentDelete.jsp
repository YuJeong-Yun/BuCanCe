 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
					<div>
						<p>삭제 하시겠습니까?</p>
						<button type="submit" class="delete_btn" onclick="window.close()">삭제</button>
						<button type="button" class="cancel_btn" onclick="window.close()">취소</button>
					</div>
				</form>
			</section>
		
		
</body>
</html> 