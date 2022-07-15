
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style type="text/css">
#container {
	width: 490px;
	text-align: center;
	margin: 0 auto 0 auto;
}

#content {
	text-align: center;
}

#cancel_btn {
	visibility: visible;
}
`
#update_btn {
	visibility: visible;
}
</style>


<script type="text/javascript">

	
	// 수정 눌렀을 때 부모창으로 값 전달
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
<body onload="pValue()">
	<div id=wrap>
		<br> <b><font size="4" color="gray">수정하기</font></b>

		<hr size="1" width="460">

		<br>
		<hr />

		<section id="container">
			<form name="modifyForm" role="form" method="post"
				action="/board/commentModify" target="updateComment">
				<input type="hidden" name="num" value="${commentModify.num}"readonly="readonly" /> 
					<input type="hidden" id="cno" name="cno" value="${commentModify.cno}" /> 
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
				<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden"id="keyword" name="keyword" value="${scri.keyword}">
				<table>
					<tbody>
						<tr>
							<td><label for="content">댓글 내용</label><input type="text"
								id="content" name="content" value="${commentModify.content}" /></td>
						</tr>

					</tbody>
				</table>
				<div>


					<button type="submit" class="update_btn" onclick="window.close()">저장</button>
					<button type="button" class="cancel_btn" onclick="window.close()">취소</button>
				</div>
			</form>
		</section>
	</div>
</body>
</html>
