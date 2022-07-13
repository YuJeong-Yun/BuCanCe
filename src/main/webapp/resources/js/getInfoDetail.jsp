<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5b3d692ed9e41ded5eedc5a2578cee55&libraries=services"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	var searchTotal = '';
	var startPage = 1;
	var total = document.getElementsByClassName('ri-text').length+10;
	var rePageCheck = false;
	var size = 3;
	
	$(function(){
		
		$('#updateThumb').click(function(){
			if('${sessionScope.id}'){
				$.ajax({
					url : "/updateThumb?b_num=${resVO.num}&t_category=${resVO.t_category}",
					type : "PUT",
					success : function(){
						checkThumb();
					}
				});
			} else {
				alert("로그인이 필요한 서비스입니다!");
			}
			
		});
		
		$('#blogReview').click(function(){
			
			
			document.getElementById('review').className = "";
			document.getElementById('loca').className = "";
			document.getElementById('blogReview').className = "active";
			document.getElementById('writeReview').style.visibility = 'hidden';
			document.getElementById('map').style.display = 'none';
			document.getElementById('blogList').style.display = 'inline-block';
			document.getElementsByClassName('load-more')[0].style.display = 'inline-block';
			
			if(rePageCheck == false){
			 $.ajax({
				url : "/tour/getBlog?title=${resVO.title}&addr=${resVO.addr}&start=1",
				success : function(data){
						searchTotal = $(data[1]).get(0);
						$(data[0]).each(function(i,obj){
							$('.rd-reviews').append("<div class='ri-text'><a href="+obj.link+" target='_blank'><h2>"+obj.title+"</h2><p>"+obj.description+"</p></a></div>");
						});
					}
				});
			}
			 
			rePageCheck = true;
			 
		}); // blogReview
		
		
		$('#loca').click(function(){
			
			document.getElementById('blogReview').className = "";
			document.getElementById('review').className = "";
			document.getElementById('loca').className = "active";
			document.getElementById('map').style.display = 'inline-block';
			document.getElementById('blogList').style.display = 'none';
			document.getElementsByClassName('load-more')[0].style.display = 'none';
			document.getElementById('writeReview').style.visibility = 'hidden';
			
			var address = "";
			
			
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng("${resVO.lat}", "${resVO.lng}"), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
			
			
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			// 마커가 표시될 위치입니다 
			var markerPosition  = new kakao.maps.LatLng("${resVO.lat}", "${resVO.lng}"); 

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
				
				
		        //var iwContent = "<div style='padding:5px;'><a href='https://map.kakao.com/link/to/"+title+","+result[0].y+","+result[0].x+"' style='color:blue' target='_blank'>길찾기</a></div>", // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		        var iwContent = "<div style='padding:5px;'><a href='https://map.kakao.com/link/to/${resVO.title},${resVO.lat},${resVO.lng}' style='color:blue' target='_blank'>길찾기</a></div>", // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		        iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
		        
		        var infowindow = new kakao.maps.InfoWindow({
		            content : iwContent,
		            removable : iwRemoveable
		        });
		        
		     	// 마커에 클릭이벤트를 등록합니다
		        kakao.maps.event.addListener(marker, 'click', function() {
		              // 마커 위에 인포윈도우를 표시합니다
		              infowindow.open(map, marker);  
		        });

		        
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        //map.setCenter(coords);
			});    
		
		$('#review').click(function(){
			
			document.getElementById('blogReview').className = "";
			document.getElementById('loca').className = "";
			document.getElementById('review').className = "active";
			document.getElementById('blogList').style.display = 'none';
			document.getElementById('map').style.display = 'none';
			document.getElementsByClassName('load-more')[0].style.display = 'none';
			document.getElementById('writeReview').style.visibility = 'visible';
			
		 
		}); // review
		
		
		function countStartPage(){
			console.log(searchTotal);
			if(total<(searchTotal)){
			startPage = startPage + 10;
			return startPage;
			}
			else{
				alert("페이지의 끝입니다.");
			}
			
		}
		
		
		 $('#load-more').click(function(){
			 var start = countStartPage();
			 console.log(start);
			
			$.ajax({
				url : "/tour/getBlog?title=${resVO.title}&addr=${resVO.addr}&start="+start,
				success : function(data){
						$(data[0]).each(function(i,obj){
							$('.rd-reviews').append("<div class='ri-text'><a href="+obj.link+" target='_blank'><h2>"+obj.title+"</h2><p>"+obj.description+"</p></a></div>");
						});
					}
			});
			total = total + 10;
			console.log(total);
			
		});
		 
		
		 
		 
	}); // jQuery
	
	
	
	function checkThumb(){
		$.ajax({
			url : "/checkThumb?b_num=${resVO.num}",
			success : function(result){
				if(result == 0){
					$('img#like_img').attr('src','${pageContext.request.contextPath}/resources/img/busan/empty_heart.png');
				} else {
					$('img#like_img').attr('src','${pageContext.request.contextPath}/resources/img/busan/heart.png');
				}
			}
		});
	}
	
	checkThumb();
	
	
		
</script>    
