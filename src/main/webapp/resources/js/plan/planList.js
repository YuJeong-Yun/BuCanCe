const acceptListCnt = document.querySelector('span.acceptListCnt');
const acceptListBox = document.querySelector('div.acceptListBox');
const addGroup = document.querySelector('button.add-group');
const grpAcceptList = document.querySelector('ul.grp-accept-list');


// 그룹 초대 수락 버튼 클릭
function acceptGrp(event, grp_num, license) {
	const plans = document.querySelectorAll('.plan-container > li');

	// 최대 플랜 수이면 초대 수락버튼 클릭 시 최대 플랜 수 알림 메세지
	if (license == "free" && plans.length == 1) {
		alert("생성 가능한 최대 플랜 수 입니다. 플랜 삭제 후 초대를 수락해 주세요.");
		return;
	} else if (license == "premium" && plans.length == 10) {
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
			event.target.parentElement.parentElement.style.display = 'none';

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
			newPlanInner += '</ul>';
			newPlan.innerHTML = newPlanInner;


			// 최신순으로 정렬했을 때 맞는 순서에 새 그룹 추가
			for (let i = 0; i < plans.length; i++) {
				if (grp_num > plans[i].className) {
					plans[i].before(newPlan);
					break;
				}
			} // for

			// 최대 그룹 수 도달했을 때
			// 플랜 추가 버튼 삭제
			// 초대 수락 불가 메세지 출력
			const NoAcceptMsg = document.createElement('div');
			NoAcceptMsg.classList.add('no-accept-list');
			NoAcceptMsg.innerHTML = '생성 가능한 최대 플랜 수 입니다.<br>초대를 수락할 수 없습니다.<br><br>';
			if (license == "free") {
				addGroup.style.display = "none";
				grpAcceptList.prepend(NoAcceptMsg);
			} else if (license == "premium" && plans.length + 1 == 10) {
				addGroup.style.display = "none";
				grpAcceptList.prepend(NoAcceptMsg);
			}


		},
		error: function() {
			alert('수락 오류!!');
		}
	}); // ajax


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
	}); // ajax
}



////////////////////////////// 플랜 삭제 //////////////////////////////////

function delPlan(event, grp_num) {
	if (confirm("플랜을 삭제하시겠습니까?")) {
		event.target.parentElement.style.display = 'none';

		$.ajax({
			url: '/planREST/delete/' + grp_num,
			type: 'post',
			success: function(data) {
				alert("삭제를 완료했습니다.");
			},
			error: function() {
				alert("삭제 오류!");
			}
		}); //ajax
	}
}