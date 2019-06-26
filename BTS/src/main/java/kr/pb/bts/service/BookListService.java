package kr.pb.bts.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import kr.pb.bts.domain.BookInfo;
import kr.pb.bts.domain.Page;



@Transactional
public interface BookListService {
	
	List<BookInfo> getBest100(Page page);
	
	List<BookInfo> getNew(Page page);
	
	
	List<BookInfo> getSearchList(Page page);
	
	List<BookInfo> getBookList(Page page);
	
	List<BookInfo> getBookBestList(BookInfo bi);
	
	//아래 용수 작업
	//주간 판매순위
	List<Map<String, Object>> getWeekly();
	//일간 판매순위
	List<Map<String, Object>> getDay();
	//월간 판매순위
	List<Map<String, Object>> getMonth();
	//실시간 Click
	List<Map<String, Object>> getRealTime();
	
	
}
