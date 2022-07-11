package com.bcc.persistence;

import java.util.List;

import com.bcc.domain.roomPayVO;

public interface roomDAO {

	public void roomPaySuc(roomPayVO vo);

	public roomPayVO roomPayInfo(String accId);

	public List<roomPayVO> roomUserPayInfo(String userId);


}
