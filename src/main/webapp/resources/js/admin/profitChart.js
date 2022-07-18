

$(function(){
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);
	
	function drawChart(){
		let jsonData = $.ajax({
			url : "/adminRest/trendChart",
			dataType : "json",
			async : false
		}).responseText;
	console.log(jsonData);
	
	var data = new google.visualization.DataTable(jsonData);
 	var chart = new google.visualization.LineChart(document.getElementById("curve_chart"));
	
	
 	chart.draw(data,{
		title:"프리미엄 결제 현황",
		legend: { position: 'bottom' }
	});
	
	}
	
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart2);
	
	function drawChart2(){
		var jsonData = $.ajax({
			url : "/adminRest/monthlyChart",
			dataType : "json",
			async : false
		}).responseText;
	console.log(jsonData);
	
	var data = new google.visualization.DataTable(jsonData);
 	var chart = new google.visualization.LineChart(document.getElementById("monthly_chart"));
	
	
 	chart.draw(data,{
		title:"프리미엄 결제 월간 현황",
		legend: { position: 'bottom' }
	});
	
	}
	
	
});