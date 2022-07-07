package com.bcc.persistence;

import java.util.List;

import com.bcc.domain.PremiumOrderVO;

public interface AdminDAO {
	
	public List<PremiumOrderVO> getPmInfo(String date);
	
	public List<String> getPm(String date);
	
	public List<PremiumOrderVO> getOnlyPeriod(String date);
	
}
