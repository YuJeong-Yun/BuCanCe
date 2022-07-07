<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
	<jsp:include page="../include/header.jsp" />
	<jsp:include page="${pageContext.request.contextPath}/resources/js/getVIPInfo.jsp"></jsp:include>
	
    <!-- Breadcrumb Section Begin -->
    <div class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2>Premium 회원 내역</h2>
                        <div style="display: inline-block; margin-top: 1em;">
                        조회할 날짜 : 
                        <input type="month" name="searchDate">
                        <input type="button" value="조회" id="profitBtn">
                        </div>
                        <div id="pmSort">
					    <input type="button" value="구독회원만 보기" class="w-btn w-btn-indigo" onclick="location.href='/periodMems?date=${param.date}';">
					    <input type="button" value="모두보기" class="w-btn w-btn-indigo" onclick="location.href='/pmMembers?date=${param.date}';">
					    </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section End -->
    
    
    <!-- Blog Details Section Begin -->
    <section class="blog-details-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 offset-lg-1">
                    <div class="blog-details-text">
                        <div class="bd-title">
                        <div class="table-wrapper">
							<table>
							
								<thead>
									<tr>
										<th>회원ID</th>
										<th>정기구독여부</th>
										<th>구독결제일</th>
										<th>구독만료일</th>
									</tr>
								</thead>
								
								<tbody id="vipContent">
								<c:if test="${not empty pmMems }">
								<c:forEach var="i" begin="0" end="${pmMems.size()-1 }" step="1">
								<c:set var="period" value="${periodic[i] }"/>
								<c:set var="pm" value="${pmMems[i] }"/>
									<tr>
										<td>${pm.id }</td>
										<td>
										<c:if test="${not empty periodic }">
										${period }
										</c:if>
										<c:if test="${empty periodic }">
										y
										</c:if>
										</td>
										<td>${pm.success_date }</td>
										<td>${pm.license_deadline }</td>
									</tr>
								</c:forEach>
								</c:if>
								<c:if test="${empty pmMems }">
									<tr>
										<td colspan="4">내역이 없습니다.</td>
									</tr>
								</c:if>
								</tbody>
								
								<tfoot>
									<tr>
										<th colspan="3" id="total">총 수익</th>
										<th>${pmMems.size() * 6000 }</th>
									</tr>
								</tfoot>
								
							</table>
						</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Details Section End -->

<jsp:include page="../include/footer.jsp" />
