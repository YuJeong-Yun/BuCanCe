package com.bcc.persistence;

import java.util.List;

import com.bcc.domain.roomPayVO;
import com.bcc.domain.roomRefundVO;

public interface roomDAO {

	public void putPaymentRoom(roomPayVO vo);

	public roomPayVO getReInfo(String accId);

	public List<roomPayVO> getRoomReInfo(String userId);

	public String getMaxReRoom();

	public void modReStatus(String accId);

	public String getMaxRefund();
	
	public void putRfRoom(roomRefundVO vo2);




}
