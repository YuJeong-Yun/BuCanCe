

function search() {
	let addr = $('#category option:selected').val();
	
	location.href = "/board/tourList?addr="+addr+"&t_category=0";
}

$(function() {
	
	$('#searchBtn').click(function() {
		let keyword = $('#keywordInput').val();	
		location.href = "/board/tourSearch?keyword="+keyword+"&addr="+addr+"&t_category="+t_category;		
	});
});