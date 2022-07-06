const menu = document.querySelector('.show-grp-menu .show-grp');
const member = document.querySelector('.grp-member');

menu.addEventListener('click', hideMember);

// 그룹 멤버 숨기기 버튼
function hideMember(){
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
}

// 여행 일정 선택
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

  const year = startDateS.substring(0, 4);
  let month = Number(startDateS.substring(5, 7)); // 07 -> 7 로 받아옴 (숫자 앞에 0 제거)
  let date = Number(startDateS.substring(8, 10));
  const lastDate = new Date(year, month, 0).getDate();
  // 선택한 일정 만큼 일정칸 추가
  for (let i = startDate; i <= endDate; i++) {
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

}; // calcDate


// 여행 일정칸에서 날짜 선택시 해당 날짜 칸 활성화
function selectDate(event) {
  const dateActive = document.querySelectorAll('.date-active');
  dateActive.forEach(item => {
    item.classList.remove('date-active');
    item.nextElementSibling.classList.add('hidden');
  });

  event.target.classList.add('date-active');
  event.target.nextElementSibling.classList.remove('hidden');

}; //selectDate


/////////////////////////////////////////// 관광지 리스트 ////////////////////////////////////////
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
  const selectedDate = document.querySelector('.date-active');
  // 먼저 일정 선택
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
  const title = firstChild.nextElementSibling.innerText;
  const num = firstChild.nextElementSibling.nextElementSibling.value;

  event.target.style.display = 'none';

  const newTour = document.createElement('li');
  newTour.classList.add('plan-item');
  const newTourInner =
    '<div class="tour-wrapper">' +
    '<img src="' + img + '" alt="" class="content__img" />' +
    '<div class="content__title">' + title + '</div>' +
    '<button class="delBtn" onclick="delSelectedTour(event, 1)">x</button>' +
    '<input type="hidden" value="' + num + '" class="num">' +
    '</div>';
  newTour.innerHTML = newTourInner;

  dateTourContainer.append(newTour);
} // selectTour()


// 일정에서 관광지 삭제
function delSelectedTour(event, num) {
  const tours = document.querySelector('.tour-item.tour' + num);

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
initTmap();

function initTmap() {
  var map = new Tmapv2.Map("map_div", {
    center: new Tmapv2.LatLng(35.1379222, 129.05562775), // 지도 초기 좌표
    width: "1000px",
    height: "700px",
    zoom: 11
  });
}