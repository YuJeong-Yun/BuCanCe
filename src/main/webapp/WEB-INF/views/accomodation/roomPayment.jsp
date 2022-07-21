<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="http://wooshin.mireene.co.kr/g5/js/jquery-1.8.3.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/acc/CroomPayment.css" type="text/css">

	<!-- Header Section Begin -->
	<jsp:include page="../include/header.jsp" />
	<!-- Header End -->

	<!-- Breadcrumb Section Begin -->
	<div class="breadcrumb-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-text">
						<h2>결제 페이지</h2>
						<div class="bt-option">
							<a href="<%=request.getHeader("REFERER")%>">예약항목 선택</a>
							<span>결제 페이지</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Section End -->

	<c:if test="${id != null}">
	<!-- Room Details Section Begin -->
	<section class="room-details-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="room-details-item">
						<img src="${vo.room_pic}" alt="" height="300" width="500"
							style="border: solid gray; box-shadow: 5px 5px 5px 5px gray; border-radius: 10px;">
						<div class="rd-text">
							<div class="rd-title">
								<h3>${vo.room_subTitle}</h3>
								<div class="rdt-right"></div>
						
							</div>

							<table>
								<tbody>

									<tr>

										<td class="r-o"><p></p>예약명 <input type="text" placeholder="서명란"
											value="${user_name}" style="border-radius: 10px;" readonly></td>
										<td><br> <br></td>
									</tr>
									<tr>
										<td><br></td>
									</tr>
									<tr>
										<td class="r-o">결제수단</td>
									</tr>

									<tr>
										<td><select id="payment-select" class="select_type_1"
											style="border-radius: 10px;" >
												<option value="kakaopay">카카오페이</option>
												<option value="tosspay">토스</option>
												<option value="html5_inicis" selected="selected">신용/체크카드</option>
												<option value="payco">PAYCO</option>
												<option value="danal_tpay">휴대폰결제</option>
										</select></td>
									</tr>
								</tbody>
							</table>


							<p class="f-para">
							<hr>
							<section class="agree">
								<p class="all_check">
									<label><input type="checkbox" name="checkAll"
										value="selectAll" onclick="selectAll(this)" class="inp_chk_02">
										<span><b>전체 동의</b style="color: red"></span></label>
								</p>
								<p>
									<input type="checkbox" name="checkOne" class="inp_chk_02"
										id="checkOne"><i> <a href="javascript:void(0)"
										onclick="openLayer('hd_pops_1',500,500)"><u>숙소이용규칙 및
												취소/환불규정 동의</a></i><b style="color: red"> (필수)</u></b>
								</p>
								<p>
									<input type="checkbox" name="checkOne" class="inp_chk_02"
										id="checkTwo"> <span onclick="pop_agree_02();"><i><a
											href="javascript:void(0)"
											onclick="openLayer('hd_pops_2',540,540)"><u>개인정보 수집 및
													이용 동의</a></i><b style="color: red"> (필수)</b></span></u>
								</p>
								<p>
									<input type="checkbox" name="checkOne" class="inp_chk_02"
										id="checkThree"> <span onclick="pop_agree_03();"><i><a
											href="javascript:void(0)"
											onclick="openLayer('hd_pops_3',570,270)"><u>개인정보 제 3자
													제공 동의</a></i><b style="color: red"> (필수)</b></span></u>
								</p>

								<p>
									<input type="checkbox" name="checkOne" class="inp_chk_02"
										id="checkFour"> <span onclick="pop_agree_04();"><i><a
											href="javascript:void(0)"
											onclick="openLayer('hd_pops_4',600,600)"><u>만 14세 이상
													확인</a></i><b style="color: red"> (필수)</b></span></u>
								</p>
							</section>

						</div>
					</div>
				</div>



				<!-- 팝업내용 -->
				<div id="wrapper_popup">
					<div id="hd_pops_1" class="c1 layer-shadow">
						<!-- 이 아래부터 레이어팝업 본문 -->
						<h2>숙소이용규칙 및 취소/환불 규정(필수)</h2>
						<p>
						<div class="txt">
							<strong>이용규칙</strong>
							<p></p>
							<ul class="dot_txt">
								<li>객실요금은 2인 기준이며, 파티룸 등 대형객실의 경우 입실 인원은 숙소에 문의해주세요. (3인이상
									혼숙불가)</li>
								<li>미성년자 혼숙은 법적으로 불가하며, 이에 대한 숙소의 입실 거부 시 취소/환불이 불가합니다.</li>
								<li>미성년자 예약에 대한 숙소의 입실 거부 시 취소/환불이 불가하오니, 예약 전 반드시 숙소에
									확인하시기 바랍니다.</li>
								<li>업체 현장에서 객실 컨디션 및 서비스로 인해 발생된 분쟁은 여기어때에서 책임지지 않습니다.</li>
							</ul>
							<p></p>
							<strong>취소/환불규정</strong>
							<p></p>
							<ul class="dot_txt">
								<li>취소 및 환불이 불가한 숙소입니다.</li>
								<li>숙소 사정에 의해 취소 발생 시 100% 환불이 가능합니다.</li>
								<li>모텔은 예약 후 15분 이내 고객행복센터로 취소 요청 시 100% 환불 가능합니다.</li>
							</ul>
						</div>


						<!-- 이 위까지 레이어팝업 본문 -->
						<div class="b-area"></div>
						<a href="javascript:void(0)" onclick="closeLayer('hd_pops_1')"><img
							class="cancel"
							src="${pageContext.request.contextPath}/resources/img/cancel2.png"></a>
					</div>


					<div id="hd_pops_2" class="c2 layer-shadow">
						<!-- 이 아래부터 레이어팝업 본문 -->
						<h2>개인정보 수집 및 이용 동의(필수)</h2>
						<p>
						<div class="scroller"
							style="transform: translate(0px, 0px) translateZ(0px);">
							<div class="txt">
								<table border="1" class="pop_table">
									<tbody>
										<tr>
											<th>구분</th>
											<th>수집/이용 목적</th>
											<th>수집 항목</th>
											<th>보유·이용기간</th>
										</tr>
										<tr>
											<td>필수</td>
											<td>예약/결제 서비스 이용</td>
											<td>- 예약서비스이용: <br>예약자 이름,휴대폰 번호, CI<br> <br>
												- 결제서비스이용: <br> (카드 결제 시) <br>카드사명,카드번호,유효기간,이메일<br>
												(휴대폰 결제 시)<br> 휴대폰 번호, 통신사, 결제 승인번호<br> (계좌이체 시)<br>
												은행명, 계좌번호, 예금주<br> (현금 영수증 발급 시)<br> 휴대폰 번호, 이메일<br>
												( 취소·환불을 위한 대급지급 요청 시)<br> 은행명, 계좌번호, 예금주명<br> <br>
												<div>
													- 서비스 이용: <br> 서비스 이용시간/이용기록, 접수로그, 이용컨텐츠, 접속IP정보,
													기기모델명, 브라우저 정보
												</div></td>
											<td><b><i>전자상거래 상 소비자 보호에 관한 법률에 따라 5년간 보관</i></b></td>
										</tr>
									</tbody>
								</table>
								<p></p>
								<ul class="dot_txt">
									<li>※ 위 동의 내용을 거부하실 수 있으나, 동의를 거부하실 경우 서비스를 이용하실 수 없습니다.</li>
									<li>※ 개인정보 처리와 관련된 상세 내용은 '개인정보처리방침'을 참고</li>
								</ul>
							</div>
						</div>


						<!-- 이 위까지 레이어팝업 본문 -->
						<div class="b-area"></div>
						<a href="javascript:void(0)" onclick="closeLayer('hd_pops_2')"><img
							class="cancel"
							src="${pageContext.request.contextPath}/resources/img/cancel2.png"></a>
					</div>

					<div id="hd_pops_3" class="c3 layer-shadow">
						<!-- 이 아래부터 레이어팝업 본문 -->
						<h2>개인정보 제 3자 제공 동의(필수)</h2>
						<p>
						<div class="scroller"
							style="transform: translate(0px, 0px) translateZ(0px);">
							<div class="txt">
								<table border="1" class="pop_table">
									<tbody>
										<tr>
											<th style="width: 25%;">제공받는 자</th>
											<th style="width: 25%;">제공 목적</th>
											<th style="width: 25%;">제공하는 항목</th>
											<th style="width: 25%;">제공받는 자의 개인정보 보유 및 이용기간</th>
										</tr>
										<tr>
											<td><b>${vo.room_title} 호텔</b></td>
											<td><b>숙박예약서비스 이용계약 이행<br>(서비스 제공, 확인, 이용자 정보
													확인)
											</b></td>
											<td>예약한 숙박서비스의 이용자 정보(예약자 이름, 휴대폰번호, 예약번호, 예약한 업체명, 예약한
												객실명, 결제금액)</td>
											<td><b>예약서비스 제공 완료 후 6개월</b></td>
										</tr>
										<!---->
										<!---->
									</tbody>
								</table>
								<p></p>
								<ul class="dot_txt">
									<li>※ 위 동의 내용을 거부하실 수 있으나, 동의를 거부하실 경우 서비스를 이용하실 수 없습니다.</li>
									<li>※ 개인정보 처리와 관련된 상세 내용은 '개인정보처리방침'을 참고</li>
								</ul>
							</div>
						</div>
						<!-- 이 위까지 레이어팝업 본문 -->
						<div class="b-area"></div>
						<a href="javascript:void(0)" onclick="closeLayer('hd_pops_3')"><img
							class="cancel"
							src="${pageContext.request.contextPath}/resources/img/cancel2.png"></a>
					</div>

					<div id="hd_pops_4" class="c4 layer-shadow">
						<!-- 이 아래부터 레이어팝업 본문 -->
						<h2>만 14세 이상 확인(필수)</h2>
						<div class="txt">
							<p class="subtitle">
								<strong>부캉스(BuCanCe)</strong>는 <b>만 14세 미만 아동</b>의 <b>서비스
									이용을 제한</b>하고 있습니다.
							</p>
							<p>
								정보통신망 이용촉진 및 정보보호 등에 관한 법률에는 만 14세 미만 아동의 개인정보 수집 시 법정대리인 동의를
								받도록 규정하고 있으며, <i>만 14세 미만 아동이 법정대리인 동의없이 서비스 이용이 확인된 경우 서비스
									이용이 제한될 수 있음을 알려드립니다.</i>
							</p>
						</div>


						<!-- 이 위까지 레이어팝업 본문 -->
						<div class="b-area"></div>
						<a href="javascript:void(0)" onclick="closeLayer('hd_pops_4')"><img
							class="cancel"
							src="${pageContext.request.contextPath}/resources/img/cancel2.png"></a>
					</div>


				</div>

				<!-- 팝업내용 -->



					<!-- 아임포트 결제 숙박용 -->
				<jsp:include page="../accomodation/acc/JroomPayment.jsp"/>
				<!-- 아임포트 결제 숙박용 -->




				<div class="col-lg-4">
					<div class="room-booking"
						style="border: solid gray; box-shadow: 5px 5px 5px 5px gray; background-color: fafafa; border-radius: 10px;">
						<p></p>
						<h3>
							<b>결제 정보</b>
						</h3>
						<form onSubmit="return false;">
							<!-- 뒤로가기 할 주소 -->
							<input type="hidden" value="<%=request.getHeader("REFERER")%>"
								id="reload">
							<!-- 뒤로가기 할 주소 -->
							<div class="check-date">
								<label for="date-out"><b>호텔명</b></label> <input type="text"
									id="date-out" value="${vo.room_title}" readonly
									style="font-weight: bold;"> <i class=""></i>
							</div>
							<div class="check-date">
								<label for="date-in"><b>마감시간</b></label> <input type="text"
									id="date-in" readonly value="${vo.checkin}일 ${vo.room_endtime}시까지"
									style="font-weight: bold;"> <i class="icon_calendar"></i>
							</div>

							<div class="check-date">
								<datalist>
								</datalist>
								<label for="date-out"><b>이용시간</b></label> <input type="text"
									id="date-out" readonly value="${vo.room_usetime} 시간"
									style="font-weight: bold;"> <i class="icon_calendar"></i>
							</div>

							<div class="check-date">
								<label for="date-out"><b>서명</b></label> <input type="text"
									value=${user_name } id="date-out" style="font-weight: bold;">
								<i class=""></i>
							</div>
							<p></p>
							<hr>
							<div class="check-date">
							
							<c:if test="${license==0}">
								<label for="date-out"><strong>총 결제 금액 (VAT포함)</strong></label> <input
									type="text" id="date-out2" value="${vo.room_fcost} 원" readonly
									style="font-weight: bold; font-size: 20px"> 
								</c:if>
								
								
								<c:if test="${license==1}">
									<label for="date-out"><strong style="color: red">총
											결제 금액 (멤버쉽 할인, VAT포함)</strong></label>
									<input type="text" id="date-out2"
										value="<fmt:formatNumber type="number" maxFractionDigits="0"  value="${vo.room_fcost*0.95}"/> 원"
										style="color: red; font-weight: bold; font-size: 20px"
										readonly>
								</c:if>
									
									
									
									<i class=""></i>
								<p></p>
								<ul>
									<li>해당 객실가는 세금, 봉사료가 포함된 금액입니다</li>
									<li>결제완료 후 예약자 이름으로 바로 체크인 하시면 됩니다</li>
								</ul>
							</div>


							<button type="button"  onclick="requestPay()" class="btn btn-block btn-primary btn-sm"
style=" border: solid white;  width: 90%; box-shadow: 5px 5px 5px 5px gray; border-radius: 10px; margin-bottom: 10px;">
<span style="color: black;"><b>결제하기</b></span>
</button>

							<button type="button" onclick="cancelPay()"
class="btn btn-block btn-danger btn-sm"
style="border: solid white; width: 90%; box-shadow: 5px 5px 5px 5px gray; border-radius: 10px;">
<span style="color: black"><b>취소하기</b></span>
</button>
							<p></p>
						</form>


					</div>
				</div>



			</div>
		</div>




	</section>
	</c:if>
	<!-- Room Details Section End -->



	<!-- Footer Section Begin -->
<jsp:include page="../include/footer.jsp" />
	<!-- Footer Section End -->
