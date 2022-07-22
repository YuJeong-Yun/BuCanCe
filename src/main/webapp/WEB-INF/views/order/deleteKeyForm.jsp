<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="breadcrumb-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
				
					<h2>구독권 정기결제 정지</h2>
					
					<div class="bt-option">
						<span style="padding: 3em;">꼭.. 그래야겠수,,,?ㅠ_ㅜa..,,,(💔)</span>

						<section>
						
							<form action="/order/deleteKey" method="post">
							 
								<input class="btn btn-info" type="submit" value="정기결제 정지">
								
							</form>

						</section>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>
