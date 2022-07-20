<%@page import="com.bcc.domain.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% MemberVO vo = (MemberVO)request.getAttribute("MemberVO"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
<title>결제창 데모</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- payple js 호출. 테스트/운영 선택 -->
 <script src="https://testcpay.payple.kr/js/cpay.payple.1.0.1.js"></script> 
 
   <script>
      $(document).ready(function () {
        $("#payAction2").on("click", function (event) {
          var fm = $("#orderForm")[0];
          fm.method = "POST";
          fm.action = "order_confirm2";
          fm.submit();
          event.preventDefault();
        });

        /*
         *  #pay_type: 결제수단
         *  #taxsave_view: 현금영수증 발행여부 view
         *  #card_ver_view: 카드 세부 결제방식 view
         */
        $("#pay_type").on("change", function (e) {
          e.preventDefault();

          var this_val = $(this).val();

          if (this_val == "card") {
            $("#taxsave_view").css("display", "none");
            $("#card_ver_view").css("display", "");
          } else {
            $("#taxsave_view").css("display", "");
            $("#card_ver_view").css("display", "none");
          }

          $("#card_ver").on("change", function () {
            if ($(this).val() == "01") {
              $('#pay_work option[value*="AUTH"]').prop("disabled", false);
            } else {
              $('#pay_work option[value*="AUTH"]').prop("disabled", true);
            }
          });
        });

        /* 
		 *	#simple_flag: 간편결제 여부
         *  #payer_authtype_view: 비밀번호 결제 인증방식 view
         */
        $("#simple_flag").on("change", function (e) {
          e.preventDefault();

          var this_val = $(this).val();

          if (this_val == "Y") {
            $("#payer_authtype_view").css("display", "");
          } else {
            $("#payer_authtype_view").css("display", "none");
          }
        });
      });
    </script>


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
        <h2>| 주문정보 확인</h2>
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
                    <input type="text" name="payer_name" id="payer_name" value="ㅎㅎ<%-- <%=vo.getTel()%> --%>">
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
                    <input type="text" name="payer_hp" id="payer_hp" value="ㅎㅎ<%-- <%=vo.getTel()%> --%>">
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
                    <input type="text" name="payer_email" id="payer_email" value="ㅎㅎ<%-- <%=vo.getEmail()%> --%>">
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
     
<h2>| 정기결제 </h2>
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
                    결제수단
                </th>
                <th>
                    PCD_PAY_TYPE
                </th>
                <td>
                    <span>
                        <select id="pay_type" name="pay_type">
                            <option value="transfer">계좌이체결제</option>
                            <option value="card">신용카드</option>
                        </select>
                    </span>
                    <span id="card_ver_view" style="display:none;">
                        <select id="card_ver" name="card_ver">
                            <option value="01">간편/정기(빌링키결제)</option>
                           <!--  <option value="02">앱카드</option> -->
                        </select>
                    </span>
                </td>
            </tr>
            <tr>
                <th>
                    빌링키
                </th>
                <th>
                    PCD_PAYER_ID
                </th>
                <td>
                    <input type="text" name="payer_id" id="payer_id" value="">
                </td>
            </tr>
            <tr>
                <th>
                    결제요청 방식
                </th>
                <th>
                    PCD_PAY_WORK
                </th>
                <td>
                    <select id="pay_work" name="pay_work">
                       <option value="CERT">결제요청 재컨펌(CERT)</option>
                        <option value="AUTH">빌링키 등록(AUTH)</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>
                    간편결제 구분
                </th>
                <th>
                    PCD_SIMPLE_FLAG
                </th>
                <td>
                    <select id="simple_flag" name="simple_flag">
                        <option value="N">미사용</option>
                        <option value="Y">사용</option>
                    </select>
                </td>
            </tr>
            <tr id="payer_authtype_view" style="display:none;">
                <th>
                    비밀번호 결제 인증방식
                </th>
                <th>
                    PCD_PAYER_AUTHTYPE
                </th>
                <td>
                    <select name="payer_authtype">
                        <option value="">미사용</option>
                        <option value="pwd">사용</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>
                    결제(요청)결과<br>RETURN URL
                </th>
                <th>
                    PCD_RST_URL
                </th>
                <td>
                    <select name="is_direct">
                        <option value="N">팝업</option>
                        <option value="Y">다이렉트</option>
                    </select>
                </td>
            </tr>
        </table>
    </form>
    <br>

     <button id="payAction2" style="margin-left: 525px">정기결제</button>


</body>
</html>