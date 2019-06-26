package kr.pb.bts.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import kr.pb.bts.domain.BookManage;
import kr.pb.bts.domain.Page;

@Transactional
public interface BookManageService {

	List<BookManage> getBookManageList(Page page);
	
	void updateBookManage(BookManage bm);
	
}
