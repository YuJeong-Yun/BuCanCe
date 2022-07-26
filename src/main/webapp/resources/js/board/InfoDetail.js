	var searchTotal = '';
	var startPage = 1;
	var pageSize = 10;
	var total = document.getElementsByClassName('ri-text').length+pageSize;
	var rePageCheck = false; // '블로그 리뷰' 탭 중복 클릭 시 같은 글 가져오기 방지
	
	
		// 목록 클릭시 찜목록에서 온 경우 구별
		function backToList(addr){
			if(addr == "favorite"){
				location.href = "/member/favorite?page="+page
								+"&perPageNum="+perPageNum;
			} else {
				location.href = "/board/tourList?page="+page
				+"&perPageNum="+perPageNum
				+"&t_category="+t_category
				+"&addr="+addr2;
			}
		}
	
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
			
			// 좌표값 없을 경우 상세주소로 좌표검색
			if(lat == 0.0 || lng == 0.0) {
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(35.198362,129.053922), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
			
			
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption);
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			 
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(addr_full, function(result, status) {
			
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
			
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
			
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: "<div style='padding:5px;'>"+title+"<br><a href='https://map.kakao.com/link/to/"+title+","+result[0].y+","+result[0].x+"' style='color:blue;' target='_blank'>길찾기</a></div>"
			        });
			        infowindow.open(map, marker);
			
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});    
			
			
			} //if끝
			else {
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
				
				
		        var iwContent = "<div style='padding:5px;'>"+title+"<br><a href='https://map.kakao.com/link/to/"+title+","+lat+","+lng+"' style='color:blue;' target='_blank'>길찾기</a></div>", // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
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
		        
		        }//else 끝
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
			if(total<(searchTotal)){
			// 가지고 온 페이지 수만큼 더해줌
			startPage = startPage + pageSize;
			return startPage;
			}
			else{
				alert("페이지의 끝입니다.");
			}
			
		}
		
		 
		 $('#load-more').click(function(){
		 	 // 가져올 글 시작 번호
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
			// 전체 페이지 수 업데이트
			total = total + pageSize;
			//console.log(total);
			
		});
		
		 
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
		
	// 댓글 기능
	
	 //댓글 작성
		$(".commentWriteBtn").on("click", function() {
			var formObj = $("form[name='commentForm']");
			formObj.attr("action", "/board/commentWrite?num="+b_num
					+ "&page="+page
					+ "&perPageNum="+perPageNum
					+ "&t_category="+t_category
					+ "&addr="+addr2);
			formObj.submit();
		});
							
		//댓글 수정 팝업
			$(".commentModifyBtn").on("click", function openUdt(){
				window.name ="updateComment";
			window.open("/board/commentModify?num="+b_num
					+ "&page="+page
					+ "&perPageNum="+perPageNum
					+ "&t_category="+t_category
					+ "&addr="+addr2
					+ "&cno="
					+ $(this).attr("data-cno"), "container", "width=600, height=400, resizable= no, scrollbars= no");
		});
							
	//댓글 삭제 팝업
	$(".commentDeleteBtn").on("click",function openDel() {
		window.name = "deleteComment";
				window.open("/board/commentDelete?num="+b_num
					+ "&page="+page
					+ "&perPageNum="+perPageNum
					+ "&t_category="+t_category
					+ "&addr="+addr2
					+ "&cno="
					+ $(this).attr("data-cno"),"container", "width=500, height=300, resizable= no, scrollbars= no");
	})	
	