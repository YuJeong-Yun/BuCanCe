const menu = document.querySelector('.show-grp-menu .show-grp');
const member = document.querySelector('.grp-member');

menu.addEventListener('click', hideMember);

// 그룹 멤버 숨기기 버튼
function hideMember() {
  member.classList.toggle("hidden");
};
