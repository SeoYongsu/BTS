package kr.pb.bts.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.pb.bts.domain.BookManage;
import kr.pb.bts.domain.Page;

@Repository
public interface BookManageMapper {

	int getTotalCnt(Page page);
	
	List<BookManage> getBookManageList(Page page);
	
	void updateBookManage(BookManage bm);
}
