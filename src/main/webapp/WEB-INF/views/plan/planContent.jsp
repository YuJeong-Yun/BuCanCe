<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Outlined|
Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/plan/planContent.css" />

	<!--그룹 멤버 보여주기 메뉴-->
	<section class="show-grp-menu">
	  <div class="container">
	    <span class="material-icons-outlined show-grp">menu</span>
	  </div>
	</section>
	<!--그룹 멤버-->
	<section class="grp-member">
	  <div class="container">
	    <ul class="member-container">
	      <li>
	        <div class="member--profile"><img src="${pageContext.request.contextPath }/resources/img/who.jpg" /></div>
	        <div class="member--id">yun1</div>
	        <div class="member--name">유정</div>
	      </li>
	      <li>
	        <div class="member--profile"><img src="${pageContext.request.contextPath }/resources/img/who.jpg" /></div>
	        <div class="member--id">yun1</div>
	        <div class="member--name">유정</div>
	      </li>
	      <li class="add-member">
	      	<!-- Button trigger modal -->
		    <span class="material-icons-outlined add-group" data-bs-toggle="modal" data-bs-target="#exampleModal">add_circle</span>
	      </li>
	    </ul>
	  </div>
	</section>
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Invite Member</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      
			<!-- 모달 본문 -->
	        <div class="input-group mb-3"> <!-- 아이디 검색창 -->
			  <input type="text" class="form-control member-search-input" placeholder="아이디를 입력하세요." aria-label="Recipient's username" aria-describedby="button-addon2">
			  <button class="btn btn-outline-secondary member-serach" type="button" id="button-addon2">검색</button>
			</div>
	       	<ul class="member-list"> <!-- 검색 결과 회원 리스트 -->
			</ul>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">완료</button>
	      </div>
	    </div>
	  </div>
	</div>



  <!--플랜 작성-->
  <section class="make-plan">


  </section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath }/resources/js/plan/planContent.js"></script>
<script type="text/javascript">
	const searchBtn = document.querySelector('.member-serach');
	const searchInput = document.querySelector('.member-search-input');
	const memberList = document.querySelector('ul.member-list');
	
	searchBtn.addEventListener('click', showMember);
	
	function showMember() {
		let searchID = searchInput.value;
		
		$.ajax({
	  		url: "${pageContext.request.contextPath}/memberID",
	  		type: "post",
	  		data: {
	  			id : searchID
	  		} ,
	  		success: function(item) {
	  			while (memberList.hasChildNodes()) {
	  				memberList.removeChild(memberList.firstChild );       
	  			}
	  			
	  			for(let i=0;i<item.length;i++) {
					const member = document.createElement('li');
					member.innerHTML = 
						"<form>" +
							"<div class=member--id>"+item[i].id+"</div>" +
							"<div class=member--name>"+item[i].name+"</div>" +
							"<button type=button class='btn btn-primary'>추가</button>" +
						"</form>";
						
		           memberList.append(member);
	  			}
	  		},
	  	    error:function(data){
	  	      alert("오류");
	  	      console.log(data);
	  	    }
	  	}); // $.getJSON
	  }
	
</script>
<jsp:include page="../include/footer.jsp" />