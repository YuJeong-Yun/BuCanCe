<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<title>결제정보 확인</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- payple js 호출. 테스트/운영 선택 -->
<script src="https://democpay.payple.kr/js/cpay.payple.1.0.1.js"></script> <!-- TEST (테스트) -->


<script>
	$(document).ready(
			function() {
				
				// callBack 함수 사용
				var getResult = function(res) {

					var url = "/order/order_result.php";

					var $form = $('<form></form>');
					$form.attr('action', url);
					$form.attr('method', 'post');

					$.each(res, function(key, val) {
						var input = $('<input type="hidden" name="' + key + '" value="' + val + '">');
						$form.append(input);
					});

					$form.appendTo('body');
					$form.submit();
				};

				// 결제 요청
				$("#payAction").on(
						"click",
						function(event) {

							var pay_type = "${pay_type}";
							var pay_work = "${pay_work}";
							var payer_id = "${payer_id}";
							var payer_no = "${payer_no}";
							var payer_name = "${payer_name}";
							var payer_hp = "${payer_hp}";
							var payer_email = "${payer_email}";
							var pay_goods = "${pay_goods}";
							var pay_total = Number("${pay_total}");
							var pay_taxtotal = Number("${pay_taxtotal}");
							var pay_istax = "${pay_istax}";
							var pay_oid = "${pay_oid}";
							var taxsave_flag = "${taxsave_flag}";
							var simple_flag = "${simple_flag}";
							var card_ver = "${card_ver}";
							var payer_authtype = "${payer_authtype}";
							var is_direct = "${is_direct}";
							var pcd_rst_url = "";
							var server_name = "${hostname}";

							// 결제창 방식 설정 - 팝업(상대경로), 다이렉트(절대경로)
							pcd_rst_url = is_direct === 'Y' ? server_name
									+ "/order/order_result" : "/order/order_result";

							var obj = new Object();

							/* 결제연동 파라미터 */

							//DEFAULT SET 1
							obj.PCD_PAY_TYPE = pay_type; 	// (필수) 결제수단 (transfer|card)
							obj.PCD_PAY_WORK = pay_work; 	// (필수) 결제요청 방식 (AUTH | PAY | CERT)

							// 카드결제 시 필수 (카드 세부 결제방식)
							obj.PCD_CARD_VER = card_ver; 	// Default: 01 (01: 간편/정기결제, 02: 앱카드)

							/* 결제요청 방식별(PCD_PAY_WORK) 파라미터 설정 */

							/*
							 * 1. 빌링키 등록
							 * PCD_PAY_WORK : AUTH
							 */
							if (pay_work == 'AUTH') {

								obj.PCD_PAYER_NO = payer_no; 			// (선택) 결제자 고유번호 (파트너사 회원 회원번호) (결과전송 시 입력값 그대로 RETURN)
								obj.PCD_PAYER_NAME = payer_name; 		// (선택) 결제자 이름
								obj.PCD_SIMPLE_FLAG = simple_flag; 		// (선택) 간편결제 여부 (Y|N)

							}

							/*
							 * 2. 빌링키 등록 및 결제
							 * PCD_PAY_WORK : PAY | CERT
							 */
							if (pay_work != 'AUTH') {

								// 2.1 첫결제 및 단건(일반,비회원)결제
								if (simple_flag != 'Y' || payer_id == '') {

									obj.PCD_PAY_GOODS = pay_goods; 			// (필수) 상품명
									obj.PCD_PAY_TOTAL = pay_total; 			// (필수) 결제요청금액
									obj.PCD_PAYER_NO = payer_no; 			// (선택) 결제자 고유번호 (파트너사 회원 회원번호) (결과전송 시 입력값 그대로 RETURN)
									obj.PCD_PAYER_NAME = payer_name; 		// (선택) 결제자 이름
									obj.PCD_PAY_OID = pay_oid; 				// (선택) 주문번호 (미입력 시 임의 생성)
									

								}

								// 2.2 간편결제 (빌링키결제)
								if (simple_flag == 'Y' && payer_id != '') {

									// PCD_PAYER_ID 는 소스상에 표시하지 마시고 반드시 Server Side Script 를 이용하여 불러오시기 바랍니다.
									obj.PCD_PAYER_ID = payer_id; 			// (필수) 빌링키 - 결제자 고유ID (본인인증 된 결제회원 고유 KEY)
									obj.PCD_SIMPLE_FLAG = 'Y'; 				// (필수) 간편결제 여부 (Y|N)
									obj.PCD_PAY_GOODS = pay_goods; 			// (필수) 상품명
									obj.PCD_PAY_TOTAL = pay_total; 			// (필수) 결제요청금액
									obj.PCD_PAYER_NO = payer_no; 			// (선택) 결제자 고유번호 (파트너사 회원 회원번호) (결과전송 시 입력값 그대로 RETURN)
									obj.PCD_PAY_OID = pay_oid; 				// (선택) 주문번호 (미입력 시 임의 생성)

								}

							}

							// DEFAULT SET 2
							obj.PCD_PAYER_AUTHTYPE = payer_authtype; 	// (선택) 비밀번호 결제 인증방식 (pwd : 패스워드 인증)
							obj.PCD_RST_URL = pcd_rst_url; 				// (필수) 결제(요청)결과 RETURN URL
							//obj.callbackFunction = getResult; 		// (선택) 결과를 받고자 하는 callback 함수명 (callback함수를 설정할 경우 PCD_RST_URL 이 작동하지 않음)

							// 파트너 인증시 받은 AuthKey 값 입력
							obj.PCD_AUTH_KEY = "${authKey}";

							// 파트너 인증시 받은 return_url 값 입력
							obj.PCD_PAY_URL = "${payReqURL}";

							PaypleCpayAuthCheck(obj);

							event.preventDefault();
						});
			});

</script>
<style>
table {
	border: 1px solid #aaaaaa;
	text-align: center;
}

tr {
	height: 35px;
}

th {
	text-align: center;
	font-weight: bold;
	background-color: #ececec;
	font-size: 14px;
}

td {
	text-align: left;
	padding-left: 5px;
}

#subject, #parameter {
	background-color: rgba(120, 82, 232, 0.2);
	font-size: 15px;
}
</style>
</head>

<body>
	<table border="1">
		<h2> Payple 연동 API</h2>
		<tr>
			<th id="subject">항목</th>
			<th id="parameter">요청변수</th>
		</tr>
		<tr>
			<th>결제자 이름</th>
			<td>${payer_name}</td>
		</tr>
		<tr>
			<th>결제자 휴대폰번호</th>
			<td>${payer_hp}</td>
		</tr>
		<tr>
			<th>결제자 이메일</th>
			<td>${payer_email}</td>
		</tr>
		<tr>
			<th>구매상품</th>
			<td>${pay_goods}</td>
		</tr>
		<tr>
			<th>결제금액</th>
			<td>${pay_total}</td>
		</tr>
		<tr>
			<th>주문번호</th>
			<td>${pay_oid}</td>
		</tr>
	</table>
	<br>
	<button id="payAction" style="margin-left: 260px">결제하기</button>
</body>
</html>
<%@ include file = "../include/footer.jsp" %>
