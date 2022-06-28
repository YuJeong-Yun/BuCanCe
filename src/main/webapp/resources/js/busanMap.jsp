<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5b3d692ed9e41ded5eedc5a2578cee55"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
var map;

function Initialization(_map){
	map = _map;
}

function DrawPolygon(){
	$.getJSON("${contextPath}/resources/json/busanMap.geojson",function(geojson){
		var data = geojson.features;
		var name = ''; // 행정구 명 
		var code = '';
		
		$.each(data, function(i,v){
			name = v.properties.SIG_KOR_NM;
			code = v.properties.SIG_CD;
			
			if(v.geometry.type == "MultiPolygon"){
				displayArea(name,code,v.geometry.coordinates, true);
			} else {
				displayArea(name,code,v.geometry.coordinates, false);
			}
			
		});
			
		
	});
}

function makePolygon(coordinates){
	var polygonPath = [];
	
	$.each(coordinates[0], function(i,coordinate){
		polygonPath.push(new kakao.maps.LatLng(coordinate[1], coordinate[0]));
	});
	
	return new kakao.maps.Polygon({
		path : polygonPath,
		strokeWeight : 1,
		strokeColor : '#004c80',
		strokeOpacity : 0.8,
		strokeStyle : 'longdash',
		fillColor : '#A2FF99',
		fillOpacity : 0.2
	});
}

function makeMultiPolygon(coordinates){
	var polygonPath = [];
	
	$.each(coordinates,function(i,v2){
		var coordinates2 = [];
		
		$.each(v2[0],function(i2,coordinate){
			coordinates2.push(new kakao.maps.LatLng(coordinate[1],coordinate[0]));
		});
		polygonPath.push(coordinates2);
	});
	
	return new kakao.maps.Polygon({
		path:polygonPath,
		strokeWeight:1,
		strokeColor:'#004c80',
		strokeOpacity:0.8,
		strokeStyle:'longdash',
		fillColor:'#A2FF99',
		fillOpacity:0.2
	});
	
}

function displayArea(name,code,coordinates,multi){
	var polygon;
	
	if(multi){
		polygon = makeMultiPolygon(coordinates);
	} else {
		polygon = makePolygon(coordinates);
	}
	polygon.setMap(map);
}
</script>
