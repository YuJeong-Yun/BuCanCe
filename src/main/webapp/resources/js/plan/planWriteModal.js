const planWriteModal = document.querySelector('#plan-write-modal');
const btnCloseModal = document.querySelector('.btn-close-modal');

///////////////////////////////////// 쿠키 확인해서 설명창 모달로 띄우기 /////////////////////////////
// 쿠키 정보 가져오는 함수
function getCookie(Name) {
	let search = Name + "=";
	if (document.cookie.length > 0) { // 아무 쿠키나 존재하면
		offset = document.cookie.indexOf(search);
		if (offset != -1) { // 내가 찾는 쿠키 존재하면
			offset += search.length; //  쿠키값의 길이만큼 추가
			end = document.cookie.indexOf(";", offset); // 쿠키값 마지막 위치 인덱스 값 설정
			if (end == -1)
				end = document.cookie.length;
			return unescape(document.cookie.substring(offset, end));
		}
	}
}


// 실행되면 쿠키에 저장된 plan 정보 가져오기
window.onload = function() {
	if (!getCookie("bccPlan")) { // plan이라는 이름의 쿠키를 불러와서 없을경우 설명 모달로 띄움

		// 모달 on
		planWriteModal.style.display = 'block';
		// 모달에서 스크롤이 필요한데 body에도 스크롤이 있을 경우, 모달이 아니라 body에서 스크롤이 동작할 수 있음
		// 따라서 모달이 on되면 body에서 스크롤이 동작하지 않도록 해야 함 
		document.body.style.overflow = 'hidden';

		// 모달 off
		btnCloseModal.addEventListener('click', () => {
			planWriteModal.style.display = 'none';
			document.body.style.overflow = 'auto';
			// 닫기 클릭하면 쿠키 생성
			setPlanCookie();
		});
	}
}; // window.onload
// plan 쿠키 저장
function setPlanCookie() {
	var expDate = new Date(); // 현 시스템 시간정보
	expDate.setDate(expDate.getDate() + 3650); // 유효기간

	document.cookie = "bccPlan" + "=" + "plan" + "; path=/; expires=" +
		expDate.toGMTString() + ";"
}; // setPlanCookie