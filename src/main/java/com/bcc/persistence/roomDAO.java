package com.bcc.persistence;

import java.util.List;

import com.bcc.domain.roomPayVO;
import com.bcc.domain.roomRefundVO;

public interface roomDAO {

	public void roomPaySuc(roomPayVO vo);

	public roomPayVO roomPayInfo(String accId);

	public List<roomPayVO> roomUserPayInfo(String userId);

	public String roomSearchPay();

	public void payStatus(String accId);

	public String roomSearchRefund();
	
	public void inRoomRefund(roomRefundVO vo2);



}
