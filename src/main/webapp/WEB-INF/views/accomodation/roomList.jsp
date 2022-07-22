<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/plan/planContent.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/acc/CroomList.css" type="text/css">
<script type="text/javascript"></script>

<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);





.rooms-section.spad {
  background-color: #42a1c6;
}

/* Franklin's Container */
.fish {
  width: 150px;
  height: 100px;
  animation: swim 3s infinite; 
}

/* Franklin */
.fish-body {
  position: relative;
  margin-top: 30px;
  margin-left: 40px;
  background-color: orange;
  border-radius: 50%;
  width: 150px; 
  height: 100px;
}

.eye {
  position: absolute;
  margin-left: 100px;
  margin-top: 20px;
  z-index: 1;
  background-color: white;
  border-radius: 50%;
  width: 20px;
  height: 20px;
}

.pupil {
  position: absolute;
  z-index: 2;
  margin-left: 5px;
  margin-top: 5px;
  background-color: black;
  border-radius: 50%;
  height: 10px;
  width: 10px;
}

.fin {
  margin-top: -100px; 
  background-color: orange;
  border-radius: 50%;
  transform: rotate(40deg);
  width: 80px;
  height: 50px;
}

.fin-bottom {
  margin-top: -10px;
  transform: rotate(-40deg);
}


.bubbles {
  position: absolute;
  bottom: 0;
  z-index: 5;
  margin-right: 50px;
  background-color: white;
  border-radius: 50%;
  opacity: .50;
  width: 40px;
  height: 40px;
  animation: up 4s infinite;
}

.bubble-2 {
  left: 350px;
  animation: up 2s infinite;
}

.bubble-3 {
  left: 750px;
  opacity: .30;
  animation: up 5s infinite;
}

.bubble-4 {
  left: 1150px;
  animation: up 6s infinite;
}

.bubble-5 {
  left: 50px;
  animation: up 5s infinite;
}

.bubble-6 {
  left: 300px;
  opacity: .30;
  animation: up 3s infinite;
}

.bubble-7 {
  left: 670px;
  animation: up 4s infinite;
}

.bubble-8 {
  left: 1050px;
  opacity: .30;
  animation: up 3s infinite;
}

/* Swim Animation */
@keyframes swim {
  0% {
    transform: translateY(-50px) translateX(0) rotate(30deg);
  }
  25% { 
    transform: translateY(50px) translateX(250px) rotate(20deg);
  }
  50% {
    transform: translateY(100px) translateX(500px);
  }
  75% {
    transform: translateY(50px) translateX(850px) rotate(-20deg);
  }
  100% {
    transform: translateY(-170px) translateX(1200px) rotate(-40deg);
  }
}

/* Bubbles Animation */
@keyframes up {
  100% {
    transform: translateY(-800px);
  }
}



</style>
</head>
<body>
	<!-- 헤더부분 -->
	<jsp:include page="../include/header.jsp" />
	<!-- 헤더부분 -->
	
	<!-- 무한스크롤포함 js동작들 -->
	<jsp:include page="${pageContext.request.contextPath}/resources/js/acc/JroomList.jsp"/>
	<!-- 무한스크롤포함 js동작들 -->
	
	
	<!-- Breadcrumb Section Begin --> 
	<section>
<%-- 	style="background-image: url('${pageContext.request.contextPath}/resources/img/beach.jpg');  --%>
<!-- 	background-attachment: fixed;	background-repeat: no-repeat; background-size:cover;" -->
<!-- 	> -->
	<div class="breadcrumb-section" >
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-text" >
						<h2 style="font-family: 'Jeju Hallasan' ">숙소 선택</h2>
						<div class="bt-option">
							<a href="${pageContext.request.contextPath}/index">Home</a> 
							<span>숙소 선택</span> 
						</div></div></div></div>
			<br><br><br>

			<!-- 숙소목록선택,검색기능을 하는 코드 시작 -->
			<form action="/accomodation/roomList" method="post" id="idForm" name="idForm">
				<select name="area" onchange="selectArea()" id="area" style="background: blue; line-height: 1.5;" >
					<optgroup label="지역">
						<option value="favorite"
						<c:if test="${select_area=='favorite'}">selected</c:if>
						>지역을 선택하세요.</option>
						<option value="favorite"
						<c:if test="${select_area=='favorite'}">selected</c:if>
						>인기순</option>
						<option 
						<c:if test="${select_area=='해운대/재송'}">selected</c:if>
						value="해운대/재송" >해운대/재송
						</option>
						<option value="송정/기장/정관"
						<c:if test="${select_area=='송정/기장/정관'}">selected</c:if>
						>송정/기장/정관</option>
						<option value="서면/초읍/양정"
						<c:if test="${select_area=='서면/초읍/양정'}">selected</c:if>
						>서면/초읍/양정</option>
						<option value="남포동/부산역/송도/영도/범일동"
						<c:if test="${select_area=='남포동/부산역/송도/영도/범일동'}">selected</c:if>
						>남포동/부산역/송도/영도/범일동</option>
						<option value="광안리/수영/민락"
						<c:if test="${select_area=='광안리/수영/민락'}">selected</c:if>
						>광안리/수영/민락</option>
						<option value="경성대/대연/용호/문현"
						<c:if test="${select_area=='경성대/대연/용호/문현'}">selected</c:if>
						>경성대/대연/용호/문현</option>
						<option value="동래/온천장/부산대/구서/사직"
						<c:if test="${select_area=='동래/온천장/부산대/구서/사직'}">selected</c:if>
						>동래/온천장/부산대/구서/사직</option>
						<option value="연산/토곡"
						<c:if test="${select_area=='연산/토곡'}">selected</c:if>
						>연산/토곡</option>
						<option value="사상/"
						<c:if test="${select_area=='사상/'}">selected</c:if>
						>사상</option>
						<option value="강서/하단/사하/명지/신호"
						<c:if test="${select_area=='강서/하단/사하/명지/신호'}">selected</c:if>
						>강서/하단/사하/명지/신호</option>
						<option value="덕천/만덕/구포/화명/북구"
						<c:if test="${select_area=='덕천/만덕/구포/화명/북구'}">selected</c:if>
						>덕천/만덕/구포/화명/북구</option>
					</optgroup>
				</select> 
	

				<input type="text" name="place_name" id="place_name" value="${rs.getPlace_name()}" required spellcheck="false">
				

				<input type="submit" value="검색" class="btn btn-primary" style="height: 40px;">

				</form>
				<!-- 숙소목록선택,검색기능을 하는 코드 끝 -->

		</div>
	</div>
	<!-- Breadcrumb Section End -->
<br><br>
  <style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>
</head>
<body>
<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
            <c:set var="a" />
			
                <form onsubmit="searchPlaces(); return false;">
                    키워드 : <input type="text" value="${roomList.get(a).room_title}" id="keyword" size="15"> 
                   <button type="submit">검색하기</button> 
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8ade9d233a7ea1b5e6f67c2a543fb0b3&libraries=services"></script>
<script>
// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(35.1605598,129.0560362), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
</script>
  

	<!-- Rooms Section Begin --> <!-- 방정보 처음 6개 -->
	<section class="rooms-section spad" >
	<div class="fish">
  <div class="fish-body">
    <div class="eye">
      <div class="pupil"></div>
    </div>
  </div>
  <div class="fin"></div>
  <div class="fin fin-bottom"></div>
</div>
		<div class="container">
			<div class="row">
				<c:set var="a" />
				<c:forEach items="${roomList}" begin="0" end="5">
					<div class="col-lg-4 col-md-6" style="height:600px;">
					<c:if test="${roomList.get(a).room_rank!=''}">
			<a href="/accomodation/roomDetail?bno=${roomList.get(a).room_link}">
			</c:if>
						<div class="room-item" style="border-radius: 2em; ">
							<div id="wrap" class="wrap">
							<c:if test="${roomList.get(a).room_rank!=''}">
							
								<img src="${roomList.get(a).room_pic}" alt="acc" class="poster" height="200" style=" border-bottom-style: none; border-style: solid;  border-color: #00ABB9 #00ABB9 #FFFFFF #00ABB9 ; box-shadow: 5px 0px 5px gray; border-radius:10px 10px 0px 0px;">
							
							</c:if>
							
							<c:if test="${roomList.get(a).room_rank==''}">
								<img src="${roomList.get(a).room_pic}" alt="acc" class="poster" height="200">
							</c:if>
							</div>
							
							<div class="ri-text"  style=" border-style: solid;  border-color: #FFFFFF #00ABB9 #00ABB9 #00ABB9;  box-shadow: 5px 5px 5px 5px gray; border-radius:0px 0px 10px 10px; height:260px; background:  #FAFAFA"  >
								<h4><b style="font-family: 'Jeju Hallasan' ">${roomList.get(a).room_title}</b></h4>
								<table>
									<tbody>
										<tr>
											<td class="r-o" style="color: green"><b style="font-family: 'Jeju Hallasan' ">평점:</b></td>
											<td style="color: green">
											<c:if test="${roomList.get(a).room_rank!=''}">
											${fn:substring(roomList.get(a).room_rank,0,3)}<b style="font-family: 'Jeju Hallasan' ">점</b>
											</c:if>
											<c:if test="${roomList.get(a).room_rank==''}">
											미정
											</c:if>
											</td>
										</tr>
										<tr>
											<td class="r-o" style="color: orange;"><b style="font-family: 'Jeju Hallasan' ">지역:</b></td>
											<td><b>${roomList.get(a).room_area}</b></td>
										</tr>
										<tr>
											<td class="r-o" style="color: blue"><b style="font-family: 'Jeju Hallasan' ">대실:</b></td>
											<c:if test="${roomList.get(a).room_price!='숙소에 문의'}">
													
											<td  style="color: blue">${roomList.get(a).room_price}<b style="font-family: 'Jeju Hallasan' ">원</b></td>
											</c:if>
											<c:if test="${roomList.get(a).room_price=='숙소에 문의'}">
											<td style="color: blue"> <b style="font-family: 'Jeju Hallasan' ">미정</b> </td>
											</c:if>
										</tr>
										<tr>
											<td class="r-o" style="color: red"><b style="font-family: 'Jeju Hallasan' ">숙박:</b></td>
											<c:if test="${roomList.get(a).room_price2!='숙소에 문의'}">
											<td style="color: red">${roomList.get(a).room_price2}<b style="font-family: 'Jeju Hallasan' "> 원</b></td>
											</c:if>
											<c:if test="${roomList.get(a).room_price2=='숙소에 문의'}">
											<td style="color: blue"> <b style="font-family: 'Jeju Hallasan' ">미정</b> </td>
											</c:if>
											
										</tr>
									</tbody>
									
								</table>
								<c:if test="${roomList.get(a).room_rank!=''}">
<%-- 								<a href="/accomodation/roomDetail?bno=${roomList.get(a).room_link}" class="primary-btn"> --%>
								<a></a>
<!-- 								</a>  -->
								</c:if>
								
								<c:if test="${roomList.get(a).room_rank==''}">
								<a class="primary-btn"> <b style="font-family: 'Jeju Hallasan' ">준비중 </b></a> 
								</c:if>
								
								<c:set var="a" value="${a=a+1}"/>

							</div>
<div class="bubbles bubble-1"></div>
<div class="bubbles bubble-5"></div>
<div class="bubbles bubble-2"></div>
<div class="bubbles bubble-6"></div>
<div class="bubbles bubble-3"></div>
<div class="bubbles bubble-7"></div>
<div class="bubbles bubble-4"></div>
<div class="bubbles bubble-8"></div>
							
						</div>
					</div>
					</a>
				</c:forEach>
			</div>
		</div>  <button type="button" id="reserveBtn" class="btn btn-primary" >예약하기</button>
	</section>
	</section>
	<!-- <!-- 방정보 처음 6개 --> -->

<div class="bubbles bubble-1"></div>
<div class="bubbles bubble-5"></div>
<div class="bubbles bubble-2"></div>
<div class="bubbles bubble-6"></div>
<div class="bubbles bubble-3"></div>
<div class="bubbles bubble-7"></div>
<div class="bubbles bubble-4"></div>
<div class="bubbles bubble-8"></div>


<jsp:include page="../include/footer.jsp" />
	
</body>
</html>