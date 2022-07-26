
/* 글쓰기 성공후 */
if(result != 0 && result != ''){
	if(confirm("지금 게시판으로 이동하시겠습니까?")){
		var t_category = $('input[name="category"]:checked').val();
		location.href='/board/tourList?addr=all&t_category='+t_category;
	}
}

/* 주소 찾기 팝업창 */
function findAddr() {
	window.open("/admin/findAddr","container", "width=700, height=700, resizable= no, scrollbars= no");
	
}

/* 주소 찾기/선택 */
function searchAddr(){
	$('#noData').empty();
	$('#resultTable').empty();
	let title = document.getElementById('title').value;
		$.ajax({
			url : "/adminRest/searchAddr?title="+title,
			dataType : "json",
			success : function(data){
				
				console.log(data);
				var tag = "";
				if(data[1] == 0){
					$('#findWrapper').append("<div id='noData'>내역이 없습니다.</div>");
				} else {
						tag += "<tr>";
						tag += "<th>가게명</th>";
						tag += "<th>번지주소</th>";
						tag += "<th>도로명주소</th>";
						tag += "</tr>";
					
					$(data[0]).each(function(i,obj){
						tag += "<tr>";
						tag += "<td>"+obj.title+"</td>";
						tag += "<td id='address' onclick='chooseAddr(\""+obj.address+"\");'>"+obj.address+"</td>";
						tag += "<td id='roadAddress' onclick='chooseAddr(\""+obj.roadAddress+"\");'>"+obj.roadAddress+"</td>";
						tag += "</tr>";
					});
						$('#resultTable').append(tag);
						
				}
			}
		});

}

function chooseAddr(addr){
	opener.document.getElementById("addr1").value = addr.split(" ")[1];
	opener.document.getElementById('addr2').value = addr; /* 부모창의 요소에 데이터 들어감 */
	
	window.close();
}


/* 추가사항 토글 메뉴 */
function addMenu(){

 if(document.getElementById('sideUl').style.display === 'block') {
      document.getElementById('sideUl').style.display = 'none';
      document.getElementById('menu').textContent = '항목 숨기기 ▲';
    } else {
      document.getElementById('sideUl').style.display = 'block';
      document.getElementById('menu').textContent = '항목 추가하기 ▼';
    }
	
}

function removeMenu(menuEng,menuKor){
	var element = document.getElementById(menuEng); 
	element.parentNode.removeChild(element);
	$('#remove'+menuEng).remove();
	document.getElementById(menuEng+"li").style.display="block"; 
}

$('#sideUl li').click(function(){
	let tag = "<div class='form-group'>";
		tag += "<input type='text' class='form-control form-control-user' id='"+$(this).attr('value')+"' placeholder='"+$(this).text()+"' name='"+$(this).attr('value')+"'>";
		tag += "<span id='remove"+$(this).attr('value')+"' onclick='removeMenu(\""+$(this).attr('value')+"\",\""+$(this).text()+"\");'>⛔ 항목제거</span>";
		tag += "</div>";
	
	$(this).css("display","none");
	$('#last').append(tag);
	
});

/* 글쓰기 버튼 클릭*/
function uploadContent(){
		if (document.fr.title.value.length<1) {
			alert("글제목을 입력해주세요.");
			return false;
		} else if (document.fr.contents.value.length<1) {
			alert("글내용을 입력해주세요.");
			return false;
		} else if (document.fr.addr_full.value.length<1) {
			alert("주소를 입력해주세요.")
			return false;
		}
		 
		let formObj = $("form[name='fr']");
			formObj.attr("action", "/admin/writeBoard");
			formObj.submit();		
}



