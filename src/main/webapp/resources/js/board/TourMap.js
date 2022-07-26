let container = document.getElementById('map');
let options = {
		center : new kakao.maps.LatLng(35.198362,129.053922), // 중심좌표
		level : 9.7
};
let map = new kakao.maps.Map(container,options),
customOverlay = new kakao.maps.CustomOverlay({});

DrawPolygon();
map.setDraggable(); // 드래그x
map.setZoomable(); // 줌기능x

function DrawPolygon(){
	$.getJSON(path+'/resources/json/busanMap.geojson',function(geojson){
		let data = geojson.features;
		let name = ''; // 행정구 명 
		
		$.each(data, function(i,v){
			name = v.properties.SIG_KOR_NM;
			
			// 폴리곤 타입에 따라 메서드 다르게 실행
			if(v.geometry.type == "MultiPolygon"){
				displayArea(name,v.geometry.coordinates, true);
			} else {
				displayArea(name,v.geometry.coordinates, false);
			}
			
		});
			
		
	});
}


function displayArea(name,coordinates,multi){
	
	if(multi){
		makeMultiPolygon(name,coordinates);
	} else {
		makePolygon(name,coordinates);
	}
}

function makePolygon(name,coordinates){
	let polygonPath = [];
	
	// coordinates:[[[lng,lat],[lng,lat]...[lng,lat]]]의 데이터 형식
	$.each(coordinates[0], function(i,coordinate){
		polygonPath.push(new kakao.maps.LatLng(coordinate[1], coordinate[0]));
	});
	
	let polygon = new kakao.maps.Polygon({
		map : map,
		path : polygonPath,
		strokeWeight : 2,
		strokeColor : '#004c80',
		strokeOpacity : 0.8,
		fillColor : '#fff',
		fillOpacity : 0.7
	});
	
	
	 // 다각형에 mouseover 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 변경합니다 
    // 지역명을 표시하는 커스텀오버레이를 지도위에 표시합니다
    kakao.maps.event.addListener(polygon, 'mouseover', function(mouseEvent) {
        polygon.setOptions({fillColor: '#09f'});

        customOverlay.setContent('<div class="area">' + name + '</div>'); // 지역구명
        
        customOverlay.setPosition(mouseEvent.latLng); 
        customOverlay.setMap(map);
    });

    // 다각형에 mousemove 이벤트를 등록하고 이벤트가 발생하면 커스텀 오버레이의 위치를 변경합니다 
    kakao.maps.event.addListener(polygon, 'mousemove', function(mouseEvent) {
        
        customOverlay.setPosition(mouseEvent.latLng); 
    });

    // 다각형에 mouseout 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 원래색으로 변경합니다
    // 커스텀 오버레이를 지도에서 제거합니다 
    kakao.maps.event.addListener(polygon, 'mouseout', function() {
        polygon.setOptions({fillColor: '#fff'});
        customOverlay.setMap(null);
    }); 

    // 다각형에 click 이벤트를 등록하고 클릭시 해당 구역 관광지 페이지로 이동
    kakao.maps.event.addListener(polygon, 'click', function(mouseEvent) {
    	location.href = '/board/tourList?t_category=0&addr='+name;
    });
}


function makeMultiPolygon(name,coordinates){
	let polygonPath = [];
	
	// coordinates[[[[lng,lat],[lng,lat],...[lng,lat]]]]
	$.each(coordinates,function(i,v2){
		let coordinates2 = [];
		
		// 배열 한번 더 접근
		$.each(v2[0],function(i2,coordinate){
			coordinates2.push(new kakao.maps.LatLng(coordinate[1],coordinate[0]));
		});
		polygonPath.push(coordinates2);
	});
	
	let polygon = new kakao.maps.Polygon({
		map:map,
		path:polygonPath,
		strokeWeight:2,
		strokeColor:'#004c80',
		strokeOpacity:0.8,
		fillColor:'#fff',
		fillOpacity:0.7
	});
	
	
	 // 다각형에 mouseover 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 변경합니다 
    // 지역명을 표시하는 커스텀오버레이를 지도위에 표시합니다
    kakao.maps.event.addListener(polygon, 'mouseover', function(mouseEvent) {
        polygon.setOptions({fillColor: '#09f'});

        customOverlay.setContent('<div class="area">' + name + '</div>');
        
        customOverlay.setPosition(mouseEvent.latLng); 
        customOverlay.setMap(map);
    });

    // 다각형에 mousemove 이벤트를 등록하고 이벤트가 발생하면 커스텀 오버레이의 위치를 변경합니다 
    kakao.maps.event.addListener(polygon, 'mousemove', function(mouseEvent) {
        
        customOverlay.setPosition(mouseEvent.latLng); 
    });

    // 다각형에 mouseout 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 원래색으로 변경합니다
    // 커스텀 오버레이를 지도에서 제거합니다 
    kakao.maps.event.addListener(polygon, 'mouseout', function() {
        polygon.setOptions({fillColor: '#fff'});
        customOverlay.setMap(null);
    }); 

  	// 다각형에 click 이벤트를 등록하고 클릭시 해당 구역 관광지 페이지로 이동
    kakao.maps.event.addListener(polygon, 'click', function(mouseEvent) {
    	location.href = '/board/tourList?t_category=0&addr='+name;
    }); 
}