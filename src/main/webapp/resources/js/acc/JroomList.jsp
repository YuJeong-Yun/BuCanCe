<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
//지역 select 고를때 동작
//해당지역을 골랐을때 지역에 해당하는 숙소목록을 보여줌
function selectArea(){
	idForm.submit();
	
	var input = document.getElementById("place_name"); 

	input.value = null;
	${select_place=""}
	
}
</script>


<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<!-- 숙소목록 무한 스크롤 -->
<script>
    var page = 0;
    var tt = 6;
	
    
    $(window).on("scroll", function() {
    	
    	var scrollHeight = $(document).height();
    	var scrollPosition = $(window).height() + $(window).scrollTop();		

    	$("#scrollHeight").text(scrollHeight);
    	$("#scrollPosition").text(scrollPosition);

    	if (scrollPosition > scrollHeight - 500) {	
        	
        var rl = ${roomList};
        
        
        $(rl).each(function(idx){
        	
        		if(idx<6){
        			var room_pic = rl[tt].room_pic;
               	   var room_title = rl[tt].room_title;
               	   var room_link = rl[tt].room_link;
               	   var room_rank = rl[tt].room_rank;
               	   var room_area= rl[tt].room_area;
               	   var room_price= rl[tt].room_price;
               	   var room_price2= rl[tt].room_price2;
                  	  	
               	
             			 var tmpHtml ="";
                    	  
                    	  tmpHtml += '<div class="col-lg-4 col-md-6" style="height:600px;">';
                    	  
                    	  //별점이 없으면 링크삭제 (오픈예정)
                    	  if(room_rank != ''){
                    		  
                    	tmpHtml +=  '<a href="/accomodation/roomDetail?bno='+room_link+'">';
                    	 
                    	  	}
                    	  
                    	tmpHtml += '<div class="room-item" style="border-radius: 2em;">';
                    	  tmpHtml += '<img src="'+room_pic+'" alt="acc" class="poster" height="200" style=" border-bottom-style: none; border-style: solid;  border-color: #00ABB9 #00ABB9 #FFFFFF #00ABB9 ; box-shadow: 5px 0px 5px gray; border-radius:10px 10px 0px 0px;">';
                    	  tmpHtml += '<div class="ri-text" style=" border-style: solid;  border-color: #FFFFFF #00ABB9 #00ABB9 #00ABB9;  box-shadow: 5px 5px 5px 5px gray; border-radius:0px 0px 10px 10px; height:260px; background: white">';
                    	  tmpHtml += '<h4>'+room_title+'</h4>';
                    	  tmpHtml += '<table><tbody>';
                    	 
                    	 
                    	  tmpHtml += '<tr><td class="r-o" style="color: green">평점:</td><td style="color: green">';
                    	 
 						  if(room_rank != ''){
 							 tmpHtml += ''+room_rank.substring(0,3)+'';
                    	  }
                    	  if(room_rank == ''){
                    		  tmpHtml += '오픈전'
                    	  }
                    	  tmpHtml += '</td>';
                    	  tmpHtml += '</tr>';
                    	  
                    	  tmpHtml += '<tr><td class="r-o">지역:</td><td>';
                    	  tmpHtml += ''+room_area+'';
                    	  tmpHtml += '</td>';
                    	  tmpHtml += '</tr>';
                    	  
                    	  tmpHtml += '<tr><td class="r-o" style="color: blue">대실:</td><td style="color: blue">';
                    	  tmpHtml += ''+room_price+'';
                    	  tmpHtml += '</td>';
                    	  tmpHtml += '</tr>';
                    	  
                    	  tmpHtml += '<tr><td class="r-o" style="color: red">숙박:</td><td style="color: red">';
                    	  tmpHtml += ''+room_price2+'';
                    	  tmpHtml += '</td>';
                    	  tmpHtml += '</tr>';
                    	  
                    	  tmpHtml += '</tbody></table>';
                    	  tmpHtml += '</div></div></div>';
                    	  
//                     	  alert(tmpHtml);
                    	  $(".rooms-section.spad .row").append(tmpHtml);
                    	  
                    	 
                    	tt++;
        		}
        			
                
        		
        		
        	   
             	  
        	
        });
        
       
         
        
         
        }
    });
</script>