package kr.pb.bts.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;
import kr.pb.bts.domain.Member;
import kr.pb.bts.domain.Page;

public interface MemberService {
	// 회원관련
	int memberJoinProc(Member member); // 회원가입
	int idCheck(String mId); // 아작스 중복확인
	void memberLoginProc(Member member, HttpSession session); // 로그인
	void memberLogout(HttpSession session); // 로그아웃
	
	Member myPage(int mNo);  // 마이페이지 보기
	int updateMyPage(Member member, HttpSession session); // 마이페이지 수정
	int myPw(Member member, HttpSession session); // 비밀번호 일치확인
	void myPwProc(Member member, HttpSession session); // 비밀번호 수정
	
	List<HashMap<String, Object>> myOrder(Page page); // 내 주문목록 보기
	List<HashMap<String, Object>> buyList(Page page); // 내 구매목록 보기
	void buyConfirm(int boNo); // 구매확정하기
	void buyCancel(int boNo); // 구매취소하기
	
	// 관리자관련
	List<HashMap<String, Object>> memberList(Page page); // 회원리스트 보기
	Member memberDetail(int userNo); // 회원 상세정보 보기
	int memberUpdate(Member member); // 회원 정보 수정하기
	List<HashMap<String, Object>> orderList(Page page); // 전체 주문 목록보기
	
	// 아이디 비밀번호 찾기
	Member findIdProc(Member member);
	Member findPwProc(Member member);
}
