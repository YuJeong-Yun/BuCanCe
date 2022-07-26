<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<div class="breadcrumb-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
				
					<h2>수동 스케줄러</h2>
					
					<div class="bt-option">
						<span style="padding: 3em;">만료회원 삭제 : 수동으로 관리하는 공간입니다</span>

						<section>
						
							<form action="/order/noautoScheduled1" method="post">
								<input class="btn btn-info" type="submit" value="기한만료회원 삭제">
</form>

						</section>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>