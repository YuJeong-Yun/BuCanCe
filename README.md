# :ocean: BuCanCe :ocean:
### :point_right: <a href="http://itwillbs5.cafe24.com/main" target="_blank">부캉스 이동하기</a>
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
>> 윤유정[팀장] : DB 설계 / 랜덤 프로필 / 그룹 초대 / 플랜 작성

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

    <img src="https://user-images.githubusercontent.com/97975367/184117581-a5207af6-519d-4a3e-9200-c7a8cb87e7a7.png" width="600" height="450" />
<br>

</details>
<br>

<details>
<summary>2. 숙박</summary>

</details>
