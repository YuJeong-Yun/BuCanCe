<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<title>구독권 결제 : 일반 결제</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://testcpay.payple.kr/js/cpay.payple.1.0.1.js"></script>
<!-- 테스트 -->

<script>
	$(document)
			.ready(
					function() {
						$("#payAction1").on("click", function(event) {
							var fm = $("#orderForm")[0];
							fm.method = "POST";
							fm.action = "order_confirm";
							fm.submit();
							event.preventDefault();
						});

						/*
						 *  #pay_type: 결제수단
						 *  #taxsave_view: 현금영수증 발행여부 view
						 *  #card_ver_view: 카드 세부 결제방식 view
						 */
						$("#pay_type")
								.on(
										"change",
										function(e) {
											e.preventDefault();

											var this_val = $(this).val();

											if (this_val == "card") {
												$("#taxsave_view").css(
														"display", "none");
												$("#card_ver_view").css(
														"display", "");
											} else {
												$("#taxsave_view").css(
														"display", "");
												$("#card_ver_view").css(
														"display", "none");
											}

											$("#card_ver")
													.on(
															"change",
															function() {
																if ($(this)
																		.val() == "01") {
																	$(
																			'#pay_work option[value*="AUTH"]')
																			.prop(
																					"disabled",
																					false);
																} else {
																	$(
																			'#pay_work option[value*="AUTH"]')
																			.prop(
																					"disabled",
																					true);
																}
															});
										});

						/* 
						 *	#simple_flag: 간편결제 여부
						 *  #payer_authtype_view: 비밀번호 결제 인증방식 view
						 */
						$("#simple_flag").on(
								"change",
								function(e) {
									e.preventDefault();

									var this_val = $(this).val();

									if (this_val == "Y") {
										$("#payer_authtype_view").css(
												"display", "");
									} else {
										$("#payer_authtype_view").css(
												"display", "none");
									}
								});
					});
</script>



<style>
body {
	font-size: 14px;
}

input {
	width: 300px;
	height: 20px;
	border: 1px solid white;
		color: gray;
}

select {
	height: 30px;
}

table {
	border: 1px solid #40C4FF;
	text-align: center;
}

tr {
	height: 35px;
}

th {
	text-align: center;
	font-weight: normal;
	background-color: #40C4FF;
	color: white;
	font-family: serif;
}

td {
	text-align: left;
	padding-left: 5px;
}

#subject, #parameter, #value {
	background-color: rgba(120, 82, 232, 0.2);
	font-size: 15px;
}

#orderFormSubmit {
	font-size: 12px;
	font-weight: bold;
	width: 100px;
	height: 30px;
	cursor: pointer;
}

h3 {
	padding: 0.5em;
	color:
}
</style>

</head>
<body>
	<div class="breadcrumb-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-text">

            <div style="margin-bottom: 5em; margin-top: 3em;">
						<form id="orderForm" name="orderForm">
							<div style="width: 49%; float: left;">
								<h3>| 주문정보 확인</h3>
								<br>
								<table style="color: white; margin: 0 auto;">
									<colgroup>
										<col style="width: 150px;">
										<col style="width: 150px;">
									</colgroup>
									<tr>
										<th>주문번호</th>
										<td><input type="text" name="pay_oid" id="pay_oid"
											value="" readonly="readonly"></td>
									</tr>
									<tr>
										<th>파트너사 회원번호</th>
										<td><input type="text" name="payer_no" id="payer_no"
											value="${payer_no}" readonly="readonly"></td>
									</tr>
									<tr>
										<th>이름</th>
										<td><input type="text" name="payer_name" id="payer_name"
											value="${payer_name}" readonly="readonly"></td>
									</tr>
									<tr>
										<th>휴대전화번호</th>
										<td><input type="text" name="payer_hp" id="payer_hp"
											value="${payer_hp}" ></td>
									</tr>
									<tr>
										<th>이메일</th>
										<td><input type="text" name="payer_email"
											id="payer_email" value="${payer_email}"></td>
									</tr>
									<tr>
										<th>상품명</th>
										<td><input type="text" name="pay_goods" id="pay_goods"
											value="${pay_goods}"readonly="readonly"></td>
									</tr>
									<tr>
										<th>결제금액</th>
										<td><input type="text" name="pay_total" id="pay_total"
											value="${pay_total}" readonly="readonly"></td>
									</tr>
								</table>
							</div>


							<div style="width: 49%; float: right;">
								<h3>| 간편결제</h3>
								<br>
								<table style="margin: 0 auto;">
									<colgroup>
										<col style="width: 150px;">
										<col style="width: 150px;">
									</colgroup>
									<tr>
										<th>결제수단</th>
										<td><span> <select id="pay_type" name="pay_type">
													<option value="card">신용카드</option>
													<option value="transfer">계좌이체결제</option>
											</select>
										</span> <span id="card_ver_view" style="display: none;"> <select
												id="card_ver" name="card_ver">
													<!--  <option value="01">간편/정기(빌링키결제)</option> -->
													<option value="02">앱카드</option>
											</select>
										</span></td>
									</tr>
									<tr>
										<th>빌링키</th>
										<td><input type="text" name="payer_id" id="payer_id"
											value=""></td>
									</tr>
									<tr>
										<th>결제요청 방식</th>
										<td><select id="pay_work" name="pay_work">
												<option value="PAY">즉시결제(PAY)</option>
												<!-- <option value="CERT">결제요청 재컨펌(CERT)</option> -->
										</select></td>
									</tr>
									<tr>
										<th>간편결제 구분</th>
										<td><select id="simple_flag" name="simple_flag">
												<option value="N">미사용</option>
												<option value="Y">사용</option>
										</select></td>
									</tr>
									<tr id="payer_authtype_view" style="display: none;">
										<th>비밀번호 결제 인증방식</th>
										<td><select name="payer_authtype">
												<option value="">미사용</option>
												<option value="pwd">사용</option>
										</select></td>
									</tr>
									<tr>
										<th>결제(요청)결과</th>
										<td><select name="is_direct">
												<option value="N">팝업</option>
												<option value="Y">다이렉트</option>
										</select></td>
									</tr>
								</table>
							</div>
						</form>
						<br>

						<button class="btn btn-info" id="payAction1"
							style="margin: 0 auto; margin: 1em; background-color: #0091EA;">간편결제</button>
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
<%@ include file="../include/footer.jsp"%>