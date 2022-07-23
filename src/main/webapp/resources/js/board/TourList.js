

// 맛집, 관광지 현재 상태표시
if(t_category == 1){
		document.getElementById('eating').className = "actBtn";
		document.getElementById('spot').className = "notActBtn";
	
} else if(t_category == 0){
		document.getElementById('spot').className = "actBtn";
		document.getElementById('eating').className = "notActBtn";
}


$('#spot').click(function(){

	location.href='/board/tourList?t_category=0&addr='+addr;
});

$('#eating').click(function(){
	
	location.href='/board/tourList?t_category=1&addr='+addr;
});


// 현재 페이지 표시
function currentPage(){
	if(page == ""){
		document.getElementById('idx1').style.backgroundColor ="#6aafe6";
		document.getElementById('idx1').style.color ="#fff";
	} else {
		document.getElementById('idx'+page).style.backgroundColor ="#6aafe6";
		document.getElementById('idx'+page).style.color ="#fff";
	}
}

currentPage();

// 현재 카테고리 상태 표시
function changeSelected(){
	$('#category').val(addr).attr('selected', 'selected');
}

changeSelected();

// 카테고리 이동
function search() {
	let addr = $('#category option:selected').val();
	location.href = "/board/tourList?addr="+addr+"&t_category=0";
}

// 검색어 입력 후 엔터 쳤을 때 이벤트 발생
function keywordSearch(e){
	let keyword = $('#keywordInput').val();	
	const code = e.code;
	
	if(code == 'Enter'){
       location.href = "/board/tourSearch?keyword="+keyword+"&addr="+addr+"&t_category="+t_category;
   }
}
	

	$('#searchBtn').click(function() {
		let keyword = $('#keywordInput').val();	
		location.href = "/board/tourSearch?keyword="+keyword+"&addr="+addr+"&t_category="+t_category;		
});


