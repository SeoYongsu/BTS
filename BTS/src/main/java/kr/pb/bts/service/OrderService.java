package kr.pb.bts.service;


import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import kr.pb.bts.domain.BookOrder;

// 서비스(인터페이스)에는 트랜젝션 어노테이션 선언해둠
// 이 트랜잭션은 해당 서비스를 구현한 내용안에서 여러 로직이 수행되는 도중
// 중간에서 실패할 시 최초시작시점으로 되돌려줌(오류방지용도)
@Transactional
public interface OrderService {
	//조회수 증가
	void updateHit(BookOrder vo);
	
	//책 상세보기
	BookOrder getDetail(BookOrder vo);
	
	//구매자 정보 가져오기
	BookOrder getUserInfo(BookOrder vo);
	
	//구매처리 DB
	void insertOrder(BookOrder vo);
	
	//재고처리 DB
	void updateManage(BookOrder vo);
	
	//오늘 구매내역 가져오기
	List<BookOrder> getOrder(BookOrder vo);
	
	//구매 확정
	void fixOrder(BookOrder vo);

	//구매 취소
	void cancelOrder(BookOrder vo);
	
	//리뷰 작성DB처리
	void insertReview(BookOrder vo);
	
	//리뷰목록 가져오기
	List<BookOrder> getReview(BookOrder vo);
	
	//구매여부 확인
	int getBuyFact(BookOrder vo);
	
	//리뷰작성여부 확인
	int getReviewFact(BookOrder vo);
	
	//리뷰 삭제 DB처리
	void deleteReview(BookOrder vo);
	
	//수정할 리뷰 정보 가져오기
	BookOrder changeReview(BookOrder vo);
	
	//리뷰 수정 DB처리
	void changeReviewProc(BookOrder vo);
}
