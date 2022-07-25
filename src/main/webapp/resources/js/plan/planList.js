const acceptListCnt = document.querySelector('span.acceptListCnt');
const acceptListBox = document.querySelector('div.acceptListBox');
const addGroup = document.querySelector('button.add-group');
const grpAcceptList = document.querySelector('ul.grp-accept-list');
const planContainer = document.querySelector('.plan-container');

// 그룹 초대 수락 버튼 클릭
function acceptGrp(event, grp_num) {
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
		url: path + '/planREST/accept/' + grp_num,
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
			newPlan.classList.add('grp' + grp_num);
			let newPlanInner = '<input type=button class=plan value="' + data.grpName + '" onclick=location.href="/plan/planContent/' + grp_num + '";>' +
				'<ul class=member-container>';
			for (let i = 0; i < data.grpMember.length; i++) {
				newPlanInner += '<li>';

				// 리더면 별 표시
				if (data.leader == data.grpMember[i].id) {
					newPlanInner += '<span class="material-icons-outlined leader">star</span>';
				}
				newPlanInner += '<div class="member--profile">';
				// 프로필 있으면 프로필, 없으면 기본 출력
				if (data.grpMember[i].profile != null) {
					newPlanInner += '<img src="' + path + data.grpMember[i].profile + '" width="60" height="60" style="border-radius : 90px">';
				} else {
					newPlanInner += '<img src="' + path + '/resources/img/profile/profile1.png" width="60" height="60" style="border-radius : 90px">';
				}

				newPlanInner += '</div>' +
					'<div class="member--name">' + data.grpMember[i].id + '</div>' +
					'<div class="member--name">' + data.grpMember[i].name + '</div>' +
					'</li>';
			};
			newPlanInner += '</ul>' +
				'<div class="material-icons-outlined delete-plan" onclick="delPlan(event, ' + grp_num + ');">clear</div>';
			newPlan.innerHTML = newPlanInner;
			// 최신순으로 정렬했을 때 맞는 순서에 새 그룹 추가
			for (let i = 0; i < plans.length; i++) {
				if (grp_num > plans[i].className.substring(3)) {
					plans[i].before(newPlan);
					break;
				}
			} // for
			// 제일 첫 번째(생성된지 오래된) 플랜일 경우 제일 밑에 추가
			// 또는 현재 플랜 하나도 없을 경우 그냥 추가
			if (plans.length == 0 || grp_num < plans[plans.length - 1].className.substring(3)) {
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
		url: path + '/planREST/refusal/' + grp_num,
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


////////////////////////////// 회원 초대 /////////////////////////////////////////
const searchInput = document.querySelector('.member-search-input');
const memberList = document.querySelector('.member-list');
const inviteModal = document.querySelector('#exampleModal2');

// 초대 모달 종료 시, 입력창 초기화
inviteModal.addEventListener('hidden.bs.modal', function(event) {
	// 기존 id 검색 결과 제거
	while (memberList.hasChildNodes()) {
		memberList.removeChild(memberList.firstChild);
	}
	// 아이디 검색창 초기화
	searchInput.value = '';
});

// 초대하려는 그룹 번호 가져오기
let grpNum = 0;
function setGrpNum(num) {
	grpNum = num;
}
// 초대 멤버 검색
function showMember() {
	let searchID = searchInput.value.trim();

	// 공백만 검색했을 경우
	if (searchID === '') {
		alert('검색값을 입력해 주세요.');
		return;
	}

	$.ajax({
		url: path + '/planREST/memberID',
		type: 'post',
		data: {
			id: searchID,
			grpNum: grpNum
		},
		success: function(item) {
			// 기존 id 검색 결과 제거
			while (memberList.hasChildNodes()) {
				memberList.removeChild(memberList.firstChild);
			}

			// 검색 결과 없을 경우
			if (item.memberArr.length == 0) {
				const noResult = document.createElement('li');
				noResult.innerHTML = '<div>검색 결과가 없습니다.</div>';

				memberList.append(noResult);

				// 검색 결과 있을 경우
			} else {
				// 초대 중인 회원 아이디 배열
				let invitingIDList = [];
				item.invitingArr.forEach(member => {
					invitingIDList.push(member.receiver);
				});
				console.log(invitingIDList);
				// 그룹 회원 아이디 배열
				let grpMemberIDList = [];
				item.grpMemberArr.forEach(member => {
					grpMemberIDList.push(member.id);
				});
				// id 검색 결과 목록 나열
				for (let i = 0; i < item.memberArr.length; i++) {
					const member = document.createElement('li');
					let memberInner =
						"<div class=member--id>" + item.memberArr[i].id + "</div>" +
						"<div class=member--name>" + item.memberArr[i].name + "</div>";


					// 초대 중인 회원일 경우
					if (invitingIDList.includes(item.memberArr[i].id)) {
						memberInner += "<button type=button class='btn btn-light' disabled>초대중</button>";

						// 이미 그룹 회원일 경우
					} else if (grpMemberIDList.includes(item.memberArr[i].id)) {
						memberInner += "<button type=button class='btn btn-light' disabled>멤버</button>";

						// 초대 가능한 회원일 경우
					} else {
						memberInner += "<button type=button class='btn btn-primary add-member' onclick='inviteMember(event, \"" + item.memberArr[i].id + "\")'>초대</button>";

					}
					member.innerHTML = memberInner;
					memberList.append(member);
				} // for
			} // if
		},
		error: function() {
			alert("검색 오류");
		}
	}); // $.ajax
}; // showMember()


// 초대
function inviteMember(event, id) {

	$.ajax({
		url: path + '/planREST/invite',
		type: 'post',
		data: {
			id: id,
			grpNum: grpNum
		},
		success: function(item) {
			if (item == 'no') {
				alert('더 이상 초대할 수 없습니다.');
				return;
			} else if (item == 'ing') {
				alert('이미 초대중인 회원입니다.');
				return;
			}

			// 초대클릭하면 '초대중' 으로 버튼 변경
			event.target.classList.remove('btn-primary');
			event.target.classList.remove('add-member');
			event.target.classList.add('btn-light');
			event.target.disabled = 'true';
			event.target.innerText = '초대중';


			// 그룹 멤버 리스트에 초대중 회원 추가
			const memberContainer = document.querySelector('li.grp' + grpNum + ' .member-container');

			const addInviteMember = document.createElement('li');
			let addInviteMemberInner =
				'<div class="invite-cancle" onclick="inviteCancle(event, ' + grpNum + ',\'' + id + '\');">초대 취소</div>' +
				'<div class="member--id">' + id + '</div>' +
				'<div class="member--name">' + item + '</div>';

			addInviteMember.innerHTML = addInviteMemberInner;
			// 추가 버튼 앞에 추가
			memberContainer.children[memberContainer.childElementCount - 1].before(addInviteMember);

		},
		error: function() {
			alert('초대 오류!!');
		}
	}); // $.ajax
}

// 초대 취소
function inviteCancle(event, grpNum, id) {
	if (confirm('초대를 취소하시겠습니까?')) {
		$.ajax({
			url: path + '/planREST/inviteCancle',
			type: 'post',
			data: {
				grpNum: grpNum,
				id: id
			},
			success: function(item) {
				event.target.parentElement.remove();

				// 이미 초대 수락했을 경우
				if (item == 1) {
					alert('이미 상대가 초대를 수락했습니다.');
					location.href = '/plan/planList';
				}

			},
			error: function() {
				alert('초대 취소 에러!!');
			}
		}); //ajax
	}
}


////////////////////////////// 플랜 생성/삭제  //////////////////////////////////
const addPlanModal = document.querySelector('#exampleModal');

addPlanModal.addEventListener('show.bs.modal', addPlanCheck);

// 플랜 생성 시 생성 가능한 최대 플랜 수 확인
function addPlanCheck(event) {
	const grpCnt = document.querySelector('.plan-cnt .cnt-now').innerText;

	// 생성 가능한 최대 그룹 수 확인
	if (license == 'free' && grpCnt >= 1) {
		alert("생성 가능한 최대 플랜 수 입니다.");
		event.preventDefault();
	} else if (license == 'premium' && grpCnt >= 10) {
		alert("생성 가능한 최대 플랜 수 입니다.");
		event.preventDefault();
	};
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
					// 방장이면 초대 아이콘 출력
					if (plans[0].firstElementChild.nextElementSibling.querySelector('li.invite-member') != null) {
						plans[0].firstElementChild.nextElementSibling.querySelector('li.invite-member').style.display = 'block';
					}
				}

			},
			error: function() {
				alert("삭제 오류!");
			}
		}); //ajax

	}
}





// 플랜 생성
const planForm = document.querySelector('.plan-form');
const inputGrpName = document.querySelector('.grp-name');

function check() {
	// 그룹명 공백 체크
	if (inputGrpName.value.trim() == "") {
		alert('그룹명을 입력하세요');
		return false;
	};

}
