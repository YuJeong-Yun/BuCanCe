const menu = document.querySelector('.show-grp-menu .show-grp');
const member = document.querySelector('.grp-member');

menu.addEventListener('click', hideMember);

// 그룹 멤버 숨기기 버튼
function hideMember() {
	member.classList.toggle("hidden");
}; // hideMember




////////////////////////////// 회원 초대 /////////////////////////////////////////
const searchInput = document.querySelector('.member-search-input');
const memberList = document.querySelector('.member-list');
const inviteModal = document.querySelector('#exampleModal');

// 초대 모달 종료 시, 입력창 초기화
inviteModal.addEventListener('hidden.bs.modal', function(event) {
	// 기존 id 검색 결과 제거
	while (memberList.hasChildNodes()) {
		memberList.removeChild(memberList.firstChild);
	}
	// 아이디 검색창 초기화
	searchInput.value = '';
});


// 초대 멤버 검색
function showMember() {
	let searchID = searchInput.value.trim();

  // 공백만 검색했을 경우
  if(searchID === '') {
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

			// 검색 결과 없으면
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
}; //showMember()


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
			if (item == 0) {
				alert('더 이상 초대할 수 없습니다.');
				return;
			} else if (item == -1) {
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
			const memberContainer = document.querySelector('.member-container');

			const addInviteMember = document.createElement('li');
			let addInviteMemberInner =
				'<div class="invite-cancle" onclick="inviteCancle(event, \'' + id + '\');">초대 취소</div>' +
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
function inviteCancle(event, id) {
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
					location.href = '/plan/planContent/' + grpNum;
				}

			},
			error: function() {
				alert('초대 취소 에러!!');
			}
		}); //ajax
	}
}


//////////////////////////////////////////////// 플랜 삭제 //////////////////////////////////////////////////
// 플랜 삭제
function delPlan(event) {
	if (confirm("플랜을 삭제하시겠습니까?")) {
		$.ajax({
			url: '/planREST/delete/' + grpNum,
			type: 'post',
			success: function(data) {
				alert("삭제를 완료했습니다.");

				location.href = '/plan/planList';
			},
			error: function() {
				alert("삭제 오류!");
			}
		}); //ajax
	}
}