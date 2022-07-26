package com.bcc.persistence;

import java.util.List;

import com.bcc.domain.PreOrderVO;

public interface PreOrderDAO {

	// 결제
	public void putOrder(PreOrderVO pvo);

	// 재결제(정기결제)
	public void putReOrder(PreOrderVO rvo);

	// 빌링키 가져오기
	public String getKey(PreOrderVO vo);

	// 결제 정지(빌링키 삭제)
	public void delKey(PreOrderVO dvo);

}
