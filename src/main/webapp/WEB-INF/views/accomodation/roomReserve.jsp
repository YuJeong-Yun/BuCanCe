<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
    <jsp:include page="../include/header.jsp" />

    <!-- Breadcrumb Section Begin -->
    <div class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2 style="font-family: 'Jeju Hallasan' ">예약항목 선택</h2>
                        <div class="bt-option">
                            <a href="<%=request.getHeader("REFERER")%>">방 상세정보</a>
                            <span>${room_title} 선택</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section End -->

    <!-- Rooms Section Begin -->
    
    <!-- 예약정보가 없을때 처리로직 -->
    <c:if test="${roomReserve=='[]'}">
    	<h1 style="text-align: center;">예약 마감</h1>
    </c:if>
    
    <section class="rooms-section spad">
        <div class="container">
            <div class="row">
            <c:set var="a" />
            <c:forEach items="${roomReserve}" begin="0" end="${roomReserve.size()}">
            	
                <div class="col-lg-4 col-md-6">
                    <div class="room-item">
                       <a href="#">
                       <img src="${roomReserve.get(a).room_pic}" alt="acc" class="poster" style="border: solid gray; box-shadow: 5px 5px 5px 5px gray; border-radius:10px;">
                        <div class="ri-text"style="border: solid	#65A2FF; box-shadow: 5px 5px 5px 5px gray; border-radius:10px;" >
                            <h4>${roomReserve.get(a).room_title}</h4>
                            <table>
                                <tbody>
                                
                                <tr style="color: blue">
                                    
                                        <td class="r-o">대실: </td>
                                        
                                        <td>
                                        
                                        <c:if test='${roomReserve.get(a).room_fcost != ""}'>
                                        ${roomReserve.get(a).room_fcost} 원
										</c:if>
                                        
                                        <c:if test='${roomReserve.get(a).room_fcost == ""}'>
                                        숙소에 문의
										</c:if>
										
                                        </td>
                                    </tr>
                                
                                
  								    <tr style="color: blue">
                                    
                                        <td class="r-o" >(대)마감/이용:</td>
                                       <td>
                                       
                                         <c:if test='${roomReserve.get(a).room_fcost != ""}'>
                                       ${checkin}일 ${roomReserve.get(a).room_endtime}시 <br>
                                          ${roomReserve.get(a).room_usetime}시간
                                        </c:if>
                                        
                                         <c:if test='${roomReserve.get(a).room_fcost == ""}'>
                                       숙소에 문의
                                        </c:if>
                                        
                                       </td>
                                   
                                       
                                    </tr>
                                    
                                   
                                    
                                    
                                    
                                    <tr style="color: red">
                                        <td class="r-o" >숙박:</td>
                                        <td>
                                        <c:if test="${roomReserve.get(a).room_reserve2 != 1}">
                                        ${fn:substring(roomReserve.get(a).room_lcost,0,roomReserve.get(a).room_reserve2.length()-1)} 원
									</c:if>
									
									 <c:if test="${roomReserve.get(a).room_reserve2 == 1}">
                                        숙소에 문의
									</c:if>
									
									</td>
                                    </tr>
                                
                                     <tr style="color: red">
                                    
                                        <td class="r-o">(숙)입실/퇴실:</td>
                                       <td>
                                        <!-- 숙소가격정보가 있을때 -->
                                         <c:if test='${roomReserve.get(a).room_lcost != "1"}'>
                                        ${checkin}일 ${roomReserve.get(a).room_accendtime}시
                                        ${checkout}일
                                          ${roomReserve.get(a).room_accusetime}시
                                        </c:if>
                                         <!-- 숙소가격정보가 없을때 -->
                                         <c:if test='${roomReserve.get(a).room_lcost == "1"}'>
                                       숙소에 문의
                                        </c:if>
                                      
                                       </td>
                                    </tr>
                                    
                                    
                                    
                                    <tr style="color: red">
                                        <td class="r-o">총 숙박가격 :</td>
	                               <td>
									<c:if test="${roomReserve.get(a).room_reserve2 != 1 }">
									
                                        ${fn:substring(roomReserve.get(a).room_reserve2,0,roomReserve.get(a).room_reserve2.length()-1)} 원
									</c:if>
									<c:if test="${roomReserve.get(a).room_reserve2 == 1}">
                                        숙소에 문의
									</c:if>
									</td>
                                    </tr>
                                </tbody>
                                </a>
                            </table>
                          
                           
                          <c:if test="${roomReserve.get(a).room_fcost != ''}">
                            <form action="${pageContext.request.contextPath}/accomodation/roomPayment" style='display:inline'>
                           	<input type="hidden" name="room_title" value="${room_title}">
                           	<input type="hidden" name="room_reserve2" value="${fn:substring(roomReserve.get(a).room_reserve2,0,roomReserve.get(a).room_reserve2.length()-1)}">
                           	<input type="hidden" name="accendtime" value="${roomReserve.get(a).room_accendtime}">
                           	<input type="hidden" name="accusetime" value="${roomReserve.get(a).room_accusetime}">
                           	<input type="hidden" name="room_lcost" value="${roomReserve.get(a).room_lcost}">
                           	<input type="hidden" name="room_fcost" value="${roomReserve.get(a).room_fcost}">
                           	<input type="hidden" name="room_endtime" value="${roomReserve.get(a).room_endtime}">
                           	<input type="hidden" name="room_usetime" value="${roomReserve.get(a).room_usetime}">
                           	<input type="hidden" name="room_pic" value="${roomReserve.get(a).room_pic}">
                           	<input type="hidden" name="room_subTitle" value="${roomReserve.get(a).room_title}">
                           	<input type="hidden" name="checkout" value="${checkoutFull}">
                           	<input type="hidden" name="checkin" value="${checkinFull}">
                           	<input type="hidden" name="endtime" value="	${roomReserve.get(a).room_endtime}">
                           	<input type="hidden" name="usetime" value="${roomReserve.get(a).room_usetime}">
                           
                         </c:if>
                         
                         <c:if test="${roomReserve.get(a).room_tf == '대실 예약' }">
                            <button type="submit" class="btn btn-primary">대실 예약하기</button>&nbsp;  
                         	</c:if>
                         	
                         	<c:if test="${roomReserve.get(a).room_tf == '숙소에 문의 하세요' || roomReserve.get(a).room_fcost == ''  }">
                            <button type="button" class="btn btn-primary" style="background: red" disabled='disabled'>숙소에 문의</button> 
                         	</c:if>
                         
                         </form>
                         
                         
                          <c:if test="${roomReserve.get(a).room_reserve2 != 1 }">
                           
                          <form action="${pageContext.request.contextPath}/accomodation/roomPayment2" style="display:inline">
                           	<input type="hidden" name="room_title" value="${room_title}">
                           	<input type="hidden" name="room_reserve2" value="${fn:substring(roomReserve.get(a).room_reserve2,0,roomReserve.get(a).room_reserve2.length()-1)}">
                           	<input type="hidden" name="accendtime" value="${roomReserve.get(a).room_accendtime}">
                           	<input type="hidden" name="accusetime" value="${roomReserve.get(a).room_accusetime}">
                           	<input type="hidden" name="room_lcost" value="${roomReserve.get(a).room_lcost}">
                           	<input type="hidden" name="room_fcost" value="${fn:substring(roomReserve.get(a).room_reserve2,0,roomReserve.get(a).room_reserve2.length()-1)}">
                           	<input type="hidden" name="room_endtime" value="${roomReserve.get(a).room_accendtime}">
                           	<input type="hidden" name="room_usetime" value="${roomReserve.get(a).room_accusetime}">
                           	<input type="hidden" name="room_pic" value="${roomReserve.get(a).room_pic}">
                           	<input type="hidden" name="room_subTitle" value="${roomReserve.get(a).room_title}">
                           	<input type="hidden" name="checkout" value="${checkoutFull}">
                           	<input type="hidden" name="checkin" value="${checkinFull}">
                       
                              
                            
                            </c:if>
                            <c:if test="${roomReserve.get(a).room_df != '숙소에 문의 하세요' }">
                              <button type="submit" class="btn btn-primary">숙박 예약하기</button>
                             </c:if>
                             
                           <c:if test="${roomReserve.get(a).room_df == '숙소에 문의 하세요' }">
                            <button type="button" class="btn btn-primary" style="background: red" disabled='disabled'>숙소에 문의</button>
                             </c:if>
                            
                            </form>
                        </div>
                    </div>
                </div>
                <c:set var="a" value="${a=a+1}"/>
                </c:forEach>
                
                
               
            </div>
        </div>
    </section>
    <!-- Rooms Section End -->
   <jsp:include page="../include/footer.jsp" />

