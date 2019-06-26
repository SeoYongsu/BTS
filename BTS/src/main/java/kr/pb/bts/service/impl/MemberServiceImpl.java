package kr.pb.bts.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.pb.bts.domain.Member;
import kr.pb.bts.domain.Page;
import kr.pb.bts.mapper.MemberMapper;
import kr.pb.bts.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	
@Autowired MemberMapper memberMapper;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	// 회원가입
	@Override
	public int memberJoinProc(Member member) {
		
		logger.info("memberJoinProc 함수 ");
		
		String mPhone = member.getmPhone1() + "-" + member.getmPhone2() + "-" + member.getmPhone3();
		String addr = member.getmAddr1()+"/"+member.getmAddr2()+"/"+member.getmAddr3();
		String strbirthdd = member.getmBirthdd();
		
		int birthdd = Integer.parseInt(strbirthdd);
		if (birthdd < 10) {
			strbirthdd = "0"+birthdd;
			member.setmBirthdd(strbirthdd);
		}
		
		String birth = member.getmBirthyy()+ member.getmBirthmm()+ member.getmBirthdd();
		member.setmAddr(addr);
		member.setmBirth(birth);
		member.setmPhone(mPhone);
		int result = memberMapper.memberJoinProc(member);
		return result;
	}
	
	@Override
	public int idCheck(String mId) {
		logger.info("idCheck 함수 ");
		
		int count = memberMapper.idCheck(mId);
		
		return count;
	}
	
	// 로그인
	@Override
	public void memberLoginProc(Member member, HttpSession session) {
		
		logger.info("memberLoginProc 함수 ");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mId", member.getmId());
		map.put("mPw", member.getmPw());
		
		HashMap<String, Object> result = memberMapper.memberLoginProc(map);
		
		if(result==null || result.size()==0) {
			// 회원이 아닐때 
		}
		else {
			//회원일때
			session.setAttribute("mNo", result.get("m_no")); 
			session.setAttribute("mGrade", result.get("m_grade")); 
			// 여기서 m_no, m_grade는 sql문의 select m_no, m_grade
		}
	}
	
	// 로그아웃
	@Override
	public void memberLogout(HttpSession session) {
//		session.invalidate();
		session.removeAttribute("mNo");
		session.removeAttribute("mGrade");
	}
	
	// 마이페이지
	@Override
	public Member myPage(int mNo) {
		
		logger.info("myPage 함수 ");
		
		Member member = new Member();
		member.setmNo(mNo);
		Member member2 = memberMapper.myPage(member);
		
		String[] addrarray = member2.getmAddr().split("/");
		member2.setmAddr1(addrarray[0]);
		member2.setmAddr2(addrarray[1]);
		member2.setmAddr3(addrarray[2]);
		
		String[] phonearray = member2.getmPhone().split("-");
		member2.setmPhone1(phonearray[0]);
		member2.setmPhone2(phonearray[1]);
		member2.setmPhone3(phonearray[2]);
		
		return member2;
	}
	
	// 마이페이지 수정
	@Override
	public int updateMyPage(Member member, HttpSession session) {
		
		logger.info("updateMyPage 함수 ");
		
		String use;
		if(member.getmUse().equals("N")) {
			use = "Y";
		}
		else {
			use = "N";
		}
		member.setmUse(use);
		
		String addr = member.getmAddr1()+"/"+member.getmAddr2()+"/"+member.getmAddr3();
		String phone = member.getmPhone1()+"-"+member.getmPhone2()+"-"+member.getmPhone3();
		Integer mNo = (Integer)session.getAttribute("mNo");
		member.setmPhone(phone);
		member.setmNo(mNo);
		member.setmAddr(addr);
		
		int result = memberMapper.updateMyPage(member);
		return result;
	}
	
	public int myPw(Member member, HttpSession session) {
		logger.info("myPw 함수 ");
		Integer mNo = (Integer)session.getAttribute("mNo");
		member.setmNo(mNo);
		Member member2 = memberMapper.myPw(member);
		
		int result;
		if (member2==null) {
			result = 0;
		}
		else {
			result = 1;
		}
		return result;
	}
	
	public void myPwProc(Member member, HttpSession session) {
		logger.info("myPwProc 함수 ");
		
		Integer mNo = (Integer)session.getAttribute("mNo");
		member.setmNo(mNo);
		memberMapper.myPwProc(member);
	}
	
	// 내주문보기
	@Override
	public List<HashMap<String, Object>> myOrder(Page page) {
		logger.info("myOrder 함수 ");
		
		int nowPage = page.getNowPage();
		
		if(nowPage == 1) {
			page.setNowPage(0);
		}else {
			page.setNowPage(nowPage*10-10);
		}
		
		List<HashMap<String, Object>> list = memberMapper.myOrder(page);
		
		return list;
	}
	
	// 구매확정
	@Override
	public void buyConfirm(int boNo) {
		logger.info("buyConfirm 함수 ");
		
		memberMapper.buyConfirm(boNo);
	}
	
	// 구매취소
	@Override
	public void buyCancel(int boNo) {
		logger.info("buyConfirm 함수 ");
		
		memberMapper.buyConfirm(boNo);
	}
	
	// 내 구매목록 보기
	@Override
	public List<HashMap<String, Object>> buyList(Page page) {
		logger.info("buyList 함수 ");
		
		int nowPage = page.getNowPage();
		
		if(nowPage == 1) {
			page.setNowPage(0);
		}else {
			page.setNowPage(nowPage*10-10);
		}
		
		List<HashMap<String, Object>> list = memberMapper.buyList(page);
		
		return list;
	}
	
	// ----------------------------------------------------------------------------------------------------------------
	// ----------------------------------------------------------------------------------------------------------------
	// ----------------------------------------------------------------------------------------------------------------
	// ----------------------------------------------------------------------------------------------------------------
	// ----------------------------------------------------------------------------------------------------------------
	
	// 회원리스트 보기 (관리자)
	@Override
	public List<HashMap<String, Object>> memberList(Page page) {
		logger.info("memberList 함수 ");
		
		int nowPage = page.getNowPage();
		
		if(nowPage == 1) {
			page.setNowPage(0);
		}else {
			page.setNowPage(nowPage*10-10);
		}
		
		List<HashMap<String, Object>> list = memberMapper.memberList(page);
		
		return list;
	} 
	
	// 회원 상세정보 보기 (관리자)
	@Override
	public Member memberDetail(int userNo) {
		logger.info("memberDetail 함수 ");
		
		Member member = memberMapper.memberDetail(userNo);
		
		String[] addrarray = member.getmAddr().split("/");
		member.setmAddr1(addrarray[0]);
		member.setmAddr2(addrarray[1]);
		member.setmAddr3(addrarray[2]);
		
		String[] birtharray = member.getmBirth().split("-");
		member.setmBirthyy(birtharray[0]);
		member.setmBirthmm(birtharray[1]);
		member.setmBirthdd(birtharray[2]);
		
		String[] phonearray = member.getmPhone().split("-");
		member.setmPhone1(phonearray[0]);
		member.setmPhone2(phonearray[1]);
		member.setmPhone3(phonearray[2]);
		
		return member;
	}
	
	// 회원정보 수정하기 (관리자)
	@Override
	public int memberUpdate(Member member) {
		
		logger.info("memberUpdate 함수 ");
		String mPhone = member.getmPhone1() + "-" + member.getmPhone2() + "-" + member.getmPhone3();
		String addr = member.getmAddr1()+"/"+member.getmAddr2()+"/"+member.getmAddr3();
		member.setmAddr(addr);
		member.setmPhone(mPhone);
		
		int result = memberMapper.updateMyPage(member);
		return result;
	}
	
	// 전체 주문리스트 보기 (관리자)
	@Override
	public List<HashMap<String, Object>> orderList(Page page) {
		logger.info("orderList 함수 ");
		
		int nowPage = page.getNowPage();
		
		if(nowPage == 1) {
			page.setNowPage(0);
		}else {
			page.setNowPage(nowPage*10-10);
		}
		
		List<HashMap<String, Object>> list = memberMapper.orderList(page);
		
		return list;
	}
	
	// ------------------------------------------------
	// 아이디찾기
	public Member findIdProc(Member member) {
		String phone = member.getmPhone1()+"-"+member.getmPhone2()+"-"+member.getmPhone3();
		member.setmPhone(phone);
		
		Member member2 = memberMapper.findIdProc(member);
		
		return member2;
	}
	// 비밀번호 찾기
	public Member findPwProc(Member member) {
		Member member2 = memberMapper.findPwProc(member);
		
		return member2;
	}
}
