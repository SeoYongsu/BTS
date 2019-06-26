package kr.pb.bts.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.pb.bts.domain.BookInfo;
import kr.pb.bts.domain.Page;


@Repository
public interface BookListMapper {
	
	//Best100
	List<BookInfo> getBest100(Page page);
	
	//New Book
	int getNewCnt(Page page);
	List<BookInfo> getNew(Page page);
	
	
	//장르별 카운트
	int getTotalCnt(Page page);
	
	//장르별 리스트
	List<BookInfo> getBookList(Page page);
		
	//검색별 카운트
	int getSearchCnt(Page page);
	
	//검색별 리스트 출력 (정현)
	List<BookInfo> getSearchList(Page page);
	
	// 유저별 추천도서
	List<BookInfo> getBookBestList(BookInfo bi);
	
	//주간 베스트 5
	List<Map<String, Object>> getWeekly();
	
	//일간 베스트(오늘의책)
	List<Map<String, Object>> getDay();
	
	//월간 베스트
	List<Map<String, Object>> getMonth();
	
	//실시간
	List<Map<String, Object>> getRealTime();
}
