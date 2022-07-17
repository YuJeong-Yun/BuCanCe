<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
</head>
<body>
    <jsp:include page="../include/header.jsp" />

    <!-- Breadcrumb Section Begin -->
    <div class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2>숙소 가격 페이지</h2>
                        <div class="bt-option">
                            <a href="./home.html">Home</a>
                            <span>숙소 가격</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section End -->

    <!-- Room Details Section Begin -->
   <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
   <script type="text/javascript">
   
   $(function(){
	  
	   $('#abs').attr({
		 
	   });
	   
	   $('.table_type_02').css({
// 		   'color' : 'green',
		   'text-align' : 'center',
	   }).attr({
		   'border' : '1',
		  
	   });
	   
// 	   $('.font_red').hide();
	   $('.font_red').css({
		   'color' : 'red',
		   
	   });
	   $('.font_gr').css({
		   'color' : 'green',
		   
	   });

	   $('th').attr('width','25%');
	   $('td').attr('height',90);
	   $('span').append('<br>');
	   
   });
   
   
   </script>
       <!-- 내가 만드는공간  -->
                       대실 요금 정보
                        <div id="abs">
                        
                        ${roomPrice.get(0).roomToday}
                        
                        <br><br>
                        대실 이용 시간
                        
                         ${roomPrice.get(2).roomTimeTo}
                        
                        <br><br>
                       숙박 요금 정보
                        ${roomPrice.get(1).roomOneTo}
                        
                        
                        <br><br>
                       숙박 이용시간
                         ${roomPrice.get(3).roomTimeOne}
                        
                        
                        
                        </div>
                        
                                    <hr>
                            
                        <button style="margin:auto;">예약하기</button>
                       <!-- 내가 만드는공간  -->   
   
   
   
    <!-- Room Details Section End -->

   <jsp:include page="../include/footer.jsp" />


</body>

</html>