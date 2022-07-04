package com.bcc.persistence;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestParam;

import com.bcc.domain.roomDate;
import com.bcc.domain.roomSearch;

public interface roomDAO {

	public JSONArray roomDAO();

	public JSONArray roomDAO(roomSearch rs);
	
	public JSONArray roomDetailDAO(String bno);
	
	public JSONArray roomDetailDAO2(String bno);//상세정보 (서비스)

	public JSONArray roomDetailDAO3(String bno);//상세정보 ( 주의사항)

	public JSONArray roomDetailDAO4(String bno);//상세정보 (주변안내)

	public JSONArray roomDetailDAO5(String bno);// 상세정보 (상세정보)

	public JSONArray roomPriceDAO(String bno);

	public JSONArray roomReserveDAO(String bno,roomDate rd,String ano);
}
