<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width">
  <title>무한 스크롤 예제</title>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <style>
    body { 
      margin: 0px;
      padding: 0px;
    }
    .big-box {
      width: 100%;
      background-color: gray;
      height: 100vh;
      border-top: 1px solid black;
    }
  </style>
</head>
<body>
  <div class="big-box"><h1>Page 1</h1></div>
  
  <script>
    var page = 10;

    $(window).scroll(function() {
        if ($(window).scrollTop() == $(document).height() - $(window).height()) {
          console.log(page=page+2);
          $("body").append('<div class="big-box"><h1>Page ' + page + '</h1></div>');

        }
    });
  </script>
</body>
</html>
