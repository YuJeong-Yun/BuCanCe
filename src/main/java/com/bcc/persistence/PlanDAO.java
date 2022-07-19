package com.bcc.persistence;

import java.util.List;

import com.bcc.domain.BoardVO;
import com.bcc.domain.PlanVO;

public interface PlanDAO {
	// 플랜 생성
	public void createPlan(PlanVO vo);

	// 소속된 플랜 리스트 가져오기
	public List<PlanVO> getPlanList(String id);	
	
	// 전체 카테고리별 관광지 정보 가져오기
	public List<BoardVO> getTourList(int t_category);

	// 카테고리별 관광지 검색 결과
	public List<BoardVO> getTourSearch(BoardVO vo);

	// 카테고리별 관광지 하나 정보 가져오기
	public BoardVO getTourInfo(int num);
	
	// 여행 경로 수정
	public void modifyTourPlan(PlanVO vo);

	// 그룹의 여행 정보 가져오기
	public PlanVO getPlanInfo(int num);

	// 플랜 삭제
	public void delPlan(int num);

}
