<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../include/header.jsp" %>

<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">Blog Review</h3>
				</div>
				<!-- /.box-header -->


				<form action="${pageContext.request.contextPath }/board/register" method="post" role="form">
				<table border="1">
			<tr>
				<td bgcolor="orange" width="70">제목</td>
				<td align="left"><input type="text" name="title" /></td>
			</tr>
			<tr>
				<td bgcolor="orange">작성자</td>
				<td align="left"><input type="text" name="writer" size="10" /></td>
			</tr>
			<tr>
				<td bgcolor="orange">내용</td>
				<td align="left"><textarea name="content" cols="40" rows="10"></textarea></td>
			</tr>
			<tr>
				<td bgcolor="orange" width="70">업로드</td><td align="left">
				<input type="file" name="uploadFile"/></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="글 쓰기" /></td>
			</tr>
		</table>
	</form>
	<hr>
	<a href="getBoardList.do">글 목록 가기</a>



			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->
<!-- /.content-wrapper -->

<%@ include file="../include/footer.jsp" %>
