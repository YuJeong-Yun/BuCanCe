<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	var title = '${resVO.title}';
	var addr = '${resVO.addr}';
	
	function startPage(){
		
	}
	
	$(function(){
		
		
		$('#blogReview').click(function(){
			
			document.getElementById('review').className = "";
			document.getElementById('writeReview').style.visibility = 'hidden';
			document.getElementById('blogList').style.display = 'inline-block';
			document.getElementsByClassName('load-more')[0].style.display = 'inline-block';
			document.getElementById('blogReview').className = "active";
			
			
			 $.ajax({
				url : "/getBlog?title="+title+"&addr="+addr+"&start=1",
				success : function(data){
						$(data[0]).each(function(i,obj){
							$('.rd-reviews').append("<div class='ri-text'><a href="+obj.link+" target='_blank'><h2>"+obj.title+"</h2><p>"+obj.description+"</p></a></div>");
						});
					}
				});
			
		 
		}); // blogReview
		
		
		$('#review').click(function(){
			
			document.getElementById('blogReview').className = "";
			document.getElementById('blogList').style.display = 'none';
			document.getElementsByClassName('load-more')[0].style.display = 'none';
			document.getElementById('writeReview').style.visibility = 'visible';
			document.getElementById('review').className = "active";
			
			
		 
		}); // review
		
		
	}); // jQuery

</script>    
