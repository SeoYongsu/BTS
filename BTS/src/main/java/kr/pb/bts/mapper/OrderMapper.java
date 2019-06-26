package kr.pb.bts.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.pb.bts.domain.BookOrder;

// 매퍼 - ###SQL.xml 하고 연동될 인터페이스 선언시 레파지토리라고 선언해둬야함
// ###SQL.xml 의 위치는 - src/main/resource/mapper/*.xml	
@Repository
public interface OrderMapper {
	
	void updateHit(BookOrder vo);//조회수 증가

	BookOrder getDetail(BookOrder vo);//도서정보 가져오기
	
	BookOrder getUserInfo(BookOrder vo);//유저정보 가져오기
	
	void insertOrder(BookOrder vo);
	
	void updateManage(BookOrder vo);
	
	List<BookOrder> getOrder(BookOrder vo);
	
	void fixOrder(BookOrder vo);
	
	void cancelOrder(BookOrder vo);
	
	void insertReview(BookOrder vo);
	
	List<BookOrder> getReview(BookOrder vo);
	
	int getBuyFact(BookOrder vo);
	
	int getReviewFact(BookOrder vo);
	
	void deleteReview(BookOrder vo);
	
	BookOrder changeReview(BookOrder vo);
	
	void changeReviewProc(BookOrder vo);
}
