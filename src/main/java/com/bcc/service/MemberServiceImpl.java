package com.bcc.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.bcc.domain.BoardVO;
import com.bcc.domain.MemberVO;
import com.bcc.domain.SearchCriteria;
import com.bcc.persistence.BoardDAO;
import com.bcc.persistence.MemberDAO;

// @Service : 해당 객체가 서비스동작을 수행하는 객체다. 라는 의미 
@Service
public class MemberServiceImpl implements MemberService{

	private static final Logger log = LoggerFactory.getLogger(MemberServiceImpl.class);
	// DAO 객체 필요
	
	@Inject
	private MemberDAO dao;
	
	@Inject
	private BoardDAO bdao;

	@Override
	public void memberInsert(MemberVO vo) {
		log.info(" 컨트롤러 호출 ");
		log.info(" memberInsert(vo) 호출 ");
		
		// 1-10 랜덤 프로필
		int profile = (int) (Math.random()*(10)) + 1;
		vo.setProfile("/resources/img/profile/profile"+profile+".png");
		System.out.println(vo);
		dao.putInsertMember(vo);
		
		log.info(" DAO 처리 완료 -> 컨트롤러 이동");
		
	}

	@Override
	public MemberVO loginCheck(MemberVO vo) {
		log.info("loginCheck(vo) 호출 ");
		// DAO객체 메서드 호출
		MemberVO loginResultVO = dao.getLogin(vo);		
		
		log.info(loginResultVO+"");
		
		return loginResultVO;
	}

	@Override
	public MemberVO getMember(String id) {

		log.info("getMember(id) 호출");
		
		MemberVO vo = dao.getMember(id);
		
		return vo;
	}

	@Override
	public Integer updateMember(MemberVO vo) {
		log.info("updateMember(vo)");
		
		 int resultCnt = dao.modMember(vo);		
		
		return resultCnt;
	}

	@Override
	public void deleteMember(MemberVO vo) {
		log.info(" deleteMember(vo) 호출 ");
		
		dao.delMember(vo);
	}
	
	@Override
	public int delCheck(MemberVO vo) {
		
		int cnt = dao.delCheck(vo); 
		
		return cnt;
	}

	@Override
	public void storageMember(MemberVO vo) {
		
		dao.putStorageMember(vo);
		
	}

	@Override
	public List<MemberVO> getMemberList(String id) {
		log.info("getMemberList(String id) 호출");
		
		return dao.getMemberList(id);
	}

	@Override
	public int idCheck(String id) {
	       
		int cnt = dao.getIdCheck(id);	 
		
		return cnt;
	}

	@Override
	public int telCheck(String tel) {
		
		int cnt = dao.getTelCheck(tel); 
		
		return cnt;
	}
	
	@Override
	public int emailCheck(String email) {

		int cnt = dao.getEmailCheck(email); 
		
		return cnt;
	}

	@Override
	public int getLicense(String license) {
		
		int liCnt = dao.getLicense(license);
		
		return liCnt;
	}

	@Override
	public void liUp(String id) {
		try {
			dao.modLicenseUp(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void liDown(String id) {
		try {
			dao.modLicenseDown(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<BoardVO> getThumbList(SearchCriteria scri) throws Exception {
		
		return dao.getThumbList(scri);
	}
	
	@Override
	public void deleteThumb(int b_num, String id) throws Exception {
		
		dao.delThumb(b_num, id);
	}

	@Override
	public Integer getThumbCount(String id) {
	
		return dao.getThumbCount(id);
	}

}
