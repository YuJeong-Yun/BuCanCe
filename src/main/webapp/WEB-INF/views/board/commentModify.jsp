
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style type="text/css">
#wrap {
	width: 490px;
	text-align: center;
	margin: 0 auto 0 auto;
}

#btn_group button {
	background-color: #6aafe6;
	color: #d4dfe6;
	border: 1px solid skyblue;
	padding: 5px;
	border-radius: 10px;
	top: 400px;
}

textarea {
	position: relative;
	left: 5%;
	box-sizing: border-box;
	border: solid 2px #1E90FF;
	border-radius: 5px;
	padding: 10px;
	font-size: 16px;
	resize: both;
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
	<div id=wrap>
		<br> <b><font size="4" color="#4FC3F7">수정하기</font></b>

		<hr size="1" width="460">

		<br>

		<section id="container">
			<form name="modifyForm" role="form" method="post" action="/board/commentModify" target="updateComment">
				<input type="hidden" name="num" value="${commentModify.num}"readonly="readonly" /> 
					<input type="hidden" id="cno" name="cno" value="${commentModify.cno}" /> 
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
				<table>
					<tbody>
						<tr>
							<td><p>
								<textarea rows="5" cols="50" name="content" id="content">${commentModify.content}</textarea></p></td>
						</tr>
					</tbody>
				</table>
				<div id ="btn_group">
					<button type="submit" id="update_btn" onclick="window.close()">저장</button>
					<button type="button" id="cancel_btn" onclick="window.close()">취소</button>
				</div>
			</form>
		</section>
	</div>
</body>
</html>
