<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ include file = "../include/header.jsp" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR" />
	<title>결제결과 조회</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			$("#PayCheckAct").on("click", function(event) {
				var formData = new FormData($("#PayCheckForm")[0]);

				$.ajax({
					type: "POST",
					cache: false,
					processData: false,
					contentType: false,
					async: false,
					url: "/payInfo",
					dataType: "json",
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

						$_table.appendTo("#payInfoResult");
					},
					error: function(jqxhr, status, error) {
						console.log(jqxhr);

						alert(jqxhr.statusText + ",  " + status + ",   " + error);
						alert(jqxhr.status);
						alert(jqxhr.responseText);
					},
				});
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
			width: 80px;
			float: right;
			margin-top: 5px;
			margin-left: 5px;
		}
	</style>
</head>

<body>
	<h3>결제결과 조회</h3>
	<div id="form_area">
		<form id="PayCheckForm">
			<table>
				<tr>
					<td>*결제수단</td>
					<td> :
						<select id="PCD_PAY_TYPE" name="PCD_PAY_TYPE">
							<option value="card">카드</option>
							<option value="transfer">계좌이체</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>*주문번호</td>
					<td> :
						<input type="text" id="PCD_PAY_OID" name="PCD_PAY_OID" />
					</td>
				</tr>
				<tr>
					<td>*결제일자 (YYYYMMDD)</td>
					<td> :
						<input type="number" id="PCD_PAY_DATE" name="PCD_PAY_DATE" size="9" maxlength="8" />
					</td>
				</tr>
			</table>
		</form>
		<button id="PayCheckAct">조회</button>
	</div>
	<br />
	<hr />
	<div id="payInfoResult"></div>
</body>

</html>
    <%@ include file = "../include/footer.jsp" %>