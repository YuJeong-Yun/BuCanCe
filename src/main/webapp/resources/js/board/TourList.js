
if(t_category == 1){
		document.getElementById('eating').className = "actBtn";
		document.getElementById('spot').className = "notActBtn";
	
} else if(t_category == 0){
		document.getElementById('spot').className = "actBtn";
		document.getElementById('eating').className = "notActBtn";

}



function search() {
	let addr = $('#category option:selected').val();
	
	location.href = "/board/tourList?addr="+addr+"&t_category=0";
}

	
	$('#searchBtn').click(function() {
		let keyword = $('#keywordInput').val();	
		location.href = "/board/tourSearch?keyword="+keyword+"&addr="+addr+"&t_category="+t_category;		
	});

	
	$('#spot').click(function(){

		location.href='/board/tourList?t_category=0&addr='+addr;
	});
	
	$('#eating').click(function(){
		
		location.href='/board/tourList?t_category=1&addr='+addr;
	});