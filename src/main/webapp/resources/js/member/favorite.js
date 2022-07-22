

	/*찜 목록 제외 클릭시*/
	function delCheck(num){
		if(confirm("찜목록에서 제외하시겠습니까?"))
			location.href="/delThumb?num="+num;
	}
