const acceptListCnt = document.querySelector('span.acceptListCnt');
const acceptListBox = document.querySelector('div.acceptListBox');
const addGroup = document.querySelector('button.add-group');
const grpAcceptList = document.querySelector('ul.grp-accept-list');
const planContainer = document.querySelector('.plan-container');

// 그룹 초대 수락 버튼 클릭
function acceptGrp(event, grp_num, license) {
	const plans = document.querySelectorAll('.plan-container > li');

	// 최대 플랜 수이면 초대 수락버튼 클릭 시 최대 플랜 수 알림 메세지
	if (license == "free" && plans.length >= 1) {
		alert("생성 가능한 최대 플랜 수 입니다. 플랜 삭제 후 초대를 수락해 주세요.");
		return;
	} else if (license == "premium" && plans.length >= 10) {
		alert("생성 가능한 최대 플랜 수 입니다. 플랜 삭제 후 초대를 수락해 주세요.");
		return;
	}


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
			event.target.parentElement.parentElement.remove();


			// 본문 그룹 리스트에 추가
			const newPlan = document.createElement('li');
			newPlan.classList.add(grp_num);
			let newPlanInner = '<input type=button class=plan value=' + data.grpName + ' onclick=location.href="/plan/planContent/' + grp_num + '";>' +
				'<ul class=member-container>';
			for (let i = 0; i < data.grpMember.length; i++) {
				newPlanInner +=
					'<li>' +
					'<div class="member--profile"><img src="/resources/img/who.jpg" /></div>' +
					'<div class="member--name">' + data.grpMember[i].name + '</div>' +
					'</li>';
			};
			newPlanInner += '</ul>' +
							'<div class="material-icons-outlined delete-plan" onclick="delPlan(event, '+grp_num+');">clear</div>';
			newPlan.innerHTML = newPlanInner;
			// 최신순으로 정렬했을 때 맞는 순서에 새 그룹 추가
			for (let i = 0; i < plans.length; i++) {
				console.log(plans[i].className);
				if (grp_num > plans[i].className) {
					plans[i].before(newPlan);
					break;
				}
			} // for
			if(plans.length == 0) {
				planContainer.append(newPlan);
			}


			// 현재 플랜 수 +1
			nowCnt.innerText = parseInt(nowCnt.innerText) + 1;

		},
		error: function() {
			alert('수락 오류!!');
		}
	}); //ajax


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
			event.target.parentElement.parentElement.remove();

		},
		error: function() {
			alert('거절 오류!!');
		}
	}); // ajax
}



////////////////////////////// 플랜 생성/삭제  //////////////////////////////////

// 플랜 생성
function addPlan(event, license, grpCnt) {
	if (license == 'free' && grpCnt >= 1) {
		alert("생성 가능한 최대 플랜 수 입니다.");

		event.preventDefault();
	} else if (license == 'premium' && grpCnt >= 10) {
		alert("생성 가능한 최대 플랜 수 입니다.");

		event.preventDefault();
	}
}

// 플랜 삭제
function delPlan(event, grp_num) {

	if (confirm("플랜을 삭제하시겠습니까?")) {
		$.ajax({
			url: '/planREST/delete/' + grp_num,
			type: 'post',
			success: function(data) {
				event.target.parentElement.remove();
				alert("삭제를 완료했습니다.");

				const plans = document.querySelectorAll('.plan-container > li');
				// 플랜 수 - 1
				if (license == 'free' && plans.length > 0) { // 유료->무료 전환의 경우 플랜이 1개 초과일 수 있음. 남은 목록 1개 이상이면 삭제해도 남은 수 1 표시
					nowCnt.innerText = 1;
				} else {
					nowCnt.innerText = nowCnt.innerText - 1;
				}


				// 유료->무료 회원의 경우 최신 1개 제외하고 disabled 처리됨
				// => 사용 가능한 최신 1개 삭제하면 다음 플랜 사용가능하게 처리
				if (license == 'free' && plans.length > 0) {
					plans[0].firstElementChild.disabled = 'false';
					plans[0].firstElementChild.style.backgroundColor = '#6e94a9';
					plans[0].firstElementChild.style.color = '#fff';
					plans[0].firstElementChild.style.cursor = 'pointer';
				}


			},
			error: function() {
				alert("삭제 오류!");
			}
		}); //ajax

	}
}






// 그룹 생성 - 그룹명 입력 유효성 검사
function check() {
	const planForm = document.querySelector('.plan-form');
	const inputGrpName = document.querySelector('.grp-name');

	if (inputGrpName.value == "") {
		alert('그룹명을 입력하세요');
		return false;
	}
}
