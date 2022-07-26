<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<div class="breadcrumb-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">

					<h2>구독권</h2>
					<br>

					<div class="bt-option">
						<span style="padding: 3em;">구독권을 통해 지금 바로 프리미엄 혜택을 누리세요</span>
						<table style="color: #40C4FF; margin: 0 auto;">
							<tr>
								<th>추가 혜택 하나,</th>
								<td>그룹 생성 인원 → 최대 10개 까지 !</td>
							</tr>
							<tr>
								<th>추가 혜택 둘,</th>
								<td>부캉스를 통해 숙소 예약시 할인 이벤트 !</td>
							</tr>
							<tr>
								<th>추가 혜택 셋,</th>
								<td>각종 행사 소식들을 제한없이 !</td>
							</tr>
							
							<tr>
								<th>정기 구독권 구매시, </th>
								<td>매달 간편하게 프리미엄 회원혜택을 !</td>
							</tr>
						</table>

						<br>
						<button class="btn btn-info" type="button"
							onclick="location.href='/order/order1'"
							style="margin: 3em; background-color: #40C4FF;">프리미엄 구독권</button>
                          
						<button class="btn btn-info" type="button"
							onclick="location.href='/order/order2'"
							style="margin: 3em; background-color: #40C4FF;">프리미엄 정기
							구독권</button>
						<br> <span style="padding: 1em; font-size: x-small;">구독권
							환불이 따로 불가능 합니다</span><br> <span
							style="padding: 1em; font-size: x-small;">정기결제의 경우 '정기결제
							정지'를 활용하여 다음달 부터 정기결제를 해지할 수 있습니다</span> <br>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>