<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	
	$(function(){
		
		$.ajax({
			url : "/getWeather",
			success : function(data){
				$(data).each(function(i,obj){
					if(obj.category == "TMP"){
					 $('#weatherInfo').append("<strong class='current'>"+obj.fcstValue+"℃</strong>");		
					}
					
					
						if(obj.category == "PTY"){
							if(obj.fcstValue != 0){ // 비,눈 날씨
								switch(obj.fcstValue){
								case '1' : $('#weatherInfo').prepend("<img src='/resources/img/weather/비.png' class='weatherPic'>");
											$('#weatherInfo').append("<span class='weather'>비</span>");
											break;
								case '2' : $('#weatherInfo').prepend("<img src='/resources/img/weather/비-눈.png' class='weatherPic'>");		  		
											$('#weatherInfo').append("<span class='weather'>비/눈</span>");
											break;
								case '3' : $('#weatherInfo').prepend("<img src='/resources/img/weather/눈.png' class='weatherPic'>");		  		
											$('#weatherInfo').append("<span class='weather'>눈</span>");
											break;
								case '4' : $('#weatherInfo').prepend("<img src='/resources/img/weather/소나기.png' class='weatherPic'>");		  		
											$('#weatherInfo').append("<span class='weather'>소나기</span>");
											break;
								}
							} else if(obj.fcstValue == 0) {
								$(data).each(function(i,obj){
									if(obj.category == "SKY"){
										switch(obj.fcstValue){
										case '1' : $('#weatherInfo').prepend("<img src='/resources/img/weather/해.png' class='weatherPic'>");
													$('#weatherInfo').append("<span class='weather'>맑음</span>");
													break;
										case '3' : $('#weatherInfo').prepend("<img src='/resources/img/weather/구름많음.png' class='weatherPic'>");		  		
													$('#weatherInfo').append("<span class='weather'>구름많음</span>");
													break;
										case '4' : $('#weatherInfo').prepend("<img src='/resources/img/weather/흐림.png' class='weatherPic'>");		  		
													$('#weatherInfo').append("<span class='weather'>흐림</span>");
													break;
										}
											
									} // SKY 끝
								});
								
							}
							
						} // PTY 끝
						
				});
			}
		});
		
	}); //jquery

					//if(obj.category == "TMP"){
						//$('#weatherInfo').append("<img src='/resources/img/weather/눈.png' class='weatherPic'>");
					//}

</script>
