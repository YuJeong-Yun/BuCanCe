const menu = document.querySelector('.show-grp-menu .show-grp');
const member = document.querySelector('.grp-member');

menu.addEventListener('click', hideMember);

// 그룹 멤버 숨기기 버튼
function hideMember() {
	member.classList.toggle("hidden");
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

let positions = []; // 일별로 마커 정보 담을 배열
// 1-7일 여행 일정 선택
function checkDate() {

	let startDateS = document.querySelector('.start-date').value;
	let endDateS = document.querySelector('.end-date').value;

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
	const datePlanContainer = document.querySelector('ul.date-plan-container');
	// 기존 일정 칸 제거
	while (datePlanContainer.firstChild) {
		datePlanContainer.removeChild(datePlanContainer.lastChild);
	}


	// 마커 배열 초기화
	positions = [];
	const year = startDateS.substring(0, 4);
	let month = Number(startDateS.substring(5, 7)); // 07 -> 7 로 받아옴 (숫자 앞에 0 제거)
	let date = Number(startDateS.substring(8, 10));
	const lastDate = new Date(year, month, 0).getDate();
	// 선택한 일정 만큼 일정칸 추가
	for (let i = startDate; i <= endDate; i++) {
		// 마커 배열도 일정 만큼 추가
		positions.push([]);

		const newDate = month + " / " + date;
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


// 선택한 날짜가 몇 번째인지 계산
function calcDateSeq(){
	const dateContainer = document.querySelectorAll('.date-plan-container .plan__date');
	let i=0;
	for (i; i < dateContainer.length; i++) {
		if(dateContainer[i].classList.contains('date-active')) {
			break;
		}
	}
	return i;
}


// 여행 일정칸에서 날짜 선택시 해당 날짜 칸 활성화 & 해당 날짜 일정 정보(마커) 지도에 표시
function selectDate(event) {
	// 선택한 날짜 칸 활성화
	const dateActive = document.querySelectorAll('.date-active');
	dateActive.forEach(item => {
		item.classList.remove('date-active');
		item.nextElementSibling.classList.add('hidden');
	});
	event.target.classList.add('date-active');
	event.target.nextElementSibling.classList.remove('hidden');

	const seq = calcDateSeq();
	// 지도에 해당 날짜의 마커 정보 표시
	printDateMarker(seq);
}; //selectDate


/////////////////////////////////////////// 관광지 리스트 ////////////////////////////////////////
let selectedTourArr = [];

// 카테고리 선택 (관광지/숙소/맛집)
function selectCategory(event) {
	const categoryActive = document.querySelectorAll('.tour-active');
	categoryActive.forEach(item => {
		item.classList.remove('tour-active');
		item.nextElementSibling.classList.add('hidden');
	});

	event.target.classList.add('tour-active');
	event.target.nextElementSibling.classList.remove('hidden');
} // selectCategory()



// 관광지 클릭하면 선택한 일정칸에 추가
function selectTour(event) {
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
	const children = event.target.childNodes;
	const firstChild = event.target.firstElementChild;
	const img = firstChild.src;
	const title = firstChild.nextElementSibling.innerText;
	const num = firstChild.nextElementSibling.nextElementSibling.value;
	const lng = firstChild.nextElementSibling.nextElementSibling.nextElementSibling.value;
	const lat = firstChild.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.value;
	// 선택한 관광지는 리스트에서 숨기기
	event.target.classList.add('hidden');

	const newTour = document.createElement('li');
	newTour.classList.add('plan-item');
	newTour.classList.add('draggable');
	newTour.draggable = 'true';
	let newTourInner = '<div class="tour-wrapper">';

	// 식당 숙소는 구별 아이콘 추가
	if (category == 'r') {
		newTourInner += '<div class="material-icons-outlined restaurant">restaurant</div>';
	} else if (category == 'a') {
		newTourInner += '<div class="material-icons-outlined hotel">bed</div>';
	}

	newTourInner +=
		'<img src="' + img + '" alt="" class="content__img" />' +
		'<div class="content__title">' + title + '</div>' +
		'<button class="delBtn" onclick="delSelectedTour(event, 1)">x</button>' +
		'<input type="hidden" value="' + num + '" class="num">' +
		'</div>';
	newTour.innerHTML = newTourInner;

	newTour.addEventListener("dragstart", addDragging);
	newTour.addEventListener("dragend", delDragging);

	dateTourContainer.append(newTour);


	// 지도에 마커 표시
	let markerIcon = path + '/resources/img/marker/markert.png';
	if (category == 'r') {
		markerIcon = path + '/resources/img/marker/markerr.png';
	} else if (category == 'a') {
		markerIcon = path + '/resources/img/marker/markera.png';
	}
	// 선택한 날짜가 몇 번째 날짜인지 계산
	const seq = calcDateSeq();
	addMarker(title, lng, lat, markerIcon, seq);

} // selectTour()

function addDragging(event) {
	event.target.classList.add("dragging");
}; // addDragging()
function delDragging(event) {
	event.target.classList.remove("dragging");
}; //delDragging()



// 일정에서 관광지 삭제
function delSelectedTour(event, num) {
	const tours = document.querySelector('.tour-item.' + num);

	tours.classList.remove('hidden');
	tours.style.display = 'flex';
	event.target.parentElement.parentElement.remove();
} // delSelectedTour()



// 일정에서 관광지 드래그해서 순서 변경
const draggables = document.querySelectorAll('.plan-item');
const containers = document.querySelectorAll('.plan__contents > ul');
// 드래그한 요소 투명도 0.5로 설정
draggables.forEach(draggable => {
	draggable.addEventListener("dragstart", () => {
		draggable.classList.add("dragging");
	});

	draggable.addEventListener("dragend", () => {
		draggable.classList.remove("dragging");
	});
});

// 드래그하는 요소가 다른 요소 사이에 들어가는 것 구현
function getDragAfterElement(container, x) {
	const draggableElements = [
		...container.querySelectorAll(".draggable:not(.dragging)"),
	];

	return draggableElements.reduce(
		(closest, child) => {
			const box = child.getBoundingClientRect();
			const offset = x - box.left - box.width / 2;
			// console.log(offset);
			if (offset < 0 && offset > closest.offset) {
				return { offset: offset, element: child };
			} else {
				return closest;
			}
		},
		{ offset: Number.NEGATIVE_INFINITY }
	).element;
}
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


//////////////////////////////////// 지도 //////////////////////////////////

var map = new Tmapv2.Map("map_div", {
	center: new Tmapv2.LatLng(35.1379222, 129.05562775), // 지도 초기 좌표
	width: "1000px",
	height: "700px",
	zoom: 11
});

// 관광지 클릭하면 마커 추가하는 함수
function addMarker(title, lng, lat, markerIcon, seq) {
	// 마커 지도에 표시
	const newMarker = new Tmapv2.Marker({
		title: title,
		position: new Tmapv2.LatLng(lat, lng), //Marker의 중심좌표 설정.
		icon: markerIcon,
		label: "<span style='background-color: #46414E;color:white'>"+title+"</span>", // 라벨 설정
		map: map //Marker가 표시될 Map 설정.
	});
	
	// positions에서 선택한 날짜(date-active)의 순서 배열에 마커 정보 추가
	positions[seq].push(newMarker);
	console.log(positions[seq]);
}; // addMarker()


// 날짜 선택하면 해당 날짜에 선택한 일정 지도에 마커로 표시하는 함수
function printDateMarker(seq){
	console.log("pp");
	if(markers!=null){
		markers.clearMarkers();
	}
	
	let label='';
	for (let i = 0; i < positions[seq].length; i++) {//for문을 통하여 배열 안에 있는 값을 마커 생성
		var lonlat = positions[seq][i].lonlat;
		var title = positions[seq][i].title;
		var icon = positions[seq][i].icon;
		label="<span style='background-color: #46414E;color:white'>"+title+"</span>";
		//Marker 객체 생성.
		marker = new Tmapv2.Marker({
			position: lonlat, //Marker의 중심좌표 설정.
			map: map, //Marker가 표시될 Map 설정.
			title: title, //Marker 타이틀.
			label: label, // Marker의 라벨
			icon: icon
		});
	}
}; // printDateMarker()


