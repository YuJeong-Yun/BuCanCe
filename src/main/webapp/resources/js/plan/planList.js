const acceptListCnt = document.querySelector('span.acceptListCnt');
const acceptListBox = document.querySelector('div.acceptListBox');
const plans = document.querySelectorAll('.plan-container li');

// 그룹 초대 수락 버튼 클릭
function acceptGrp(event, grp_num) {
	$.ajax({
		url: '/planREST/accept/' + grp_num,
		type: 'post',
		success: function(data) {
			// 초대 내역 수 -1
			acceptListCnt.innerText = acceptListCnt.innerText - 1;
			// 초대 내역 수 0이면
			if (acceptListCnt.innerText == 0) {
				const zeroAcceptList = document.createElement('div');

				zeroAcceptList.classList.add('no-accept-list');
				zeroAcceptList.innerText = '받은 그룹 초대 내역이 없습니다.';
				acceptListBox.append(zeroAcceptList);
			}

			// 받은 초대 화면에서 지우기
			event.target.parentElement.parentElement.style.display = 'none';

			// 본문 그룹 리스트에 추가
			const newPlan = document.createElement('li');
			newPlan.innerHTML = '<a href="/plan/planContent/' + grp_num + '" class="plan">' + data + '</a>';

			// 최신순으로 정렬했을 때 맞는 순서에 새 그룹 추가
			for (let i = 0; i < plans.length; i++) {
				if (grp_num > plans[i].className) {
					plans[i].before(newPlan);
					break;
				}
			} // for
		},
		error: function() {
			alert('수락 오류!!');
		}
	});
};

// 그룹 초대 거절 버튼 클릭
function refuseGrp(event, grp_num) {
	$.ajax({
		url: '/planREST/refusal/' + grp_num,
		type: 'post',
		success: function(data) {
			// 초대 내역 수 -1
			acceptListCnt.innerText = acceptListCnt.innerText - 1;
			// 초대 내역 수 0이면
			if (acceptListCnt.innerText == 0) {
				const zeroAcceptList = document.createElement('div');

				zeroAcceptList.classList.add('no-accept-list');
				zeroAcceptList.innerText = '받은 그룹 초대 내역이 없습니다.';
				acceptListBox.append(zeroAcceptList);
			}

			// 받은 초대 화면에서 지우기
			event.target.parentElement.parentElement.style.display = 'none';

		},
		error: function() {
			alert('거절 오류!!');
		}
	});
}

