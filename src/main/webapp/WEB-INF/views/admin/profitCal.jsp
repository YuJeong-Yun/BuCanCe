<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
										<th>구독결제일</th>
										<th>구독만료일</th>
										<th>정기구독여부</th>
									</tr>
								</thead>
								<tbody id="vipContent">
								</tbody>
							</table>
						</div>
                        </div>
                        <div class="bd-pic">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Details Section End -->

<jsp:include page="../include/footer.jsp" />
