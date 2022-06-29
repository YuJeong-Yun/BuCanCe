function acceptGrp(event, grp_num) {
	$.ajax({
		url: '/planREST/accept/'+grp_num,
		type: 'post',
		success: function(data) {
			alert('성공!');
		},
		error: function() {
			alert('수락 오류!!');
		}
	});
};