/**
 * 
 */
let slides = document.querySelector('.slides');  //div영역을 가져옴
let slideImg = document.querySelectorAll('.slides li img'); //사진들을 불러옴
currentIdx = 0; //현재 인덱스값
//slideCount = 25; //현재목록갯수
slideCount = Math.floor(slideImg.length/4); //현재목록갯수
prev = document.querySelector('.prev'); //이전 버튼
next = document.querySelector('.next'); //다음 버튼
slideWidth = 600; //슬라이드이미지 넓이
slideMargin = 0; //슬라이드 끼리의 마진값


makeClone(); // 처음이미지와 마지막 이미지 복사 함수
initfunction(); //슬라이드 넓이와 위치값 초기화 함수



function makeClone() {
  let cloneSlide_first = slideImg[0].cloneNode(true);  //첫번째사진 복사
  let cloneSlide_last = slides.lastElementChild.cloneNode(true); //마지막 사진 복사
  slides.append(cloneSlide_first);  //첫번째사진 나타냄
  slides.insertBefore(cloneSlide_last, slides.firstElementChild); 
  //기존의 자식노드앞에 새 자식노드삽입
}



function initfunction() {
  slides.style.width = (slideWidth + slideMargin) * (slideCount + 2) + 'px';
  slides.style.left = -(slideWidth + slideMargin) + 'px';
}


next.addEventListener('click', function () {
  //다음 버튼 눌렀을때
  if (currentIdx <= slideCount - 1) {
    //슬라이드이동
    slides.style.left = -(currentIdx + 1) * (slideWidth) + 'px';
//    slides.style.transition = `${0.5}s ease-out`; //이동 속도
  }
  if (currentIdx === slideCount - 1) {
    //마지막 슬라이드 일때
    setTimeout(function () {
      //0.5초동안 복사한 첫번째 이미지에서, 진짜 첫번째 위치로 이동
      slides.style.left = -(slideWidth + slideMargin) + 'px';
//      slides.style.transition = `${0}s ease-out`;
    }, 300);
    currentIdx = -1;
  }
  currentIdx += 1;
});


prev.addEventListener('click', function () {
  //이전 버튼 눌렀을때
  console.log(currentIdx);
  console.log(slideCount);
//  alert(slideCount);
  if (currentIdx >= 0) {
    slides.style.left = -currentIdx * (slideWidth) + 'px';
    slides.style.transition = `${0.5}s ease-out`;
  }
  if (currentIdx === 0) {
    setTimeout(function () {
      slides.style.left = -slideCount * (slideWidth ) + 'px';
      slides.style.transition = `${0}s ease-out`;
    }, 300);
    currentIdx = slideCount;
  }
 

  currentIdx -= 1;
});
