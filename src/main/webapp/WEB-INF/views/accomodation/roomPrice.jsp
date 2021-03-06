<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <jsp:include page="../include/header.jsp" />

    <!-- Breadcrumb Section Begin -->
    <div class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2 style="font-family: 'Jeju Hallasan' ">숙소 가격 페이지</h2>
                        <div class="bt-option">
                          <a href="<%=request.getHeader("REFERER")%>">뒤로가기</a>
                         
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
	   $('tbody > tr > th').css({
		  'color' : 'white',
		  'background' : 'gray'
			   
	   });
	   $('th').attr('width','25%');
	   $('td').attr('height',90);
	   $('span').append('<br>');
	   $('table').attr({
		   'width' : '80%'
	   }).css({
		   'margin-left' : '15%',
	   		'margin-right' :'15%'
	   });
	   
	   $('span').css({
		   'margin-left' : '15%',
	   		'margin-right' :'15%'
	   });
	   
	   $('td').css({
		   'background' : "#FDF5E6"
	   });
   });
   
   
   </script>
       <!-- 내가 만드는공간  -->
       <br><br>
       
                       <span><b>대실 요금 정보</b></span>
                        <div id="abs">
                        
                        ${roomPrice.get(0).roomToday}
                        
                        <br><br>
                         <span><b>대실 이용 시간</b></span>
                        
                         ${roomPrice.get(2).roomTimeTo}
                        
                        <br><br>
                        <span><b>숙박 요금 정보</b></span>
                        ${roomPrice.get(1).roomOneTo}
                        
                        
                        <br><br>
                        <span><b>숙박 이용시간</b></span>
                         ${roomPrice.get(3).roomTimeOne}
                        
                        
                        
                        </div>
                        
                                    <hr>
                            
                     
                       <!-- 내가 만드는공간  -->   
   
   
   
    <!-- Room Details Section End -->

   <jsp:include page="../include/footer.jsp" />


