package kr.pb.bts.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.pb.bts.domain.BookInfo;
import kr.pb.bts.domain.BookManage;
import kr.pb.bts.domain.BookOrder;
import kr.pb.bts.domain.Test;

// 매퍼 - ###SQL.xml 하고 연동될 인터페이스 선언시 레파지토리라고 선언해둬야함
// ###SQL.xml 의 위치는 - src/main/resource/mapper/*.xml
@Repository
public interface TestMapper {
	
	// getDbList를 예를 들면 testSQL.xml 에 있는 쿼리문의 id값과 일치시켜줘야함. 
	List<Test> getDbList(Test test);
	
	List<BookInfo> getBookList(BookInfo bi);
	
	int getBookCount();
	
	void updateBm(BookManage manage);
	
	int getBmCount(int bmNo);
	
	int getBiPrice(int biNo);
	
	void synchData(BookOrder order);
	
	String getAddr(int mNo);
	
}
