<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
    <title>결제요청 결과</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    
    <script>
    $(document).ready(function () {
    	
    	// 결제요청 재컨펌(CERT)
        $('#payConfirmAct').on('click', function(e) {

            e.preventDefault();

            $('#payConfirmResult').text('');

            var con = "결제를 승인(CERT)하시겠습니까?";

            if (confirm(con) == true) {

                var formData = new FormData($('#payConfirmForm')[0]);

                $.ajax({
                    type: 'POST',
                    cache: false,
                    processData: false,
                    contentType: false,
                    async: false,
                    url: '/payCertSend',
                    dataType: 'json',
                    data: formData,
                    success: function(data) {
                        console.log(data);

                        alert(data.PCD_PAY_MSG);

                        var $_table = $("<table></table>");
                        var table_data = "";

                        $.each(data, function(key, value) {
                            table_data += '<tr><td>' + key + '</td><td>: ' + value + '</td><tr>';
                        });

                        $_table.append(table_data);

                        $_table.appendTo('#payConfirmResult');

                        $('#payConfirmAct').css('display', 'none');

                    },
                    error: function(jqxhr, status, error) {
                        console.log(jqxhr);

                        alert(jqxhr.statusText + ",  " + status + ",   " + error);
                        alert(jqxhr.status);
                        alert(jqxhr.responseText);
                    }
                });

            }

        });
        
    	 // 결제 취소 요청
        $('#payRefundAct').on('click', function() {

            $('#payRefundResult').text('');

            var con = confirm("결제취소하시겠습니까?");
            if (con) {
                var formData = new FormData($('#payRefundForm')[0]);

                $.ajax({
                    type: 'POST',
                    cache: false,
                    processData: false,
                    contentType: false,
                    async: false,
                    url: '/payRefund',
                    dataType: 'json',
                    data: formData,
                    success: function(data) {
                        console.log(data);

                        alert(data.PCD_PAY_MSG);

                        var $_table = $("<table></table>");
                        var table_data = "";

                        $.each(data, function(key, value) {
                            table_data += '<tr><td>' + key + '</td><td>: ' + value + '</td><tr>';
                        });

                        $_table.append(table_data);

                        $_table.appendTo('#payRefundResult');

                    },
                    error: function(jqxhr, status, error) {
                        console.log(jqxhr);

                        alert(jqxhr.statusText + ",  " + status + ",   " + error);
                        alert(jqxhr.status);
                        alert(jqxhr.responseText);

                    }
                });
            } else {
                return false;
            }
        });
    });
</script>
  </head>

<body>

<p><b>Response (PAY:결과 CERT:인증 AUTH:등록)</b></p>
<!-- 1. 결제결과 모두 출력  -->
${result}

<!-- 2. 결제결과 파라미터로 받기 - 응답 파라미터를 받아서 활용해보세요.  -->
<div style="display:none">
    PCD_PAY_RST = ${pay_rst}
    <br>
    PCD_PAY_MSG = ${pay_msg}
    <br>
    PCD_PAY_OID = ${pay_oid}
    <br>
    PCD_PAY_TYPE = ${pay_type}
    <br>
    PCD_PAY_WORK = ${pay_work}
    <br>
    PCD_PAYER_ID = ${payer_id}
    <br>
    PCD_PAYER_NO = ${payer_no}
    <br>
    PCD_PAY_BANKACCTYPE = ${pay_bankacctype}
    <br>
    PCD_PAYER_NAME = ${payer_name}
    <br>
    PCD_PAYER_EMAIL = ${payer_email}
    <br>
    PCD_PAY_GOODS = ${pay_goods}
    <br>
    PCD_PAY_TOTAL = ${pay_total}
    <br>
    PCD_PAY_TAXTOTAL = ${pay_taxtotal}
    <br>
    PCD_PAY_ISTAX = ${pay_istax}
    <br>
    PCD_PAY_BANK = ${pay_bank}
    <br>
    PCD_PAY_BANKNAME = ${pay_bankname}
    <br>
    PCD_PAY_BANKNUM = ${pay_banknum}
    <br>
    PCD_PAY_CARDNAME = ${pay_cardname}
    <br>
    PCD_PAY_CARDNUM = ${pay_cardnum}
    <br>
    PCD_PAY_CARDTRADENUM = ${pay_cardtradenum}
    <br>
    PCD_PAY_CARDAUTHNO = ${pay_cardauthno}
    <br>
    PCD_PAY_CARDRECEIPT = ${pay_cardreceipt}
    <br>
    PCD_PAY_TIME = ${pay_time}
    <br>
    PCD_TAXSAVE_RST = ${taxsave_rst}
</div>

<div style="width:800px; height:20px">&nbsp;</div>

<div style="border:1px; width:800px;text-align:center;">

	
	<c:if test = "${pay_work == 'CERT'}">
    	<button id="payConfirmAct">결제승인요청</button>
    </c:if>
    <c:if test = "${pay_work != 'AUTH'}">
    	<button id="payRefundAct">결제승인취소</button>
	</c:if>
    
</div>

<form id="payConfirmForm">
    <input type="hidden" name="PCD_PAY_TYPE" id="PCD_PAY_TYPE" value="${pay_type}"> <!-- (필수) 결제수단 (transfer|card) -->
    <input type="hidden" name="PCD_AUTH_KEY" id="PCD_AUTH_KEY" value="${auth_key}"> <!-- (필수) 파트너 인증 토큰 값 -->
    <input type="hidden" name="PCD_PAYER_ID" id="PCD_PAYER_ID" value="${payer_id}"> <!-- (필수) 결제자 고유 ID (빌링키) (결제완료시 RETURN) -->
    <input type="hidden" name="PCD_PAY_REQKEY" id="PCD_PAY_REQKEY" value="${pay_reqkey}"> <!-- (필수) 최종 결제요청 승인키 -->
    <input type="hidden" name="PCD_PAY_COFURL" id="PCD_PAY_COFURL" value="${pay_cofurl}"> <!-- (필수) 최종 결제요청 URL -->
</form>

<form id="payRefundForm">
    <input type="hidden" name="PCD_PAY_OID" id="PCD_PAY_OID" value="${pay_oid}"> <!-- (필수) 주문번호 -->
    <input type="hidden" name="PCD_PAY_DATE" id="PCD_PAY_DATE" value="${pay_date}"> <!-- (필수) 원거래 결제일자 -->
    <input type="hidden" name="PCD_REFUND_TOTAL" id="PCD_REFUND_TOTAL" value="${pay_total}"> <!-- (필수) 결제취소 요청금액 -->
    <!--<input type="hidden" name="PCD_REFUND_TAXTOTAL" id="PCD_REFUND_TAXTOTAL" value="${refund_taxtotal}">  (선택) 결제취소 부가세 -->
</form>

<br/><br/><br/><br/>
<b>Response (CERT:결과)</b><br/><br/>
<div id='payConfirmResult'></div>


<br/><br/><br/><br/>
<b>Response (취소 결과)</b><br/><br/>
<div id='payRefundResult'></div>
</body>
</html>
