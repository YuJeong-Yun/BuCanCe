package com.bcc.service;

import com.bcc.domain.PremiumOrderVO;

public interface PreOrderService {
	// 정기결제
	public void insertOrder(PremiumOrderVO pvo);

	// 재결제(정기결제)
	public void ReOrder(PremiumOrderVO rvo);

	// 빌링키 가져오기
	public String getKey(String id);

	// 결제 정지(빌링키 삭제)
	public void deleteKey(PremiumOrderVO dvo);
}
