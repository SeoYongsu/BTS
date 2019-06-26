package kr.pb.bts.mapper;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import kr.pb.bts.domain.Member;
import kr.pb.bts.domain.Page;

@Repository
public interface MemberMapper {
	// 회원
	int memberJoinProc(Member member); // 회원가입 처리
	int idCheck(String mId);
	
	HashMap<String, Object> memberLoginProc(HashMap<String, Object> map); // 로그인 처리
	Member myPage(Member member); // 개인정보 보기
	int updateMyPage(Member member); // 개인정보 수정 처리
	Member myPw(Member member); // 비밀번호 일치확인
	void myPwProc(Member member); // 비밀번호 수정 처리
	List<HashMap<String, Object>> myOrder(Page page); // 내 주문 보기 
	void buyConfirm(int boNo); // 구매확정하기
	void buyCancel(int boNo); // 구매확정하기
	List<HashMap<String, Object>> buyList(Page page); // 내 구매확정 보기
	
	// 관리자
	List<HashMap<String, Object>> memberList(Page page); // 회원목록보기 
	Member memberDetail(int userNo); // 회원상세정보 보기
	int memberUpdate(Member member); // 회원정보 수정하기
	List<HashMap<String, Object>> orderList(Page page); // 모든 주문목록보기
	
	// 페이징
	int getMemberTotalCnt(Page page);
	int getOrderTotalCnt(Page page);
	int getBuyListTotalCnt(Page page);
	int getMyOrderTotalCnt(Page page);
	
	// 아이디 비밀번호 찾기
	Member findIdProc(Member member);
	Member findPwProc(Member member);
}
