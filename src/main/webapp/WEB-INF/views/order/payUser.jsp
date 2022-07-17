<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
	<title>등록 조회 및 해지(카드/계좌)</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	<script>
		$(document).ready(function() {
			//등록 조회
			$("#cPayUserInfoAct").on("click", function(event) {
				var formData = new FormData($("#cPayUserForm")[0]);

				$.ajax({
					type: "POST",
					cache: false,
					processData: false,
					contentType: false,
					//async : false,
					url: "/payUserInfo",
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

						$_table.appendTo("#cPayUserResult");
					},
					error: function(jqxhr, status, error) {
						console.log(jqxhr);

						alert(jqxhr.statusText + ",  " + status + ",   " + error);
						alert(jqxhr.status);
						alert(jqxhr.responseText);
					},
				});
			});

			//등록 해지
			$("#cPayUserDelAct").on("click", function(event) {
				var formData = new FormData($("#cPayUserForm")[0]);

				$.ajax({
					type: "POST",
					cache: false,
					processData: false,
					contentType: false,
					//async : false,
					url: "/payUserDel",
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

						$_table.appendTo("#cPayUserResult");
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
	<h3>등록 조회 및 해지</h3>
	<div id="form_area">
		<form id="cPayUserForm">
			<div>
				<label for="PCD_PAYER_ID">*결제자 고유 ID (빌링키) : </label>
				<input type="text" name="PCD_PAYER_ID" id="PCD_PAYER_ID" value="" required />
			</div>
		</form>
		<button id="cPayUserInfoAct">조회 요청</button>
		<button id="cPayUserDelAct">해지 요청</button>
	</div>
	<br />
	<hr />
	<div id="cPayUserResult"></div>
</body>

</html>