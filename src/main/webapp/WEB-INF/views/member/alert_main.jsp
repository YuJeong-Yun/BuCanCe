<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
//     var msg = "<c:out value='${msg}'/>";
    var msg = "${msg}";
//     var url = "<c:out value='${url}'/>";
    alert(msg);
    location.href = "http://localhost:8088/main";
</script>
</head>
<body>

</body>
</html>