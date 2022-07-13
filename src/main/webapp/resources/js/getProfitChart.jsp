<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>   
<script type="text/javascript">

$(function(){
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);
	
	function drawChart(){
		var jsonData = $.ajax({
			url : "/admin/trendChart",
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
			url : "/admin/monthlyChart",
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

</script>



