const menu = document.querySelector('.show-grp-menu .show-grp');
const member = document.querySelector('.grp-member');

menu.addEventListener('click', hideMember);

// 그룹 멤버 숨기기 버튼
function hideMember() {
	member.classList.toggle("hidden");
}; // hideMember



// 플랜 수정 이동 버튼
const updateBtn = document.querySelector('.tour-plan .update-btn');

updateBtn.addEventListener('click', moveUpdatePlan);
// 플랜 수정 이동
function moveUpdatePlan() {
	if (confirm('플랜 수정 페이지로 이동하시겠습니까?')) {
		location.href = '/plan/planWrite/' + grp_num;
	}
}; //moveUpdatePlan