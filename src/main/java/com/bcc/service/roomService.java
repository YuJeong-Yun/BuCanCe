package com.bcc.service;

import java.io.IOException;
import java.net.MalformedURLException;
import java.text.ParseException;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.bcc.domain.roomDate;
import com.bcc.domain.roomPayVO;
import com.bcc.domain.roomReVO;
import com.bcc.domain.roomRefundVO;
import com.bcc.domain.roomSearch;

public interface roomService {

	//숙소목록 페이지
	public JSONArray getRoomList();
	
	//숙소목록페이지에서 검색한 정보만 불러오게함
	public JSONArray getRoomSearchList(roomSearch rs);
	
	//roomDetail0~5까지 방상세정보를 불러오는 동작
	public JSONArray getRoomDetail0(String bno);
	public JSONArray getRoomDetail(String bno);
	public JSONArray getRoomDetail2(String bno);
	public JSONArray getRoomDetail3(String bno);
	public JSONArray getRoomDetail4(String bno);
	public JSONArray getRoomDetail5(String bno);
	
	//숙소상세가격
	public JSONArray getRoomPrice(String bno);

	//숙소예약
	public JSONArray reserveRoom(String bno, roomDate rd,String ano) throws ParseException;

	//결제 성공시 db에 입력
	public void insertRoomPay(roomPayVO vo);

	//결제 후 내역페이지
	public roomPayVO getRoomPayInfo(String accId);

	//유저예약정보
	public List<roomPayVO> getRoomUserPayInfo(String userId);

	// (주문번호설정)
	public String SearchPayId();

	//환불시 결제 상태 변경
	public void modPayStatus(String accId);

	//환불시 환불테이블에 데이터입력
	public void putRoomRefund(roomRefundVO vo2);

	////환불테이블 고유아이디값
	public String refundRoom();

	////환불 아임포트동작
	public String payRefund(roomPayVO vo2) throws MalformedURLException, IOException, org.json.simple.parser.ParseException;

	//숙소예약정보들 (관리자)
	public List<roomPayVO> getReseAdmin();
	
	
	
	
}
