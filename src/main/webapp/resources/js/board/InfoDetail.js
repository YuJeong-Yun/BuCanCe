	var searchTotal = '';
	var startPage = 1;
	var total = document.getElementsByClassName('ri-text').length+10;
	var rePageCheck = false; // '블로그 리뷰' 탭 중복 클릭 시 같은 글 가져오기 방지
	var size = 3;
	
	$(function(){
		// 찜하기 클릭
		$('#updateThumb').click(function(){
			if(id){
				$.ajax({
					url : "/boardREST/updateThumb?b_num="+b_num+"&t_category="+t_category,
					type : "PUT",
					success : function(){
						checkThumb();
					}
				});
			} else {
				alert("로그인이 필요한 서비스입니다!");
			}
			
		});
		
		// 블로그 리뷰 클릭
		$('#blogReview').click(function(){
			
			
			document.getElementById('review').className = "";
			document.getElementById('loca').className = "";
			document.getElementById('blogReview').className = "active";
			document.getElementById('writeReview').style.display = 'none';
			document.getElementById('map').style.display = 'none';
			document.getElementById('blogList').style.display = 'inline-block';
			document.getElementsByClassName('load-more')[0].style.display = 'inline-block';
			
			if(rePageCheck == false){
			 $.ajax({
				url : "/boardREST/getBlog?title="+title+"&addr="+addr+"&start=1",
				success : function(data){
						searchTotal = $(data[1]).get(0);
						$(data[0]).each(function(i,obj){
							$('.rd-reviews').append("<div class='ri-text'><a href="+obj.link+" target='_blank'><h2>"+obj.title+"</h2><p>"+obj.description+"</p></a></div>");
						});
					}
				});
			}
			 
			rePageCheck = true; // true -> 11번 글부터 출력(load-more 클릭 시)
			 
		}); // blogReview
		
		
		// 위치 클릭
		$('#loca').click(function(){
			
			document.getElementById('blogReview').className = "";
			document.getElementById('review').className = "";
			document.getElementById('loca').className = "active";
			document.getElementById('map').style.display = 'inline-block';
			document.getElementById('blogList').style.display = 'none';
			document.getElementsByClassName('load-more')[0].style.display = 'none';
			document.getElementById('writeReview').style.display = 'none';
			
			
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(lat, lng), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
			
			
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			// 마커가 표시될 위치입니다 
			var markerPosition  = new kakao.maps.LatLng(lat, lng); 

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
				
				
		        //var iwContent = "<div style='padding:5px;'><a href='https://map.kakao.com/link/to/"+title+","+result[0].y+","+result[0].x+"' style='color:blue' target='_blank'>길찾기</a></div>", // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		        var iwContent = "<div style='padding:5px;'><a href='https://map.kakao.com/link/to/'+title+','+lat+','+lng style='color:blue;' target='_blank'>길찾기</a></div>", // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
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
			document.getElementById('writeReview').style.display = 'inline-block';
			
		 
		}); // review
		
		
		// load-more 클릭 시 글 시작 번호 계산
		function countStartPage(){
			//console.log(searchTotal);
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
			 //console.log(start);
			
			$.ajax({
				url : "/boardREST/getBlog?title="+title+"&addr="+addr+"&start="+start,
				success : function(data){
						$(data[0]).each(function(i,obj){
							$('.rd-reviews').append("<div class='ri-text'><a href="+obj.link+" target='_blank'><h2>"+obj.title+"</h2><p>"+obj.description+"</p></a></div>");
						});
					}
			});
			total = total + 10;
			//console.log(total);
			
		});
		 
		
		 
		 
	}); // jQuery
	
	
	// 페이지 클릭 시 사용자의 좋아요 기록 확인 후 표시할 이미지 결정
	function checkThumb(){
		$.ajax({
			url : "/boardREST/checkThumb?b_num="+b_num,
			success : function(result){
				if(result == 0){
					$('img#like_img').attr('src',path+'/resources/img/busan/empty_heart.png');
				} else {
					$('img#like_img').attr('src',path+'/resources/img/busan/heart.png');
				}
			}
		});
	}
	
	checkThumb();
	
		//댓글 작성
		$(".commentWriteBtn").on("click", function() {
			var formObj = $("form[name='commentForm']");
			var test = $(".rev-radi:checked").val();
			formObj.attr("action", "/board/commentWrite");
			formObj.submit();
		});
	
	
	