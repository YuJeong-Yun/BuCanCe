<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="../include/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/group/invite.css" />

    <!-- Breadcrumb Section Begin -->
    <div class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2>Tour Plan</h2>
                        <div class="bt-option">
                            <span>그룹으로 초대해 함께 플랜을 작성해 보세요!</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section End -->




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

	        <div class="input-group mb-3">
			  <input type="text" class="form-control member-search-input" placeholder="아이디를 입력하세요." aria-label="Recipient's username" aria-describedby="button-addon2">
			  <button class="btn btn-outline-secondary member-serach" type="button" id="button-addon2">검색</button>
			</div>
	        
	       	<ul class="member-list">
			</ul>
	        
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">완료</button>
<!-- 	        <button type="button" class="btn btn-primary">Save changes</button> -->
	      </div>
	    </div>
	  </div>
	</div>
	
    <!-- Room Details Section Begin -->
    <section class="room-details-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12"  align="center">
                    <div class="room-details-item">
                        <div class="rd-text">
		                    <div class="room-booking">
		                    	<div class="col-lg-4">
			                        <form action="#">
			                        	<!-- Button trigger modal -->
										<button class="add-group" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
										  플랜 생성하기
										</button>
			                        </form>
		                        </div>
		                    </div>
                            <br><br><br><br>
                            <p class="f-para">더 많은 플랜을 작성하고 싶다면?</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
 
    </section>
    <!-- Room Details Section End -->

<script type="text/javascript">
	const searchBtn = document.querySelector('.member-serach');
	const searchInput = document.querySelector('.member-search-input');
	const memberList = document.querySelector('ul.member-list');
	
	searchBtn.addEventListener('click', showMember);
	
	function showMember() {
		let searchID = searchInput.value;
		
		$.ajax({
	  		url: "${pageContext.request.contextPath}/group/inviteAJAX",
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
