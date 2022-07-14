<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">

	if("${vo.accName}"=="")
	{
	location.reload();
		
	}
</script>


</head>


    <!-- Header Section Begin -->
    <jsp:include page="../include/header.jsp" />
    <!-- Header End -->

    <!-- Contact Section Begin -->
    <section class="contact-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <div class="contact-text">
                        <h2>결제완료</h2>
                        <p>
                        이용해주셔서 감사합니다!
                        
                        
                        </p>
                        <div class="room-item">
                        <div class="ri-text" style="border: solid #00abb9; box-shadow: 5px 5px 5px 5px gray; border-radius:10px;">
                        <table class="table"style=" box-shadow: 5px 5px 5px 5px #f5f5f5; background-color: white; border-radius: 10px;" >
                            <tbody>
                                <tr>
                                    <td>숙소이름 </td>
                                    <td>${vo.accName}</td>
                                </tr>
                                <tr>
                                    <td >종류 </td>
                                    <c:if test="${vo.sort=='ds'}">
                                    <td>대실</td>
                                    </c:if>
                                    <c:if test="${vo.sort=='acc'}">
                                    <td>숙박</td>
                                    </c:if>
                                </tr>
                                <tr>
                                    <td >상품명</td>
                                    <td>${vo.roomSort }</td>
                                </tr>
                                <tr>
                                    <td>예약일자 </td>
                                    <td>${vo.checkIn} ~ <br>  ${vo.checkOut}</td>
                                </tr>
                              
                              	<c:if test="${vo.sort=='ds'}">
                                <tr>
                                    <td>이용시간 (마감)</td>
                                    <td >${vo.useTime}시간 (${vo.endTime}시까지) </td>
                                    
                                </tr>
                              	</c:if>
                              
                              <c:if test="${vo.sort=='acc'}">
                                <tr>
                                     <td>이용시간 (입/퇴실)</td>
                                    <td >${vo.useTime}시부터 (${vo.endTime}시까지)</td>
                                    
                                    
                                </tr>
                              	</c:if>
                              
                                <tr>
                                    <td>예약명 </td>
                                    <td>${vo.user_name}</td>
                                </tr>
                                <tr>
                                    <td>비용 </td>
                                    <td>${vo.accAmount}원</td>
                                </tr><tr><td></td><td></td></tr>
                            </tbody>
                        </table>
                      
                        <form action="${pageContext.request.contextPath}/accomodation/roomList">
                         <button type="submit" class="btn btn-block btn-primary btn"
                          style="border-top-width: 8; border-bottom-width: 8" ><b>메인페이지로</b></button> &nbsp;
                         
                         <button type="button" class="btn btn-block btn-danger btn"  
                         style="border-top-width: 8; border-bottom-width: 8" onclick="cancelBtn()"><b>취소하기</b></button>
                         
                         </form>
                         </div>
                         </div>
                    </div>
                </div>
               </div>
        </div>
    </section>
    <!-- Contact Section End -->


	<script type="text/javascript">
	
	function cancelBtn(){
		alert('예약목록으로 이동');
		location.href="${pageContext.request.contextPath}/accomodation/roomReList";
	}
	
	
	</script>



    <!-- Footer Section Begin -->
   <jsp:include page="../include/footer.jsp" />
    <!-- Footer Section End -->
