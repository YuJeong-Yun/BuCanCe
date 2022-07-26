package com.bcc.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.bcc.domain.PreMemberVO;
import com.bcc.persistence.PreMemberDAO;

@Service
public class PreMemberServiceImpl implements PreMemberService {

	private static final Logger log = LoggerFactory.getLogger(PreMemberServiceImpl.class);

	// DAO 객체 주입
	@Inject
	private PreMemberDAO dao;

	// 프리미엄 멤버
		@Override
		public void putPreMember(PreMemberVO vo) {
			
//			System.out.println(" service.putPreMember 호출");
			
			dao.putPreMember(vo);
			
		}


		// 회원 삭제

		@Override
		public void delPreMember(PreMemberVO dpv) {
//			log.info(" service.delPreMember 호출");

			dao.delPreMember(dpv);

		}

		// 이름 가져오기
		@Override
		public String getName(String id) {
//			log.info(" service.getName 호출");

			return dao.getName(id);
		}

		// 전화 가져오기
		@Override
		public String getTel(String id) {
//			log.info(" service.getTel 호출");
			
			return dao.getTel(id);
		}

		// 메일 가져오기
		@Override
		public String getEmail(String id) {
//			log.info(" service.getEmail 호출");
			
			return dao.getEmail(id);
		}


		// 재결제 프리미엄 회원 
		@Override
		public void putRePreMember(PreMemberVO vo) {
//			log.info(" service.putRePreMember 호출");

			dao.putRePreMember(vo);
			
		}


		// 프리미엄 회원 id 가져오기
		@Override
		public String getid(PreMemberVO vo) {
//			log.info(" service.getid 호출");

			return dao.getid(vo);
		}
		
}
