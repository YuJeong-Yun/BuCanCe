function findAddr() {
	window.name = "findAddr";
	window.open("/admin/findAddr","container", "width=800, height=400, resizable= no, scrollbars= no");
}


function searchAddr(){

	let title = document.getElementById('title').value;
		$.ajax({
			url : "/adminRest/searchAddr?title="+title,
			dataType : "json",
			success : function(data){
				console.log(data);
				var tag = "";
				if($(data[1]).get(0) == 0){
					$('#findWrapper').append('내역이 없습니다.');
				}
			}
		});

}