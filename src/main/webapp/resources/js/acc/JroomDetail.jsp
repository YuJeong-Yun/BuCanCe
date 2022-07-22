<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<!-- 날짜 정보 입력시 유효성 체크 시작 -->
<script type="text/javascript">
              
             //최대 7박까지가능, 올바른 날짜 입력 유효성체크
             $(document).ready(function(){
            		
            $('#reserveBtn').click(function(){
            			
            //날짜 차이를 구하는 함수
            function difference(date1, date2) {  
            		const date1utc = Date.UTC(date1.getFullYear(), date1.getMonth(), date1.getDate());
            		const date2utc = Date.UTC(date2.getFullYear(), date2.getMonth(), date2.getDate());
            				 day = 1000*60*60*24;
            		return (date2utc - date1utc)/day
           	}
            
            		const date1 = new Date(document.getElementById("date-in").value);
            		const date2 = new Date(document.getElementById("date-out").value);
            			
					//날짜 차이
            		const time_difference = difference(date1,date2)
            				
            		
            		function getFormatDate(date){
            		    var year = date.getFullYear();              //yyyy
            		    var month = (1 + date.getMonth());          //M
            		    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
            		    var day = (1+date.getDate());                   //d
            		    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
            		    return  year + '-' + month + '-' + day;
            		}
            				
            		var bate = getFormatDate(date2);
            		
            		//날짜차이가 7일이내인 경우 submit
            		if(1 <= parseInt(time_difference) && parseInt(time_difference) <= 7){
            			dateForm.submit();
            		}//날짜차이가 0인경우 내일날짜를 바꿔주는 동작
            		else if(parseInt(time_difference) == 0){
            			document.getElementById("date-out").value=bate;
            			dateForm.submit();
            		}
            		else{
            			alert('올바른 날짜를 입력해주세요\n최대 7박까지 가능합니다.')
            		}});// 버튼클릭 끝
            		
            		
            	});
                
                
 </script>
<!-- 날짜 정보 입력시 유효성 체크 끝 -->
    