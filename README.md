# :ocean: BuCanCe :ocean:
### :point_right: <a href="http://yyj1999.cafe24.com/main" target="_blank">부캉스 이동하기</a>
<br><br><hr>

I. 프로젝트 소개
-----
 ### :mag: 부산바캉스(부캉스)- 부산의 통합 관광 서비스 제공
 <details>
 <summary>비즈니스 모델 확인</summary>
 <br>
 
> #### 1. 관광지/맛집 : 플랜을 작성할 때 관광지를 찾을 수고를 덜기 위해 게시판을 만들었고, 방문자들의 리뷰를 공유할 수 있음
> #### 2. 숙소 : 크롤링해 온 내용으로 예약 가능한 숙소 정보 / 가격을 확인할 수 있음
> #### 3. 구독권 : 구독권 구매 회원에게 추가 플랜 작성하는 서비스 제공
>> #### => 수익 창출 기대
> #### 4. 플랜 작성 : 혼자가 아니라 그룹으로 초대해서 플랜을 작성하고 공유가능
>> #### => 경쟁력 확보 
</details>
<br>
 
#### 기간 : <i>2022.06.23 ~ 2022.07.27   (5 weeks) </i>
#### 팀원 및 업무분장 : 
> Team1
>> 주혜림 : DB 설계 / 관광지 게시판 / 회원 관리 / 관리자 페이지   
>> 성치훈 : DB 설계 / 로그인 / SNS로그인 / 회원 관리   

> Team2   
>> 하영득 : DB 설계 / 숙소 크롤링 / 숙소 결제   
>> 전상현 : DB 설계 / 숙소 크롤링 / 숙소 결제

> Team3
>> 하혜진 : DB 설계 / 행정구역 지도 / 맛집 게시판 / 관리자 페이지   
>> 이슬비 : DB 설계 / 구독권 / 정기결제    
>> 윤유정 : DB 설계 / 랜덤 프로필 / 그룹 초대 / 플랜 작성

<br><br>
<hr>

 II. 개발환경 및 문서
 -----
### :wrench: Development Environment
- `OS` : <img src="https://img.shields.io/badge/windows10-0078D6?style=for-the-badge&logo=windows&logoColor=white">
- `DB` : <img src="https://img.shields.io/badge/MySQL5.5.17-4479A1?style=for-the-badge&logo=MySQL&logoColor=white">
- `WAS` : <img src="https://img.shields.io/badge/Apache tomcat 8.5-F8DC75?style=for-the-badge&logo=Apache Tomcat&logoColor=black">
- `Tools` : <img src="https://img.shields.io/badge/STS-6DB33F?style=for-the-badge&logo=Spring&logoColor=white"> <img src="https://img.shields.io/badge/VS Code-007ACC?style=for-the-badge&logo=Visual Studio Code&logoColor=white">
- `FrameWork` : <img src="https://img.shields.io/badge/Spring FrameWork 4.3.8-6DB33F?style=for-the-badge&logo=Spring&logoColor=white">
- `Language` : <img src="https://img.shields.io/badge/JAVA8-007396?style=for-the-badge&logo=java&logoColor=white"> <img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=HTML5&logoColor=white"> <img src="https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=CSS3&logoColor=white"> <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=JavaScript&logoColor=white">
- `버전관리 & 협업툴` : <img src="https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=Git&logoColor=white"> <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=GitHub&logoColor=white"> <img src="https://img.shields.io/badge/Slack-4A154B?style=for-the-badge&logo=Slack&logoColor=white">

<br><br>

## :wrench: ERD
<img src="https://user-images.githubusercontent.com/97975367/184006127-baf77ec8-0900-4b31-8f71-3028040fb3a5.png" width="700" height="600"/>
<br><br>

## :wrench: Usecase Diagram
<img src="https://user-images.githubusercontent.com/97975367/184006446-1fb02b52-10b4-4b93-b14b-51deb92798bb.png" width="500" height="500"/><img src="https://user-images.githubusercontent.com/97975367/184006503-50c46c07-8c3f-4d09-8abc-31d1bbc22573.png" width="400" height="300"/>

<br><br>
<hr>


III. 개발 및 시연 영상
-----
<details>
 <summary>0. 메인화면</summary>
 <br>
 
 [main](https://user-images.githubusercontent.com/97975367/184119317-f2e63857-b745-451c-bae6-df59ba7b98a0.webm)
 </details>

##  
<details>
<summary> 1. 회원 / 게시판</summary>

### 1) 회원가입
- 유효성 검사 통과 후 회원가입 가능
- 주소 검색 Daum API 이용

    <img src="https://user-images.githubusercontent.com/97975367/184116785-3c9d600d-19d4-49f6-9da5-a574b55f5eaf.png" width="350" height="400" />
<br>

### 2) 로그인
- 일반 로그인 or 카카오 로그인 가능

    <img src="https://user-images.githubusercontent.com/97975367/184117021-3cf42046-64c1-470d-b74f-e3943f2282a1.png" width="300" height="200" />
<br>

### 3) 마이페이지
- 찜목록(관광지 / 맛집) 확인 가능

    <img src="https://user-images.githubusercontent.com/97975367/184117354-599f14c4-f5b3-4fd4-8a8f-5dda28c50572.png" width="600" height="450" />
<br>

### 4) 관광지 게시판
- 조회수, 댓글수, 좋아요 수 확인 가능
- 공공데이터Api 사용하여 부산 현재 날씨 출력
 
 [tour_board.webm](https://user-images.githubusercontent.com/97975367/184169946-b9afac11-9ba3-4e53-95ea-86fb086bd695.webm)

 
<br>
 
 ### 5) 관광지 상세정보
 - 댓글 작성 가능
 - 네이버 검색 api로 리뷰 노출
 - 카카오맵 api로 길찾기 기능 제공
 
[tour_detail.webm](https://user-images.githubusercontent.com/97975367/184127632-8bb86f68-22bc-42b5-84b4-26a0c63b8077.webm)

 <br>
</details>

## 
<details>
<summary>2. 숙박</summary>

### 1) 숙박 목록
- 숙박정보 크롤링으로 인한 페이지 지연 현상 => 로딩bar & 무한스크롤을 활용하여 자연스럽게 구현
 
 [accomodation_list](https://user-images.githubusercontent.com/97975367/184119684-3e99573e-8523-4cfc-844b-aa5825bc2df5.webm)
 
<br>
 
 ### 2) 숙박 상세정보
 - 크롤링해온 숙소 상세정보와 카카오 지도 API 활용하여 숙소의 위치정보+로드뷰 노출

[accomodation_detail](https://user-images.githubusercontent.com/97975367/184120478-ef870a02-b74f-4e59-804e-33e3638a7a1a.webm)
 
<br>
 
 ### 3) 숙박 결제 & 환불 기능
 - 결제수단과 약관동의를 선택 후 아임포트 API 이용해 결제 가능
 <img src="https://user-images.githubusercontent.com/97975367/184124990-7694a4af-916b-4c24-b168-80bbddcae1e6.png" width="500" height="350" />
 
 <br><br>
 
 - 예약 내역에서 숙소 환불 가능
 <img src="https://user-images.githubusercontent.com/97975367/184125187-c1428091-3e3e-44b6-b3a7-b89da9d971cc.png" width="200" height="400" />
 
</details>

##
<details>
 <summary>3. 행정구역별 지도  </summary>
 <br>
 
 - 행정구역 클릭시 해당 행정구역의 관광지 출력
 
[polygon.webm](https://user-images.githubusercontent.com/97975367/184126305-e1158cd0-75ef-4da2-88cc-a601aa08a31f.webm)
 
 <br> 
 
</details>

##
<details>
 <summary>4. 구독권  </summary>
 <br>
 
 ### 1) 유료회원 구독권
 - Payple을 이용하여 구독권 '1달 구독권' or '정기 구독권' 결제 구현
 
    <img src="https://user-images.githubusercontent.com/97975367/184128319-5087077c-cc49-4fae-a82f-b32ce81bb746.png" width="400" height="300" />
 
 <br>
 
 ### 2) 스케줄러
 - 수동 스케줄러 구현 => 관리자가 기간 만료 회원 삭제 & 정기결제 회원 재결제 실행
 
  <img src="https://user-images.githubusercontent.com/97975367/184180441-434071f5-01b4-40a6-aca0-b4f35ce60738.png" width="800" height="200" />

</details>


##
<details>
 <summary>5. 플랜 작성  </summary>
 <br>
 
 ### 1) 회원 초대
 - 플랜 초대 수락 / 거절
 
 [plan_invite.webm](https://user-images.githubusercontent.com/97975367/184174077-d59b4569-4c1c-4041-b053-ad915835d914.webm)

 <br>
 
 - 방장은 모달창을 통해 플랜에 회원 초대 / 초대 취소 가능
 
 [plan_invite2.webm](https://user-images.githubusercontent.com/97975367/184174606-e37767ff-10bb-40ac-8471-ca9860572327.webm)

<br>

 ### 2) 플랜 작성
 - 관광지 선택 / 관광지 검색
 
 [plan_write.webm](https://user-images.githubusercontent.com/97975367/184175854-46723370-0f12-4f28-bd65-f5afab63f1da.webm)

 <br>
 
 - 직선 경로 확인
 
 [plan_write2.webm](https://user-images.githubusercontent.com/97975367/184177945-088d2e17-bad8-4ec9-b025-df1bc755eaef.webm)

 <br>
 
 - 최소 시간 자동차 경로 확인 (최대 7개까지 확인 가능 & 누적 출력)
 
 [plan_write3.webm](https://user-images.githubusercontent.com/97975367/184178472-06b16b74-63f2-44b6-81a6-fee3b5de7424.webm)

 <br>
 
 ### 3) 저장된 플랜 확인
 - 플랜 작성 회원 확인 가능
 - 날짜별 순서대로 관광지 출력
 
 ![image](https://user-images.githubusercontent.com/97975367/184178692-60dd7e8a-8c50-433a-acbd-f283da94d8c2.png)

 <br>
</details>

##
<details>
 <summary>6. 관리자  </summary>
 <br>
 
 ### 1) 관리자 Dashboard
 - 회원가입수 / 월별 매출 등 확인 가능
 ![image](https://user-images.githubusercontent.com/97975367/184179346-ae24ed56-cc01-4c04-b25f-8bec00b6722a.png)
 
 <br>
 
 - 기간별 매출 조회 가능
 ![image](https://user-images.githubusercontent.com/97975367/184179585-01da3d3d-6145-4741-a285-17f34958e081.png)
 
 <br>
 
 ### 2) 회원 관리
 - 가입 회원 목록 확인 / 탈퇴 가능
![image](https://user-images.githubusercontent.com/97975367/184179946-cbdce296-576f-4ecf-ad03-e12152879d9d.png)

 <br>
 
 ### 3) 관광지 게시글 작성
 ![image](https://user-images.githubusercontent.com/97975367/184180153-243f9a51-00ed-4a0e-b21c-7cf2834183a7.png)

 <br>
 
 ### 4) 수동 스케줄러 실행
 ![image](https://user-images.githubusercontent.com/97975367/184180194-75817a6c-b4ba-43b9-a916-07286aaf06f6.png)

 <br>

</details>
<br><br><hr>

IV. 보완점
------
- 다양한 SNS로그인 추가 구현
- 마이페이지 미구현 메뉴바 추가 구현 필요
- 관리자 차트 페이지에서 데이터 가져오는데 걸리는 시간 단축 필요
- 숙소 상세정보 크롤링 시간 단축 (AJAX 활용 등)필요
- 수동 말고 자동 스케줄러 구현 필요
- 구독권 결제 도중 취소 시, 완료되지 않음에도 DB에는 유료 회원으로 저장되는 오류 수정 필요
- 플랜 작성 시 찜한 관광지 확인할 수 있는 카테고리 추가
- 플랜 수정 시 선택한 관광지 불러올 때 삭제된 관광지 처리 필요
- 현재 모든 예외를 throw Exception으로 던지고 에러 페이지로 이동하는게 전부임 => 예외를 로그로 남기고 상황에 따라 transaction roll back 하는 등의 처리가 필요


<br><br><hr>

V. Trouble Shooting
-----
<details>
 <summary><b> 플랜 작성 페이지에서 숙소 목록 크롤링에 시간이 오래 걸림 </b></summary>
 
 <br>
 
 <b>`처음 방법`</b>
 
 처음에 크롤링 해온 내용을 session에 담아서 사용했음   
 <br>
=> But 처음에 크롤링 할 때는 여전히 시간이 오래 걸리고, 사용자가 늘어날수록 서버의 부담이 증가하는 문제가 존재
 
 <br>
 
 <b>`해결 방법`</b>
 
 플랜 작성 페이지로 이동 시 AJAX를 이용해 비동기식으로 크롤링해온 숙소 정보를 추가해줌
 
<img src="https://user-images.githubusercontent.com/97975367/184189247-26ed02f1-ca1d-49b3-bbe0-e027d5d67b31.png" width="250" hegith="600" /> => <img src="https://user-images.githubusercontent.com/97975367/184189254-f29dbf10-2743-4dad-8535-d19f49f5b3c2.png" width="250" hegith="600" />

 <br>
 
 ## 
 이 때 숙소 로딩이 완료되기 전까지 숙소 정보가 필요한 동작(관광지 삭제, 드래그로 순서 변경, 관광지 추가 등)을 하면 오류가 뜨는 문제 발생
 
 <br>
 
 <b>`해결 방법`</b>
 
 전역변수로 getHotelList = 0 변수를 두고, 숙소 로딩이 완료되면 1 값을 넣어줬음.   
 getHotelList 값이 0일 때는 숙소 정보가 필요한 동작은 실행되지 않도록 해줌
 
<img src="https://user-images.githubusercontent.com/97975367/184189943-01bf1f86-a746-45a1-ac88-cd36137ec021.png" width="500" height="150" />

 <br>
</details>

## 
<details>
 <summary><b> 플랜 작성 - 일정별로, 순서대로 마커 지도에 출력 </b></summary>
 
 <br>
 
 선택한 일정의 마커를 순서대로 지도에 띄우고 싶음. 즉 마커 하나에 관광지의 num값과 순서값이 필요한 상황
 
 <br>
 
 <b>`해결 방법`</b>
 
 우선 일정별로 마커에 해당하는 num값을 저장하기 위해 Positions 전역 배열 변수를 두고, 사용자가 일정을 선택하면 해당 일정만큼 빈 Map을 배열에 추가.   
 관광지를 클릭하면 key는 해당 관광지의 cNum(카테고리+num), value는 마커로 해서 키-값 쌍을 Map에 추가함  
 <br>
 _=> 사용자가 4일의 일정을 선택했을 경우, positions안에 4개의 Map이 들어있고, 해당하는 일정의 Map에 cNum-마커 쌍으로 값이 들어있음_

 <img src="https://user-images.githubusercontent.com/97975367/184190817-88677c5a-6690-4e6f-9e7a-257d0be6cd4a.png" width="870" height="140" />
 
 <br><br>
 
 그리고 일정별로 마커의 순서를 담을 전역 배열 변수 orderedTour를 두고, positions과 마찬가지로 일정을 선택하면 일정 수 만큼 빈 배열을 orderedTour 배열에 추가.   
 관광지를 클릭하면 cNum(카테고리+num)이 배열에 추가되도록 했고, 드래그/관광지 삭제 함수 실행 시 활성화된 날짜칸의 배열에서 관광지 순서를 다시 계산하도록 했다.   
 <br>
 _=> 사용자가 4일의 일정을 선택했을 경우 orderedTour 안에 4개의 배열이 있고, 해당하는 일정의 배열안에 cNum값이 순서대로 들어있음._
 
 <img src="https://user-images.githubusercontent.com/97975367/184191933-11434c8d-1d2d-405d-9ac0-7b38fb84cbcf.png" width="1000" height="150" />
 
 ```
 즉 orderedTour에 일정별로 관광지의 순서를 저장하고, positions에서 일정별로 관광지에 해당하는 마커정보 저장
 ```
 <br>
</details>

## 
<details>
 <summary> <b>플랜 정보 저장시 시간이 오래 걸리는 문제 발생</b> </summary>
 <br>
 
 작성한 플랜 저장시 
 1. 관광지/식당은 DB에 들어있는 정보이므로 cNum(카테고리+num)만을 구분자를 두고 연결해서 tour_plan 컬럼에 저장했다.   
 2. 숙소는 크롤링해오는 정보인데 데이터가 많아서 크롤링에 시간이 오래 걸렸다.   
     따라서 플랜 확인 페이지로 이동 시 숙소 정보를 크롤링해오지 않으려고 필요한 정보 = cNum과 이미지, 위도, 경도, 타이틀을 모두 구분자를 두고 연결해서 tour_plan_extra 컬럼에 추가로 저장했다.
 
 <br>
 
 그런데 플랜 확인 / 플랜 수정 페이지에서 저장된 플랜을 가져올 때 관광지 수가 많을 수록 로딩 시간이 증가하는 문제가 있었다.     
 확인 결과 관광지/식당 정보를 가져오는데 많은 시간이 소요되고 있었다.   
 <br>
 
 <b>_=> 숙소는 tour_plan_extra에 저장된 정보를 한 번만 select해 왔으나, 관광지/식당은 tour_plan 컬럼에 저장된 각각의 num에 해당하는 관광지 정보를 반복해서 select해와서 시간이 오래 걸렸던게 문제였다._  </b>
  
 <br>
 
 <b>`해결 방법`</b>
 
 관광지와 식당도 숙소와 마찬가지로 cNum과 이미지, 위도, 경도 타이틀을 모두 연결해서 컬럼에 저장했다.   
 <br>
 
 ![image](https://user-images.githubusercontent.com/97975367/184194287-0ad97f50-7401-46ca-a421-c8d94d1e34f8.png)

 <br>
</details>

## 
<details>
 <summary><b> 자동차 경로 확인 기능 횟수 제한 </b></summary>
 
 <br>
 
 Tamp api를 이용해 다중 경로 확인 기능을 추가하려고 했다.   
 API에서 다중 경로 10 기능을 이용하면 10개까지의 경로를 확인할 수 있지만 무료 이용일 경우 하루 100회로 실행 횟수가 제한되었다.   

 그래서 자동차 경로 확인에 경유지를 넣는 방법을 이용해 1000회까지 실행 가능하게 했는데,   
 이렇게 하면 최대 7까지 경로만 확인 가능하고, 선택 관광지가 7개 초과면 오류가 뜨는 문제가 발생했다.
 
 <br>

 <b>`해결 방법`</b>
 
 우선 시작점, 도착점 외 경유지가 있을 경우(length >= 3),    
 선택한 관광지 수에 따라 7개 이하이면 앞에서부터, 7개 초과이면 뒤에서부터 7개의 위도 경도를 하나로 연결했다.   
 
 ```javascript
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
 ```
                                      
 <br>
 
 그리고 경로탐색 API 사용요청을 보낼 때 선택한 관광지의 개수에 따라서   
 7개 이하이면 앞에서부터, 7개 초과이면 뒤에서부터 계산해서 시작점과 도착점의 위도 경도를 보내도록 했다.   
                                      
 ```javascript
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
 ```

 <br>

 _즉 선택한 관광지가 7개 이하이면 그대로 선택 관광지 정보를 보내고, 7개 초과이면 뒤에 선택한 7개의 관광지 정보를 보내도록 했다._
 
 <br>
</details>
