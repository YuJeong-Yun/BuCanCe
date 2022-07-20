<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 안내 페이지</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- payple js 호출. 테스트/운영 선택 -->
    <script src="https://testcpay.payple.kr/js/cpay.payple.1.0.1.js"></script> <!-- 테스트 -->
   
  

 <style>
      body {
        font-size: 12px;
      }

      input {
        width: 300px;
        height: 20px;
        border: 1px solid gray;
      }

      select {
        height: 30px;
      }

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
      }

      td {
        text-align: left;
        padding-left: 5px;
      }

      #subject,
      #parameter,
      #value {
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
    </style>


</head>
<body>

<form id="orderForm" name="orderForm">
        <h2>| 주문정보 </h2>
        <table>
            <colgroup>
                <col style="width: 150px;">
                <col style="width: 150px;">
                <col style="width: 300px;">
            </colgroup>
            <tr>
                <th id="subject">
                    항목
                </th>
                <th id="parameter">
                    요청변수
                </th>
                <th id="value">
                    값
                </th>
            </tr>
            <tr>
                <th>
                    주문번호
                </th>
                <th>
                    PCD_PAY_OID
                </th>
                <td>
                    <input type="text" name="pay_oid" id="pay_oid" value="">
                </td>
            </tr>
            <tr>
                <th>
                    파트너사 회원번호
                </th>
                <th>
                    PCD_PAYER_NO
                </th>
                <td>
                    <input type="text" name="payer_no" id="payer_no" value="${payer_no}">
                </td>
            </tr>
            <tr>
                <th>
                    결제고객 이름
                </th>
                <th>
                    PCD_PAYER_NAME
                </th>
                <td>
                    <input type="text" name="payer_name" id="payer_name" value="${payer_name}">
                </td>
            </tr>
            <tr>
                <th>
                    결제고객 휴대전화번호
                </th>
                <th>
                    PCD_PAYER_HP
                </th>
                <td>
                    <input type="text" name="payer_hp" id="payer_hp" value="${payer_hp}">
                </td>
            </tr>
            <tr>
                <th>
                    결제고객 이메일
                </th>
                <th>
                    PCD_PAYER_EMAIL
                </th>
                <td>
                    <input type="text" name="payer_email" id="payer_email" value="${payer_email}">
                </td>
            </tr>
            <tr>
                <th>
                    상품명
                </th>
                <th>
                    PCD_PAY_GOODS
                </th>
                <td>
                    <input type="text" name="pay_goods" id="pay_goods" value="프리미엄 구독권">
                </td>
            </tr>
            <tr>
                <th>
                    결제금액
                </th>
                <th>
                    PCD_PAY_TOTAL
                </th>
                <td>
                    <input type="text" name="pay_total" id="pay_total" value="1000">
                </td>
            </tr>
        </table>
        
        <br>
                    <div class ="btns">
                    <button type="button"onclick="location.href='/order/order1'">프리미엄 구독권</button>
                    <button type="button"onclick="location.href='/order/order2'">프리미엄 정기 구독권</button>
	    </div>

</body>
</html>
<%@ include file = "../include/footer.jsp" %>