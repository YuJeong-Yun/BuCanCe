<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form id="orderForm" name="orderForm">

		<h2>구독권</h2>
		<table>
			<colgroup>
				<col style="width: 150px;">
				<col style="width: 150px;">
				<col style="width: 300px;">
			</colgroup>


			<tr>
				<th>상품명</th>
				<td><input type="text" name="pay_goods" id="pay_goods"
					value="프리미엄 구독권"></td>
			</tr>
			<tr>
				<th>결제금액</th>
				<td><input type="text" name="pay_total" id="pay_total"
					value="1000"></td>
			</tr>
		</table>

		<button type="button" onclick="location.href='/order/orderInfo'">구독하기</button>
</body>
</html>
<%@ include file = "../include/footer.jsp" %>
