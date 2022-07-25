let positions = []; // 일별로 마커 정보 담을 배열
let orderedTour = []; // 사용자가 설정한 관광지 순서대로 cNum값 담을 배열
let straightPolyLine = []; // 직선 폴리라인 담을 배열
let checkShowLinePath = 0; // 직선 폴리라인 출력 여부 확인 변수
let hotelList = []; // 숙소 정보 담을 배열
let getHotelList = 0; // 숙소 정보 가져오기 완료 여부 담을 변수 0-미완 1-완료

// 지도
var map = new Tmapv2.Map("map_div", {
	center: new Tmapv2.LatLng(35.179792, 129.074958), // 지도 초기 좌표 - 부산 시청
	width: "1000px",
	height: "650px",
	zoom: 11
});
map.setOptions({
	zoomControl: false
}); // 지도 옵션 줌컨트롤 표출 비활성화

// 숙소 리스트 비동기로 가져와서 추가
const accContainer = document.querySelector('.tour-list li.tour.accomodation .tour__contents > ul');
$.ajax({
	url: path + '/planREST/accomodation',
	type: 'post',
	success: function(data) {
		hotelList = data;
		// 선택된 숙소의 cNum 가져오기
		let cNumValue = [];
		const selectedCNumArr = document.querySelectorAll('.plan__contents .plan-item .num');
		selectedCNumArr.forEach(cNum => {
			if (cNum.value.charAt(0) == 'a') {
				cNumValue.push(cNum.value);
			}
		});

		// 로딩중... 제거
		accContainer.removeChild(accContainer.firstElementChild);

		// 숙소 태그 만들어서 추가
		for (let i = 0; i < data.length; i++) {
			const acc = data[i];
			const accItem = document.createElement('li');
			accItem.classList.add('tour-item');
			accItem.classList.add('a' + acc.num);
			accItem.addEventListener('click', selectTour);
			// 선택되어 있는 숙소이면 목록에서 숨김
			if (cNumValue.includes('a' + acc.num)) {
				accItem.classList.add('hidden');
			}

			const accItemInner =
				'<img src="' + acc.thumbnail + '" alt="' + acc.title + '" class="content__img" />' +
				'<div class="description">' +
				'<div class="content__title">' + acc.title + '</div>' +
				'</div>' +
				'<input type="hidden" value="' + acc.num + '" class="num">' +
				'<input type="hidden" value="' + acc.lng + '" class="lng">' +
				'<input type="hidden" value="' + acc.lat + '" class="lat">';

			accItem.innerHTML = accItemInner;
			accContainer.append(accItem);

			// 숙소 정보 가져오기 완료
			getHotelList = 1;
		}
	},
	error: function() {

	}
}); //ajax

///////////////////////////////// 처음 페이지 로드시 저장된 플랜 있을 경우 실행 /////////////////////////////
const datePlanContainer = document.querySelector('.date-plan-container');
const btnContainer = document.querySelector('.btn-container.hidden');
if (datePlanContainer.childElementCount > 0) {
	// 일정칸 보이기
	datePlanContainer.classList.remove('hidden');
	btnContainer.classList.remove('hidden');

	// 제일 처음 날짜칸 선택된 상태로 만들기
	const firstContent = document.querySelector('.date-plan-container li.plan .plan__date');
	firstContent.classList.add('date-active');
	// 뒤에 날짜는 내용 숨기기
	const datePlanContents = document.querySelectorAll('.date-plan-container .plan__contents');
	datePlanContents.forEach(content => {
		content.classList.add('hidden');
	});
	// 처음 날짜칸은 내용 보이기
	firstContent.nextElementSibling.classList.remove('hidden');

	// 선택된 관광지는 관광지 목록에서 숨기기
	// 선택된 관광지 cNum(카테고리+num) 가져오기 - 관광지:t  맛집:r  숙소:a
	const selectedCNumArr = document.querySelectorAll('.plan__contents .plan-item .num');
	selectedCNumArr.forEach(cNum => {
		const cNumValue = cNum.value;
		// 숙소 정보는 비동기로 가져옴 -> 비동기로 가져올 때 처리
		if (cNumValue.charAt(0) != 'a') {
			document.querySelector('.tour-item.' + cNumValue).classList.add('hidden');
		}
	});

	// 드래그 이벤트 추가
	applyDragEventContainer();
	const dragItem = document.querySelectorAll('.date-plan-container li.plan-item');
	dragItem.forEach(item => {
		item.addEventListener("dragstart", addDragging);
		item.addEventListener("dragend", delDragging);
	});

	// 선택한 플랜 정보 가져오기
	$.ajax({
		url: path + '/planREST/planList/' + grp_num,
		type: 'post',
		async: false,
		success: function(data) {
			// positions, orderedTour 값 넣기 + 마커 생성
			for (let i = 0; i < data.length; i++) {
				const plan = data[i][1];
				positions.push({}); // 마커 객체 일정 만큼 추가
				orderedTour.push([]); // 마커 순서 담을 배열 일정만큼 추가
				straightPolyLine.push([]); // 직선 폴리라인 담을 배열 일정만큼 추가

				// 선택한 관광지 정보 없으면 넘어감
				if (plan.length == 0) {
					continue;
				}

				let length = 1;
				for (let j = 0; j < plan.length; j++) {
					// 카테고리별로 아이콘 이미지 경로 설정
					let cNum = 't' + plan[j].num; // cNum : 카테고리+num
					let markerIcon = path + '/resources/img/marker/markert.png'; // 관광지일 경우
					if (plan[j].t_category == 1) { // 맛집일 경우
						markerIcon = path + '/resources/img/marker/markerr.png';
						cNum = 'r' + plan[j].num;
					} else if (plan[j].t_category == -1) { // 숙소일 경우
						markerIcon = path + '/resources/img/marker/markera.png';
						cNum = 'a' + plan[j].num;
					}

					// 마커 positon에 저장
					const newMarker = new Tmapv2.Marker({
						title: plan[j].title,
						position: new Tmapv2.LatLng(plan[j].lat, plan[j].lng), //Marker의 중심좌표 설정.
						icon: markerIcon,
						label: "<span style='background-color: #46414E; color:white; padding:3px 8px; border-radius: 50%;'>" + length + "</span>", // 라벨 설정
						map: map //Marker가 표시될 Map 설정.
					});
					positions[i][cNum] = newMarker;
					orderedTour[i][length - 1] = cNum;
					length++;
					// 처음 날짜칸 마커만 출력
					if (i != 0) {
						newMarker.setMap(null);
					}
				} // for
			} // for
		},
		error: function() {
			alert('저장된 플랜 정보 가져오기 오류!!');
		}
	});
};





////////////////////////////////////////////////////////////////////////////////////////

const menu = document.querySelector('.show-title-btn .show-title');
const planTitle = document.querySelector('.plan-title');

menu.addEventListener('click', hideTitle);

// 타이틀 숨기기 버튼
function hideTitle() {
	planTitle.classList.toggle("hidden");
};


//////////////////////////////////////////////// 일정 선택 /////////////////////////////////////

const setDateBtn = document.querySelector('input.set-date');

setDateBtn.addEventListener('click', checkDate);

// date 날짜 계산 (String -> Date)
function calcDate(dateData) {
	const year = dateData.split('-')[0];
	const month = dateData.split('-')[1] - 1;
	const date = dateData.split('-')[2];
	return new Date(year, month, date);
}; // calcDate



// 1-7일 여행 일정 선택
function checkDate() {
	// 호텔 목록 가져오기 전이면 기다려 달라고 알림창 띄우기
	if (getHotelList == 0) {
		alert('숙소 목록을 가져오기까지 잠시만 기다려주세요.');
		return;
	}
	// 직선 경로 확인 켜져 있으면 우선 현재 직선 경로 제거
	if (checkShowLinePath == 1) {
		delLinePath();
	}

	let startDateS = document.querySelector('.start-date').value;
	let endDateS = document.querySelector('.end-date').value;
	// 날짜 선택 필수
	if (endDateS == '' || startDateS == '') {
		alert('날짜를 선택하세요.');
		return;
	}
	// 앞선 날자를 startDate, 이후 날짜를 endDate에 담기
	if (endDateS < startDateS) {
		const temp = startDateS;
		startDateS = endDateS;
		endDateS = temp;
	}
	// 두 여행 날짜 차이 7일 이하여야함
	const startDate = calcDate(startDateS) / (1000 * 60 * 60 * 24);
	const endDate = calcDate(endDateS) / (1000 * 60 * 60 * 24);
	const dateDiff = endDate - startDate;
	if (dateDiff > 6) {
		alert('여행 일정은 7일 까지만 설정 가능합니다.');
		document.querySelector('.end-date').focus();
		return;
	}

	// 페이지 하단에 일정별로 관광지 선택 칸 생성
	if (datePlanContainer.classList.contains('hidden')) {
		datePlanContainer.classList.remove('hidden');
		btnContainer.classList.remove('hidden');
	}
	// 기존 일정 칸 제거
	while (datePlanContainer.firstChild) {
		datePlanContainer.removeChild(datePlanContainer.lastChild);
	}
	// 경로 제거
	if (new_polyLine.length > 0) {
		delPath();
	}

	// 지도에 생성한 마커 초기화
	delAllMarker();


	const year = startDateS.substring(0, 4);
	let month = Number(startDateS.substring(5, 7)); // 07 -> 7 로 받아옴 (숫자 앞에 0 제거)
	let date = Number(startDateS.substring(8, 10));
	const lastDate = new Date(year, month, 0).getDate(); // 이번 달 마지막 날짜
	// 선택한 일정 만큼 일정칸 추가
	for (let i = startDate; i <= endDate; i++) {
		positions.push({}); // 마커 객체도 일정 만큼 추가
		orderedTour.push([]); // 마커 순서 담은 배열도 일정만큼 추가
		straightPolyLine.push([]); // 직선 폴리라인 담을 배열 일정만큼 추가
		const newDate = month + " / " + date;
		// 이번 달 마지막 날짜인지 체크
		if (date + 1 > lastDate) {
			month += 1;
			date = 1;
		} else {
			date++;
		}
		const newPlan = document.createElement('li');
		newPlan.classList.add('plan');
		newPlan.innerHTML =
			'<div class="plan__date" onclick="selectDate(event)">' + newDate + '</div>' +
			'<div class="plan__contents hidden">' +
			'<ul class="inner">' +
			'</ul>' +
			'</div>';
		datePlanContainer.append(newPlan);
	}
	// 일정 선택칸에서 관광지 드래그로 순서 변경
	applyDragEventContainer();

	// 첫 날 선택된 상태로 설정
	const firstDate = document.querySelector('li.plan');
	firstDate.firstElementChild.classList.add('date-active');
	firstDate.lastElementChild.classList.remove('hidden');

	// 날짜 새로 선택하면, 선택되어서 숨겨진 관광지 모두 출력
	const hiddenTourList = document.querySelectorAll('li.tour-item.hidden');
	hiddenTourList.forEach(item => {
		item.classList.remove('hidden');
	});

}; // checkDate
// 컨테이너에 드래그 적용
function applyDragEventContainer() {
	const containers = document.querySelectorAll('.plan__contents > ul');
	containers.forEach(container => {
		container.addEventListener("dragover", e => {
			e.preventDefault();
			const afterElement = getDragAfterElement(container, e.clientX);
			const draggable = document.querySelector(".dragging");
			if (afterElement === undefined) {
				container.appendChild(draggable);
			} else {
				container.insertBefore(draggable, afterElement);
			}
		});
	});
}; // applyDragEventContainer
// 드래그하는 요소가 다른 요소 사이에 들어가는 것 구현
function getDragAfterElement(container, x) {
	const draggableElements = [
		...container.querySelectorAll(".draggable:not(.dragging)"),
	];

	return draggableElements.reduce(
		(closest, child) => {
			const box = child.getBoundingClientRect();
			const offset = x - box.left - box.width / 2;
			if (offset < 0 && offset > closest.offset) {
				return {
					offset: offset,
					element: child
				};
			} else {
				return closest;
			}
		}, {
		offset: Number.NEGATIVE_INFINITY
	}
	).element;
}; // getDragAfterElement()



// 현재 활성화된 날짜가 몇 번째인지 계산
function calcDateSeq() {
	const dateContainer = document.querySelectorAll('.date-plan-container .plan__date');
	let i = 0;
	for (i; i < dateContainer.length; i++) {
		if (dateContainer[i].classList.contains('date-active')) {
			break;
		}
	}
	return i;
}



// 여행 일정칸에서 날짜 선택시 해당 날짜 칸 활성화 & 해당 날짜 일정 정보(마커) 지도에 표시
function selectDate(event) {
	// 기존에 선택된 날짜의 마커들 지도에서 제거
	const pre = calcDateSeq();
	delDateMarker(pre);
	// 직선 경로 출력 켜져 있으면 제거
	if (checkShowLinePath == 1) {
		delLinePath();
	}

	// 선택한 날짜 칸 활성화
	const dateActive = document.querySelectorAll('.date-active');
	dateActive.forEach(item => {
		item.classList.remove('date-active');
		item.nextElementSibling.classList.add('hidden');
	});
	event.target.classList.add('date-active');
	event.target.nextElementSibling.classList.remove('hidden');

	const temp = calcDateSeq();
	// 지도에 해당 날짜의 마커 정보 표시
	printDateMarker(temp);
	// 직선 경로 확인 켜져있으면 다시 계산
	if (checkShowLinePath == 1) {
		showLinePath();
	}
}; //selectDate



/////////////////////////////////////////// 검색 ////////////////////////////////////////////////
const searchIcon = document.querySelector('.search-container .search-icon');

searchIcon.addEventListener('click', showSearhResult);

// 검색 결과 보여주는 함수
function showSearhResult() {
	// 호텔 목록 가져오기 전이면 기다려 달라고 알림창 띄우기
	if (getHotelList == 0) {
		alert('숙소 목록을 가져오기까지 잠시만 기다려주세요.');
		return;
	}

	// 입력값 받아오기
	const userInput = document.querySelector('.search-container .search').value.trim();
	// 공백 입력하면 작동 xx
	if (userInput == '') {
		alert('검색어를 입력하세요.');
		return;
	}

	// 현재 선택된 카테고리
	const selectedCategory = document.querySelector('.tour__title.tour-active'); // 현재 선택된 카테고리
	let category = selectedCategory.innerText.substring(0, 1); // 관광지:m , 숙소:b, 맛집:r
	if (category == 'm') {
		category = 't';
	} else if (category == 'b') {
		category = 'a';
	}
	// 선택한 카테고리 검색 결과창 보이기
	const resultContainer = selectedCategory.nextElementSibling.querySelector('.search-result');
	resultContainer.classList.remove('hidden');

	// 기존 검색 결과값 삭제
	while (resultContainer.firstChild) {
		resultContainer.removeChild(resultContainer.lastChild);
	}
	// 관광지 / 맛집 검색일 경우
	if (category == 't' || category == 'r') {
		$.ajax({
			url: path + '/planREST/searchTour',
			type: 'post',
			data: {
				category: category,
				keyword: userInput,
				hotelList: hotelList
			},
			success: function(data) {
				addSearchResultTour(data, category, resultContainer);
				// 검색 결과 없으면
				if (resultContainer.childElementCount == 0) {
					resultContainer.innerHTML = '<div style="padding:20px; color: #fff;">검색 결과가 없습니다.</div>';
				}
			},
			error: function() {
				alert('검색 오류!!');
			}
		}); //ajax

		// 숙소 검색일 경우
	} else { // category == 'a'
		// 검색 결과 숙소 정보 담을 배열 data
		let data = [];
		for (let i = 0; i < hotelList.length; i++) {
			const title = hotelList[i].title;
			if (title.indexOf(userInput) != -1) {
				data.push(hotelList[i]);
			}
		} // for

		addSearchResultTour(data, category, resultContainer);
		// 검색 결과 없으면
		if (resultContainer.childElementCount == 0) {
			resultContainer.innerHTML = '<div style="padding:20px; color: #fff;">검색 결과가 없습니다.</div>';
		}
	}
}; //showSearchResult()
// 검색 결과 관광지 출력하는 함수
function addSearchResultTour(data, category, resultContainer) {
	let tour;
	let tourItem; // 관광지에서 선택되어있는지 확인하기 위해 쓰는 변수
	for (let i = 0; i < data.length; i++) {
		tour = data[i];

		// 이미 선택된 관광지는 출력 X
		tourItem = document.querySelector('.tour-item.' + category + tour.num);
		if (tourItem.classList.contains('hidden')) {
			continue;
		}


		const searchPlan = document.createElement('li');
		searchPlan.classList.add('tour-item');
		searchPlan.classList.add(category + tour.num);
		searchPlan.addEventListener('click', selectTour);
		let searchPlanInner =
			'<img src ="' + tour.thumbnail + '" alt="" class="content__img" />';

		// 숙소일 경우 상세보기 없음
		if (category == 'a') {
			searchPlanInner += '<div class="content__title">' + tour.title + '</div>';
		} else {
			searchPlanInner +=
				'<div class="description">' +
				'<div class="content__title">' + tour.title + '</div>' +
				'<span class="content__detail" data-bs-toggle="modal" data-bs-target="#tourModal" onclick="showDetailInfo(' + tour.num + ')">상세정보</span>' +
				'</div>';
		}
		searchPlanInner +=
			'<input type="hidden" value="' + tour.num + '" class="num">' +
			'<input type="hidden" value="' + tour.lng + '" class="lng">' +
			'<input type="hidden" value="' + tour.lat + '" class="lat">';
		searchPlan.innerHTML = searchPlanInner;
		resultContainer.append(searchPlan);
	}
}


/////////////////////////////////////////// 관광지 리스트 ////////////////////////////////////////
let selectedTourArr = [];

// 카테고리 선택 (관광지/숙소/맛집)
function selectCategory(event) {
	const categoryActive = document.querySelectorAll('.tour-active');
	categoryActive.forEach(item => {
		item.classList.remove('tour-active');
		item.nextElementSibling.classList.add('hidden');
	});
	// 선택한 카테고리 관광지 리스트 출력
	event.target.classList.add('tour-active');
	event.target.nextElementSibling.classList.remove('hidden');

	const resultContainer = document.querySelectorAll('.tour-list .tour__contents .search-result');
	resultContainer.forEach(item => {
		// 검색 결과창 비우기
		while (item.firstChild) {
			item.removeChild(item.lastChild);
		}
		// 검색 결과창 닫기
		item.classList.add('hidden');
	});
}; // selectCategory()



// 관광지 클릭하면 선택한 일정칸에 추가
function selectTour(event) {
	// 해당 요소 선택했을 때만 실행 - 자식 요소는 클릭해도 변화 없음
	if (event.target !== event.currentTarget) { return };


	// 호텔 목록 가져오기 전이면 기다려 달라고 알림창 띄우기
	if (getHotelList == 0) {
		alert('숙소 목록을 가져오기까지 잠시만 기다려주세요.');
		return;
	}
	// 관광지 : t, 숙소 : a, 맛집 : r
	const category = event.target.classList[1].substring(0, 1);

	// 먼저 일정 선택
	const selectedDate = document.querySelector('.date-active');
	if (selectedDate == null) {
		alert('일정을 선택하세요.');
		return;
	}
	// 하루 당 일정 최대 10개 설정 가능
	const dateTourContainer = selectedDate.nextElementSibling.firstElementChild;
	if (dateTourContainer.childElementCount >= 10) {
		alert('일정은 하루에 최대 10개 선택 가능합니다.');
		return;
	}

	// 일정 칸에 선택한 관광지 추가
	const firstChild = event.target.firstElementChild;
	const img = firstChild.src;
	const title = firstChild.nextElementSibling.firstElementChild.innerText;
	const num = firstChild.nextElementSibling.nextElementSibling.value;
	const lng = firstChild.nextElementSibling.nextElementSibling.nextElementSibling.value;
	const lat = firstChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.value;
	const cNum = event.target.classList[1]; // 카테고리+num
	// 선택한 관광지는 리스트에서 숨기기
	event.target.classList.add('hidden');
	document.querySelector('.tour-item.' + cNum).classList.add('hidden'); // 검색 결과에서 선택했을 경우 전체 관광 리스트에서도 제거해야됨

	// 관광지 li 태그 생성해서 일정칸에 추가
	const newTour = document.createElement('li');
	newTour.classList.add('plan-item');
	newTour.classList.add('draggable');
	newTour.draggable = 'true';
	let newTourInner = '<div class="tour-wrapper">';
	// 식당 & 숙소는 구별 아이콘 추가
	if (category == 'r') {
		newTourInner += '<div class="material-icons-outlined restaurant">restaurant</div>';
	} else if (category == 'a') {
		newTourInner += '<div class="material-icons-outlined hotel">bed</div>';
	}
	newTourInner +=
		'<img src="' + img + '" alt="" class="content__img" />' +
		'<div class="content__title">' + title + '</div>' +
		'<button class="delBtn" onclick="delSelectedTour(event,\'' + cNum + '\')">x</button>' +
		'<input type="hidden" value="' + cNum + '" class="num">' +
		'</div>';
	newTour.innerHTML = newTourInner;
	// 드래그 이벤트 추가 - 드래그한 요소 투명도 0.5로 설정
	newTour.addEventListener("dragstart", addDragging);
	newTour.addEventListener("dragend", delDragging);

	dateTourContainer.append(newTour);


	// 카테고리별로 아이콘 설정 -> 지도에 마커 표시
	let markerIcon = path + '/resources/img/marker/markert.png';
	if (category == 'r') {
		markerIcon = path + '/resources/img/marker/markerr.png';
	} else if (category == 'a') {
		markerIcon = path + '/resources/img/marker/markera.png';
	}
	const seq = calcDateSeq(); // 선택한 날짜가 몇 번째 날짜인지 계산
	addMarker(cNum, title, lng, lat, markerIcon, seq); // 지도에 마커 추가 & 해당하는 날짜 순서의 배열에 마커 정보 추가
	// 직선 경로 확인 켜져있으면 다시 계산
	if (checkShowLinePath == 1) {
		delLinePath();
		showLinePath();
	}
}; // selectTour()
function addDragging(event) {
	event.target.classList.add("dragging");
}; // addDragging()
function delDragging(event) {
	// 호텔 목록 가져오기 전이면 기다려 달라고 알림창 띄우기
	if (getHotelList == 0) {
		alert('숙소 목록을 가져오기까지 잠시만 기다려주세요.');
		return;
	}

	event.target.classList.remove("dragging");
	// 지도에서 마커 순서 다시 표시
	const seq = calcDateSeq();
	calcTourSeq(seq);
	// 직선 경로 확인 켜져있으면 제거하고 다시 출력
	if (checkShowLinePath == 1) {
		delLinePath();
		showLinePath();
	}
}; //delDragging()



// 상세정보 확인 클릭
const tourModal = document.querySelector('#tourModal');
const detailTitle = document.querySelector('#tourModal .detail__title');
const detailImg = document.querySelector('#tourModal .detail__content .content__img');
const detailRuntime = document.querySelector('#tourModal .detail__content .content__runtime');
const detailAddr = document.querySelector('#tourModal .detail__content .content__addr');
const detailHomePage = document.querySelector('#tourModal .detail__content .content__homepage');
const detailContent = document.querySelector('#tourModal .detail__content .content__content');
const moreBtn = document.querySelector('#tourModal .more');
// 관광지 상세정보 모달
function showDetailInfo(num) {
	// 모달창 오픈 막음
	$('#tourModal').modal('hide')

	$.ajax({
		url: path + '/planREST/tourInfo',
		type: 'post',
		data: {
			num: num
		},
		success: function(data) {
			detailTitle.innerText = data.title;
			detailImg.src = data.thumbnail;
			detailImg.alt = data.title;
			detailRuntime.innerText = data.usage_day;
			detailAddr.innerText = data.addr_full;
			if (data.url != null) {
				detailHomePage.innerHTML = '<a href="' + data.url + '" target="_blank">' + data.url + '</a>';
			}
			detailContent.innerText = data.contents;

			// 상세보기에서 더 알아보기로 이동할 때 필요한 값
			detailTourNum = data.num;
			detailT_category = data.t_category;
			// 더 보러가기 클릭
			moreBtn.addEventListener('click', moreInfo);

			// 모달 창 열기
			$('#tourModal').modal('show');
		},
		error: function() {
			alert('상세정보 확인 에러!!');
		}
	}); //ajax
}
// 상세보기에서 더 알아보기로 이동할 때 필요한 값
let detailTourNum;
let detailT_category;
// 더 보러가기 클릭
function moreInfo() {
	location.href = path + '/board/infoDetail?num=' + detailTourNum + '&age=1&perPageNum=12&t_category=' + detailT_category + '&addr=all';
}



// 지도에서 마커 순서 다시 계산하는 함수
function calcTourSeq(seq) {
	orderedTour[seq] = [];
	const tourListContainer = document.querySelectorAll('.date-plan-container > li.plan')[seq];
	const tourList = tourListContainer.querySelectorAll('li.plan-item .num'); // 사용자가 선택한 순서대로 관광지 cNum 값 가진 hidden태그 가져옴
	// 사용자가 선택한 관광지 순서대로 cNum 담을 배열
	for (let i = 0; i < tourList.length; i++) {
		const cNum = tourList[i].value;
		orderedTour[seq].push(cNum);
	}
	// 마커 순서 변경
	let marker;
	for (let i = 0; i < tourList.length; i++) {
		const cNum = Object.keys(positions[seq])[i];
		marker = positions[seq][cNum];

		const label = "<span style='background-color: #46414E; color:white; padding:3px 8px; border-radius: 50%;'>" + (orderedTour[seq].indexOf(cNum) + 1) + "</span>";
		marker.setLabel(label);
	}
}; //calcTourSeq()




// 일정에서 관광지 삭제
function delSelectedTour(event, cNum) {
	// 호텔 목록 가져오기 전이면 기다려 달라고 알림창 띄우기
	if (getHotelList == 0) {
		alert('숙소 목록을 가져오기까지 잠시만 기다려주세요.');
		return;
	}

	const tours = document.querySelector('.tour-item.' + cNum);
	tours.classList.remove('hidden');
	tours.style.display = 'flex';
	event.target.parentElement.parentElement.remove();

	const seq = calcDateSeq();
	// 마커 삭제
	delOneMarker(seq, cNum);
	// 직선 경로 확인 켜져있으면 다시 계산
	if (checkShowLinePath == 1) {
		delLinePath();
		showLinePath();
	}
} // delSelectedTour()



//////////////////////////////////// 지도 //////////////////////////////////


// 관광지 클릭하면 마커 추가하는 함수
function addMarker(cNum, title, lng, lat, markerIcon, seq) {
	// 선택한 날짜의 관광지 수
	let length = Object.keys(positions[seq]).length + 1;

	// 마커 지도에 표시
	const newMarker = new Tmapv2.Marker({
		title: title,
		position: new Tmapv2.LatLng(lat, lng), //Marker의 중심좌표 설정.
		icon: markerIcon,
		label: "<span style='background-color: #46414E; color:white; padding:3px 8px; border-radius: 50%;'>" + length + "</span>", // 라벨 설정
		map: map //Marker가 표시될 Map 설정.
	});

	// positions에서 선택한 날짜(date-active)의 배열에 마커 정보 추가
	positions[seq][cNum] = newMarker;
	orderedTour[seq][length - 1] = cNum;
}; // addMarker()



// 지도에서 전체 마커 제거
function delAllMarker() {
	// 지도에 생성한 마커 초기화
	for (let i = 0; i < positions.length; i++) {
		delDateMarker(i);
	}
	positions = []; // 마커 배열 초기화
	orderedTour = []; // 마커 순서 담은 배열 초기화
}; //delAllMarker()

// 선택 날짜의 지도에 보이던 마커 제거하는 함수
function delDateMarker(seq) {
	// 기존 마커 지도에서 제거
	let delMarkers = Object.values(positions[seq]);
	let delMarker;
	for (let i = 0; i < delMarkers.length; i++) { //for문을 통하여 배열 안에 있는 값을 마커 생성
		delMarker = delMarkers[i];
		delMarker.setMap(null);
	}
}; // delDateMarker

// 단일 마커 제거하는 함수
function delOneMarker(seq, cNum) {
	// 지도에서 마커 제거
	const markers = positions[seq][cNum];
	markers.setMap(null);
	// 배열에서 제거
	delete positions[seq][cNum];
	// 마커 순서 다시 설정
	calcTourSeq(seq);
}; // delOneMarker

// 날짜 선택하면 해당 날짜에 선택한 일정 지도에 마커로 표시하는 함수
function printDateMarker(seq) {
	let markers = Object.values(positions[seq]);
	let marker;
	for (let i = 0; i < markers.length; i++) { //for문을 통하여 배열 안에 있는 값을 마커 생성
		marker = markers[i];
		marker.setMap(map);
	}
}; // printDateMarker()





//////////////////////////////////////////////////////// 버튼 클릭 /////////////////////////////////////////////////////////////
// 저장 & 경로 확인 페이지 이동
const saveBtn = document.querySelector('.btn-container .btn--save');
const moveBtn = document.querySelector('.btn-container .btn--move');
saveBtn.addEventListener('click', savePlan);
moveBtn.addEventListener('click', movePlanCheck);

// 선택한 관광지 저장
function savePlan() {
	const dateContainer = document.querySelectorAll('.date-plan-container li.plan .plan__date');
	const planContainer = document.querySelectorAll('.date-plan-container li.plan .plan__contents > ul');

	// 선택한 날짜 정보 담을 배열
	let dates = [];
	dateContainer.forEach(date => {
		dates.push(date.innerText);
	});

	// 플랜 정보 문자열로 연결해서 DB저장
	// 날짜랑 플랜은 >, 플랜끼리는 @, 날짜 끼리는 +로 구분
	let plan = '';
	// 타이틀, 이미지, 위도, 경도도 같이 저장 - planExtra 변수
	// 타이틀과 이미지 위도, 경도 *로 구분
	let planExtra = '';
	for (let i = 0; i < dates.length; i++) {
		// plan에 날짜 담기
		plan += dates[i] + '>';
		planExtra += dates[i] + '>';
		// plan에 날짜의 플랜정보 담음
		let plans = planContainer[i].querySelectorAll('.num');
		// 이미지와 타이틀 담을 배열
		let imgs = planContainer[i].querySelectorAll('.content__img');
		let titles = planContainer[i].querySelectorAll('.content__title');
		for (let j = 0; j < plans.length; j++) {
			plan += plans[j].value + '@';
			//  planExtra 변수에 담아서 DB에 저장
			let lat = document.querySelector('li.tour-item.' + plans[j].value + ' .lat').value;
			let lng = document.querySelector('li.tour-item.' + plans[j].value + ' .lng').value;
			planExtra += imgs[j].src + '*' + titles[j].innerText + '*' + lat + '*' + lng + '@';
		}
		plan = plan.substring(0, plan.length - 1); // 마지막에 @는 제거
		planExtra = planExtra.substring(0, planExtra.length - 1); // 마지막에 @는 제거
		plan += '+';
		planExtra += '+';
	}
	plan = plan.substring(0, plan.length - 1); // 마지막에 +는 제거
	planExtra = planExtra.substring(0, planExtra.length - 1); // 마지막에 +는 제거
	// DB에 저장
	const vo = {
		num: grp_num,
		tour_plan: plan,
		tour_date_start: dates[0],
		tour_date_end: dates[dates.length - 1],
		tour_plan_extra: planExtra
	};
	$.ajax({
		url: path + '/planREST/planModify',
		type: 'post',
		data: JSON.stringify(vo),
		contentType: "application/json",
		success: function(data) {
			alert('플랜을 저장했습니다.');
		},
		error: function() {
			alert('플랜 저장 오류!!');
		}
	}); //ajax
}; //savePlan


// 저장 경로 확인 페이지 이동 
function movePlanCheck() {
	if (confirm("저장 경로 확인 페이지로 이동하시겠습니까?")) {
		location.href = '/plan/planContent/' + grp_num;
	}
}; // movePlanCheck()


// 선택 초기화
const resetBtn = document.querySelector('.btn-container .btn--reset');
resetBtn.addEventListener('click', resetSelectedTour);

// 선택한 관광지 초기화 (일정은 그대로 둠)
function resetSelectedTour() {
	// 호텔 목록 가져오기 전이면 기다려 달라고 알림창 띄우기
	if (getHotelList == 0) {
		alert('숙소 목록을 가져오기까지 잠시만 기다려주세요.');
		return;
	}

	// 지도에서 전체 마커 초기화
	delAllMarker();

	// 마커 초기화하면서 마커 담을 배열 칸도 사라짐.
	// -> 마커 정보 담을 배열 칸 생성
	const length = document.querySelectorAll('.date-plan-container li.plan').length;
	for (let i = 0; i < length; i++) {
		positions.push({}); // 마커 객체 일정 만큼 추가
		orderedTour.push([]); // 마커 순서 담은 배열 일정만큼 추가
	}

	// 선택한 관광지 제거
	const allSelectedTour = document.querySelectorAll('.date-plan-container .plan__contents .plan-item');
	for (let i = 0; i < allSelectedTour.length; i++) {
		allSelectedTour[i].remove();
	}

	// 숨겨진 관광지 목록에 다시 출력
	const allHiddenTour = document.querySelectorAll('.tour .tour__contents .tour-item.hidden');
	for (let i = 0; i < allHiddenTour.length; i++) {
		allHiddenTour[i].classList.remove('hidden');
	}

	// 경로 제거
	if (new_polyLine.length > 0) {
		delPath();
	}
	// 직선 경로 제거
	if (checkShowLinePath == 1) {
		delLinePath();
	}
}; //resetSelectedTour()


// 직선 경로 확인
const linePathBtn = document.querySelector('.btn-container .btn--line-path');

linePathBtn.addEventListener('click', checkLinePath);

// 현재 선택된 날짜 직선 경로 폴리라인 계산해서 배열에 저장 & 출력
function calcLinePath() {
	const seq = calcDateSeq();

	// 현재 선택된 날짜 cNum 가져오기
	const selectedDateContainer = document.querySelector('.date-plan-container').children[seq];
	const cNumsElement = selectedDateContainer.querySelectorAll('.plan-item .num');
	// 선택된 관광지 2개 미만이면 폴리라인 계산할 필요 x
	if (cNumsElement.length < 2) {
		return;
	}

	const cNums = [];
	cNumsElement.forEach(cNum => {
		cNums.push(cNum.value);
	});

	let preLat = '';
	let preLng = '';
	let tempLat = '';
	let tempLng = '';
	// 경로 2개 이상 있을때만 폴리라인 생성
	if (cNums.length >= 2) {
		//    preLat = document.querySelector('.tour-item.' + cNums[0] + ' .lat').value;
		//    preLng = document.querySelector('.tour-item.' + cNums[0] + ' .lng').value;
		preLng = positions[seq][cNums[0]].getPosition()._lng;
		preLat = positions[seq][cNums[0]].getPosition()._lat;
	}
	for (let i = 1; i < cNums.length; i++) {
		//    tempLat = document.querySelector('.tour-item.' + cNums[i] + ' .lat').value;
		//    tempLng = document.querySelector('.tour-item.' + cNums[i] + ' .lng').value;
		tempLng = positions[seq][cNums[i]].getPosition()._lng;
		tempLat = positions[seq][cNums[i]].getPosition()._lat;


		const polyline = new Tmapv2.Polyline({
			path: [
				new Tmapv2.LatLng(preLat, preLng), // 선의 꼭짓점 좌표
				new Tmapv2.LatLng(tempLat, tempLng) // 선의 꼭짓점 좌표
			],
			strokeColor: "#0000ff", // 라인 색상 - 파란색
			strokeWeight: 4, // 라인 두께
			map: map // 지도 객체
		});
		straightPolyLine[seq].push(polyline);

		preLat = tempLat;
		preLng = tempLng;
	}

}; // calcLinePath()
// 직선 경로 폴리라인 출력

function showLinePath() {
	calcLinePath();
}; //showLinePath()

// 직선 경로 폴리라인 화면에서 제거
function delLinePath() {
	const seq = calcDateSeq();

	for (let i = 0; i < straightPolyLine[seq].length; i++) {
		console.log(straightPolyLine[seq].length);
		console.log(straightPolyLine[seq]);
		straightPolyLine[seq][i].setMap(null);
	}
	straightPolyLine[seq] = [];
}

// 현재 checkShowLinePath 값에 따라 직선 폴리라인 출력 / 제거 실행
function checkLinePath() {
	// 호텔 목록 가져오기 전이면 기다려 달라고 알림창 띄우기
	//  if (getHotelList == 0) {
	//    alert('숙소 목록을 가져오기까지 잠시만 기다려주세요.');
	//    return;
	//  }

	// checkShowLinePath 0 이면 출력, 1이면 제거
	if (checkShowLinePath == 0) {
		showLinePath();
		linePathBtn.value = '직선 경로 제거';
		linePathBtn.style.backgroundColor = '#96bbe7';
		checkShowLinePath = 1;
	} else {
		delLinePath();
		linePathBtn.value = '직선 경로 표시';
		linePathBtn.style.backgroundColor = '#2679df';
		checkShowLinePath = 0;
	}
}; //calcLinePath()


// 경로 확인 & 삭제
const checkPathBtn = document.querySelector('.btn-container .btn--check-path');
const delPathBtn = document.querySelector('.btn-container .btn--del-path');

checkPathBtn.addEventListener('click', showPath);
delPathBtn.addEventListener('click', delPath);

var new_polyLine = [];

// 지도에 폴리라인 출력
function drawData(data) {
	// 지도위에 선은 다 지우기
	routeData = data;
	var resultStr = "";
	var distance = 0;
	var idx = 1;
	var newData = [];
	var equalData = [];
	var pointId1 = "-1234567";
	var ar_line = [];
	var pointArray = [];

	for (var i = 0; i < data.features.length; i++) {
		var feature = data.features[i];
		//배열에 경로 좌표 저장
		if (feature.geometry.type == "LineString") {
			ar_line = [];
			for (var j = 0; j < feature.geometry.coordinates.length; j++) {
				var startPt = new Tmapv2.LatLng(feature.geometry.coordinates[j][1], feature.geometry.coordinates[j][0]);
				ar_line.push(startPt);
				pointArray.push(feature.geometry.coordinates[j]);
			}
			var polyline = new Tmapv2.Polyline({
				path: ar_line,
				strokeColor: "#ff0000",
				strokeWeight: 6,
				map: map
			});
			new_polyLine.push(polyline);
		}
		var pointId2 = feature.properties.viaPointId;
		if (pointId1 != pointId2) {
			equalData = [];
			equalData.push(feature);
			newData.push(equalData);
			pointId1 = pointId2;
		} else {
			equalData.push(feature);
		}
	}
	// geoData = newData;
	// var markerCnt = 1;
	// for (var i = 0; i < newData.length; i++) {
	//   var mData = newData[i];
	//   var type = mData[0].geometry.type;
	//   var pointType = mData[0].properties.pointType;
	//   var pointTypeCheck = false; // 경유지 일때만 true
	//   if (mData[0].properties.pointType == "S") {
	//     var img = 'http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png';
	//     var lon = mData[0].geometry.coordinates[0];
	//     var lat = mData[0].geometry.coordinates[1];
	//   } else if (mData[0].properties.pointType == "E") {
	//     var img = 'http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png';
	//     var lon = mData[0].geometry.coordinates[0];
	//     var lat = mData[0].geometry.coordinates[1];
	//   } else {
	//     markerCnt = i;
	//     var lon = mData[0].geometry.coordinates[0];
	//     var lat = mData[0].geometry.coordinates[1];
	//   }
	// }
}; // drawData()

// 선택한 관광지 자동차 경로 확인
function showPath() {
	const seq = calcDateSeq();
	const length = orderedTour[seq].length;

	// 경로 표시중일 때 다시 클릭하면 경로 제거
	// if (new_polyLine.length != 0) {
	//   delPolyLine();
	//  return;
	//}
	// 경로 2개 이상 선택해야 경로 확인 가능
	if (length < 2) {
		alert('관광지를 2개 이상 선택 후 경로를 확인해 주세요.');
		return;
	}

	// 경유지 있을 경우
	let passList = '';
	if (length >= 3) {
		// 선택한 관광지 3~7개 일 경우 -> 경로 7개 까지만 확인 가능
		if (length <= 7) {
			for (let i = 1; i < length - 1; i++) {
				const cNum = orderedTour[seq][i];
				const lng = positions[seq][cNum].getPosition()._lng;
				const lat = positions[seq][cNum].getPosition()._lat;
				passList += lng + "," + lat + "_";
			}
			// 선택한 관광지 7개 초과일 경우
		} else {
			for (let i = length - 6; i < length - 1; i++) {
				const cNum = orderedTour[seq][i];
				const lng = positions[seq][cNum].getPosition()._lng;
				const lat = positions[seq][cNum].getPosition()._lat;
				passList += lng + "," + lat + "_";
			}
		}
		passList = passList.substring(0, passList.length - 1);
	}

	// 4. 경로탐색 API 사용요청
	var startX;
	var startY;
	var endX;
	var endY;
	// 선택한 관광지 7개 이하일 경우
	if (orderedTour[seq].length <= 7) {
		startX = positions[seq][orderedTour[seq][0]].getPosition()._lng;
		startY = positions[seq][orderedTour[seq][0]].getPosition()._lat;
		endX = positions[seq][orderedTour[seq][length - 1]].getPosition()._lng;
		endY = positions[seq][orderedTour[seq][length - 1]].getPosition()._lat;
		// 선택한 관광지 7개 초과일 경우
	} else {
		startX = positions[seq][orderedTour[seq][length - 7]].getPosition()._lng;
		startY = positions[seq][orderedTour[seq][length - 7]].getPosition()._lat;
		endX = positions[seq][orderedTour[seq][length - 1]].getPosition()._lng;
		endY = positions[seq][orderedTour[seq][length - 1]].getPosition()._lat;
	}
	var prtcl;
	var headers = {};
	headers["appKey"] = "l7xx4c685864b69a4b71966f8bda89ed2dd3";
	$.ajax({
		method: "POST",
		headers: headers,
		url: "https://apis.openapi.sk.com/tmap/routes?version=1&format=json",
		async: false,
		data: {
			startX: startX,
			startY: startY,
			endX: endX,
			endY: endY,
			passList: passList,
			reqCoordType: "WGS84GEO",
			resCoordType: "WGS84GEO",
			angle: "172",
			searchOption: "0",
			trafficInfo: "Y"
		},
		success: function(response) {
			prtcl = response;

			// 5. 경로탐색 결과 Line 그리기 
			var trafficColors = {
				extractStyles: true,
				/* 실제 교통정보가 표출되면 아래와 같은 Color로 Line이 생성됩니다. */
				trafficDefaultColor: "#636f63", //Default
				trafficType1Color: "#19b95f", //원할
				trafficType2Color: "#f15426", //지체
				trafficType3Color: "#ff970e" //정체		
			};
			var style_red = {
				fillColor: "#FF0000",
				fillOpacity: 0.2,
				strokeColor: "#FF0000",
				strokeWidth: 3,
				strokeDashstyle: "solid",
				pointRadius: 2,
				title: "this is a red line"
			};
			drawData(prtcl);
		},
		error: function(request, status, error) {
			console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		}
	});
}; // showBestPath


// 경로 제거 
function delPath() {
	let polyline;
	for (let i = 0; i < new_polyLine.length; i++) {
		polyline = new_polyLine[i];
		polyline.setMap(null);
	}
	new_polyLine = [];
}; //delPolyLine()


