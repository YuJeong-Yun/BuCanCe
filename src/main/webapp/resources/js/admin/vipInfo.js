	let price = 6000;
	
	// 날짜 형식 변환
	function formatDate(date){
		var year = date.getFullYear();
		var month = date.getMonth()+1;
		month = (month >= 10)? month : '0'+month;
		var day = date.getDate();
		day = (day >= 10)? day : '0'+day;
		
		return year+'-'+month+'-'+day;
	}

		$('#today').click(function(){
			var date = new Date();
			document.getElementById("startDate").value = formatDate(date); // 시작날짜
			document.getElementById("endDate").value = formatDate(date); // 마지막날짜
		});
		
		$('#week').click(function(){
			var date = new Date();
			document.getElementById("endDate").value = formatDate(date);
			var calDate = new Date(date.setDate(date.getDate()-6));
			document.getElementById("startDate").value = formatDate(calDate);
		});
		
		$('#1month').click(function(){
			var date = new Date();
			document.getElementById("endDate").value = formatDate(date);
			var calDate = new Date(date.setMonth(date.getMonth()-1));
			document.getElementById("startDate").value = formatDate(calDate);
		});
		
		$('#3months').click(function(){
			var date = new Date();
			document.getElementById("endDate").value = formatDate(date);
			var calDate = new Date(date.setMonth(date.getMonth()-3));
			document.getElementById("startDate").value = formatDate(calDate);
		});
		
		$('#6months').click(function(){
			var date = new Date();
			document.getElementById("endDate").value = formatDate(date);
			var calDate = new Date(date.setMonth(date.getMonth()-6));
			document.getElementById("startDate").value = formatDate(calDate);
		});
		
		
		function pmMems(){
			var sDate = $("input[name=startDate]").val();
			var eDate = $("input[name=endDate]").val();
			var date = sDate+" "+eDate;
			
			if(sDate == "" || eDate == ""){
				alert("조회할 날짜를 선택해주세요");
			} else {
				$('tbody').empty();
				$('tfoot').empty();
				$('#filterBtn').empty();
					
					// 정렬 출력
					let btnTag = '';
					btnTag += "<span id='onlyPm' class='periodSpan' onclick='periodMems();'><a>구독회원만 보기</a></span>";
					btnTag += "<span id='allMem' class='periodSpan' onclick='pmMems();'><a>모두보기</a></span>";
				
					$('#filterBtn').append(btnTag);
					document.getElementById('allMem').style.color = "#025ce2";
					document.getElementById('allMem').style.fontWeight = "bold";
					
				$.ajax({
					url : "/adminRest/pmMembers?date="+date,
					success : function(data){
					let tag = '';
					$('#filterBtn').append("<span id='resultCnt'>검색결과 : "+data.length+"건</span>");
					if(data != ""){
						$(data).each(function(i,obj){
							tag += "<tr>";
							tag += "<td>"+obj.pcd_PAYER_NAME+"</td>";
								 
								 // pcd_PAYER_ID 값으로 구독회원 구별
								 if(obj.pcd_PAYER_ID == "" || obj.pcd_PAYER_ID == null){
									tag += "<td>N</td>";
								 } else {
									tag += "<td>Y</td>";
								 }
							let format = new Date(obj.create_date);
							tag += "<td>"+formatDate(format);+"</td>";
							format = new Date(obj.license_deadline);
							tag += "<td>"+formatDate(format);+"</td>";
							tag += "</tr>";
						});
						$('tbody').append(tag);
						$('tfoot').append("<tr><th colspan='3' id='total'>총 수익</th><th>"+($(data).length)*price+"</th></tr>");
						
					} else {
						$('tbody').append("<tr><td colspan='4'>내역이 없습니다.</td></tr>");
						$('tfoot').append("<tr><th colspan='3' id='total'>총 수익</th><th>"+($(data).length)*price+"</th></tr>");
						}
					}
				}); // ajax
			
			}
		
		}
		
		
		function periodMems(){
			var sDate = $("input[name=startDate]").val();
			var eDate = $("input[name=endDate]").val();
			var date = sDate+" "+eDate;
			
			if(sDate == "" || eDate == ""){
				alert("조회할 날짜를 선택해주세요");
			} else {
				$('tbody').empty();
				$('tfoot').empty();
				$('#filterBtn').empty();
				
					
					let btnTag = '';
					btnTag += "<span id='onlyPm' class='periodSpan' onclick='periodMems();'><a>구독회원만 보기</a></span>";
					btnTag += "<span id='allMem' class='periodSpan' onclick='pmMems();'><a>모두보기</a></span>";
				
					$('#filterBtn').append(btnTag);
					document.getElementById('onlyPm').style.color = "#025ce2";
					document.getElementById('onlyPm').style.fontWeight = "bold";
					
				$.ajax({
					url : "/adminRest/periodMems?date="+date,
					success : function(data){
					let tag = '';
					$('#filterBtn').append("<span id='resultCnt'>검색결과 : "+data.length+"건</span>");
					if(data != ""){
						$(data).each(function(i,obj){
							tag += "<tr>";
							tag += "<td>"+obj.pcd_PAYER_NAME+"</td>";
							tag += "<td>Y</td>";
							let format = new Date(obj.create_date);
							tag += "<td>"+formatDate(format);+"</td>";
							format = new Date(obj.license_deadline);
							tag += "<td>"+formatDate(format);+"</td>";
							tag += "</tr>";
						});
						$('tbody').append(tag);
						$('tfoot').append("<tr><th colspan='3' id='total'>총 수익</th><th>"+($(data).length)*price+"</th></tr>");
						
					} else {
						$('tbody').append("<tr><td colspan='4'>내역이 없습니다.</td></tr>");
						}
					}
				}); // ajax
			
			}
			
		}
		
