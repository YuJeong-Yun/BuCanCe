<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
</head>
<body>
   <jsp:include page="../include/header.jsp" />
<c:if test="${id == null}">
	<script>
	alert('로그인이 필요합니다');
	location.href="${pageContext.request.contextPath}/login";
	</script>
</c:if>
    <!-- Breadcrumb Section Begin -->
    <div class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2>예약목록 페이지</h2>
                        <div class="bt-option">
                            <a href="${pageContext.request.contextPath}/accomodation/roomList">Home</a>
                            <span>Rooms</span>
                            
                            <c:if test="${UserPayList == '[]'}">
                            <br><br> <br><br> <br><br> <br><br>
                            <h2>"예약목록이 없습니다!"</h2>
                            
                            </c:if>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section End -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script><!-- jQuery CDN --->
    <!-- Rooms Section Begin -->
    <c:if test="${id != null}">
    <section class="rooms-section spad">
        <div class="container">
            <div class="row">
            
            
            <c:set var="a" value="0"/>
				<c:forEach items="${UserPayList}" begin="0" end="${UserPayList.size()}">
                <div class="col-lg-4 col-md-6" >
                    <div class="room-item">
                        <img src="${pageContext.request.contextPath}/resources/img/room/room-1.jpg" alt="" style="border: solid gray; box-shadow: 5px 5px 5px 5px gray; border-radius:10px;">
                        <div class="ri-text" style="border: solid #00abb9; box-shadow: 5px 5px 5px 5px gray; border-radius:10px;">
							<h5>주문번호 : ${UserPayList.get(a).accId}</h5>
							<hr>
							<br>
                            <h4>${UserPayList.get(a).accName}
                            
                             <c:if test="${UserPayList.get(a).license==1}">
                            	<br><a style="color :red">(할인)</a>
                            </c:if>
                            </h4>
                            <h5>${UserPayList.get(a).roomSort}</h5><br>
                            <table class="table"style=" box-shadow: 5px 5px 5px 5px gray; background-color: white; border-radius: 10px;" >
                                <tbody >
                                    <tr>
                                        <td class="r-o">예약명</td>
                                        <td>${UserPayList.get(a).user_name}</td>
                                    </tr>
                                   
                                        <c:if test="${UserPayList.get(a).sort=='ds'}">
                                        <tr>
                                        <td class="r-o">종류</td>
                                        <td>대실</td>
                                        </tr>
                                        </c:if>
                                        
                                        
                                        <c:if test="${UserPayList.get(a).sort=='acc'}">
                                        <tr>
                                        <td class="r-o">종류</td>
                                       <td>숙박</td>
                               		  </tr>
                               		  
                               		   </c:if>
                                    
                                    
                                    <tr>
                                        <td class="r-o">기간 </td>
                                        <td>${UserPayList.get(a).checkIn} ~ ${UserPayList.get(a).checkOut}</td>
                                    </tr>
                                    
                                    
                                    <tr>
                                    
                                    <c:if test="${UserPayList.get(a).sort=='ds'}">
                                        <td class="r-o">이용시간<br>퇴실시간 </td>
                                        <td>${UserPayList.get(a).useTime}시간/${UserPayList.get(a).endTime}시 </td>
                                 	</c:if>
                                 	
                                    <c:if test="${UserPayList.get(a).sort=='acc'}">
                                        <td class="r-o">이용시간<br>퇴실시간</td>
                                        <td>${UserPayList.get(a).useTime}시간/${UserPayList.get(a).endTime}시</td>
                                 	</c:if>
                                 	
                                    </tr>
                                    
                                    
                                     <tr>
                                        <td class="r-o">비용 </td>
                                        <td>${UserPayList.get(a).accAmount}원</td>
                                    </tr>
                                    
                                    <tr>
                                    <td>결제시간 </td>
                                    <td>${UserPayList.get(a).accDate}</td>
                                </tr>
                                    
                                    
                                </tbody>
                            </table>
                            
                            <form action="${pageContext.request.contextPath}/accomodation/roomRefund" method="post">
                            <input type="hidden" name="accId" value="${UserPayList.get(a).accId}">
                            <input type="hidden" name="accName" value="${UserPayList.get(a).accName}">
                            <input type="hidden" name="roomSort" value="${UserPayList.get(a).roomSort}">
                           	<input type="hidden" name="user_name" value="${UserPayList.get(a).user_name}">
                           	<input type="hidden" name="sort" value="${UserPayList.get(a).sort}">
                           	<input type="hidden" name="checkIn" value="${UserPayList.get(a).checkIn}">
                           	<input type="hidden" name="checkOut" value="${UserPayList.get(a).checkOut}">
                           	<input type="hidden" name="useTime" value="${UserPayList.get(a).useTime}">
                           	<input type="hidden" name="endTime" value="${UserPayList.get(a).endTime}">
                           	<input type="hidden" name="accAmount" value="${UserPayList.get(a).accAmount}">
                            <input type="hidden" name="accKind" value="${UserPayList.get(a).accKind}">
							<input type="hidden" name="id" value="${UserPayList.get(a).id}">
							<input type="hidden" name="license" value="${UserPayList.get(a).license}">
							
                            
                            <c:if test="${UserPayList.get(a).status!='refund'}">
                            <button type="submit" class="btn btn-block btn-success btn"  style="border-top-width: 8; border-bottom-width: 8"><b>환불하기</b></button>
                            </c:if>
                              <c:if test="${UserPayList.get(a).status=='refund'}">
                               <button type="button" class="btn btn-block btn-danger btn"  style="border-top-width: 8; border-bottom-width: 8"><b>환불처리</b></button>
                               </c:if>
                       		</form>
                       		
                       </div>
						</div>
                        </div>

    <c:set var="a" value="${a=a+1}"/>
                        </c:forEach>
                        <div class="col-lg-12">
					<div class="room-pagination">
                        
                    </div>
                </div>
             
            </div>
        </div>
    </section>
    </c:if>
    <!-- Rooms Section End -->

   <jsp:include page="../include/footer.jsp" />


</body>

</html>