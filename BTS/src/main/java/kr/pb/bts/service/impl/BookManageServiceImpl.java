package kr.pb.bts.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.pb.bts.domain.BookManage;
import kr.pb.bts.domain.Page;
import kr.pb.bts.mapper.BookManageMapper;
import kr.pb.bts.service.BookManageService;

@Service
public class BookManageServiceImpl implements BookManageService {

	@Autowired BookManageMapper bookManageMapper;
	
	@Override
	public List<BookManage> getBookManageList(Page page) {
		
		int nowPage = page.getNowPage();
		
		if(nowPage == 1) {
			page.setNowPage(0);
		}else {
			page.setNowPage(nowPage*10-10);
		}
		
		return bookManageMapper.getBookManageList(page);
	}

	@Override
	public void updateBookManage(BookManage bm) {
		bookManageMapper.updateBookManage(bm); 
	}


}
