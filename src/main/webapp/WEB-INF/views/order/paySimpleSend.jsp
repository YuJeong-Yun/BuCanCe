<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<title>계좌 정기결제 재결제</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://testcpay.payple.kr/js/cpay.payple.1.0.1.js"></script>
<!-- 테스트 -->

<script type="text/javascript">
$(document).ready(function() {

    $("#PaySimpleAction").on("click", function(e) {
        e.preventDefault();

        var con = "정기결제 재결제를 요청합니다. \n 진행하시겠습니까? ";

        if (confirm(con) == true) {
            var formData = new FormData($("#paySimpleForm")[0]);

            $.ajax({
                type: "POST",
                cache: false,
                processData: false,
                contentType: false,
                async: false,
                url: "/order/paySimpleSend",
                dataType: 'json',
                data: formData,
                success: function(data) {
                    console.log(data);

                    alert(data.PCD_PAY_MSG);

                    var $_table = $('<table style="border: 1px solid black"></table>');
                    var table_data = "";
                                  
                    $.each(data, function(key, value) {
                        table_data +=
                            "<tr><td>" + key + "</td><td>: " + value + "</td><tr>";
                    });

                    $_table.append(table_data);

                    $_table.appendTo("#payConfirmResult");
                },
                error: function(jqxhr, status, error) {
                    console.log(jqxhr);

                    alert(jqxhr.statusText + ",  " + status + ",   " + error);
                    alert(jqxhr.status);
                    alert(jqxhr.responseText);
                },
            });
        } else {
            return false;
        }
    });
    
    $("#PCD_PAY_TYPE").on('change', function(e) {

        e.preventDefault();

        var this_val = $(this).val();

        if (this_val == 'card') {
            $("#taxsave_trade_view").css('display', 'none');
        } else {
            $("#taxsave_view").css('display', '');
        }

    });
});
</script>
<style>
#form_area {
    width: 600px;
    margin-bottom: 5px;
}

input {
    width: 300px;
    height: 20px;
    border: 1px solid gray;
}

button {
    width: 100px;
    float: right;
    margin-top: 5px;
    margin-left: 5px;
}
</style>
</head>

<body>
<!-- 결제결과 파라미터로 받기  -->
<div style="display:none">
   
    PCD_PAY_OID = ${pay_oid}
    <br>
    PCD_PAYER_ID = ${payer_id}
    <br>
    pay_oid = ${PCD_PAY_OID}
    <br>
    payer_id = ${PCD_PAYER_ID}

</div>

<h3>정기결제 재결제(빌링키)</h3>
<div id="form_area">
<form id="paySimpleForm">
    <table>
     	<tr>
            <td>*결제수단</td>
            <td> :
                <select id="PCD_PAY_TYPE" name="PCD_PAY_TYPE">
                    <option value="card" selected>카드</option>
                    <option value="transfer">계좌이체</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>*페이플 고유 ID(빌링키)</td>
            <td> :
                <input type="text" name="PCD_PAYER_ID" id="PCD_PAYER_ID" value="${payer_id}" required />
            </td>
        </tr>
        <tr>
            <td>*상품명</td>
            <td> :
                <input type="text" name="PCD_PAY_GOODS" id="PCD_PAY_GOODS" value="${pay_goods}" required />
            </td>
        </tr>
        <tr>
            <td>*결제금액</td>
            <td> :
                <input type="text" name="PCD_PAY_TOTAL" id="PCD_PAY_TOTAL" value="${pay_total}" required />
            </td>
        </tr>
        <tr>
            <td>결제자 고유번호</td>
            <td> :
                <input type="text" name="PCD_PAYER_NO" id="PCD_PAYER_NO" value="${payer_no}" />
            </td>
        </tr>
        <tr>
            <td>결제자 이메일</td>
            <td> :
                <input type="text" name="PCD_PAYER_EMAIL" id="PCD_PAYER_EMAIL" value="${payer_email}" />
            </td>
        </tr>
       
    </table>
</form>
<button id="PaySimpleAction">재결제 요청</button>
</div>

<br />
<hr />
<div id="payConfirmResult"></div>
</body>

</html>
<%@ include file="../include/footer.jsp"%>