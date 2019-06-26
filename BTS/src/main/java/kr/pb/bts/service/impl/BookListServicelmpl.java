package kr.pb.bts.service.impl;


import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.pb.bts.domain.BookInfo;
import kr.pb.bts.domain.Page;
import kr.pb.bts.mapper.BookListMapper;
import kr.pb.bts.service.BookListService;

@Service
public class BookListServicelmpl implements BookListService {

	private static final Logger logger = LoggerFactory.getLogger(TestServiceImpl.class);
	
	@Autowired BookListMapper bookListMapper;
		

	@Override
	public List<BookInfo> getSearchList(Page page) {
		logger.info("리스트처리 서비스 == 검색");
		
		int nowPage = page.getNowPage();
		if(nowPage == 1) {
			page.setNowPage(0);
		}else {
			page.setNowPage(nowPage*10-10);
		}
		
		
		return bookListMapper.getSearchList(page);
	}
	
	
	
	@Override
	public List<BookInfo> getBookList(Page page) {
		logger.info("리스트처리 서비스 == 장르");
		
		int nowPage = page.getNowPage();
		if(nowPage == 1) {
			page.setNowPage(0);
		}else {
			page.setNowPage(nowPage*10-10);
		}
		
		return bookListMapper.getBookList(page) ;
		
	}
	
	
	@Override
	public List<BookInfo> getBest100(Page page) {
		logger.info("BNH");
		
		int nowPage = page.getNowPage();
		if(nowPage == 1) {
			page.setNowPage(0);
		}else {
			page.setNowPage(nowPage*10-10);
		}
		
		return bookListMapper.getBest100(page);
	}
	
	@Override
	public List<BookInfo> getNew(Page page) {
		int nowPage = page.getNowPage();
		
		if(nowPage == 1) {
			page.setNowPage(0);
		}else {
			page.setNowPage(nowPage*10-10);
		}

		
		return bookListMapper.getNew(page);
	}
	
	
	@Override
	public List<BookInfo> getBookBestList(BookInfo bi) {
		logger.info("유저별 동향 파악 리스트 꾸리기~~");
		return bookListMapper.getBookBestList(bi);
	}



	@Override
	public List<Map<String, Object>> getWeekly() {
		return bookListMapper.getWeekly();
	}

	@Override
	public List<Map<String, Object>> getDay() {
		return bookListMapper.getDay();
	}



	@Override
	public List<Map<String, Object>> getMonth() {
		return bookListMapper.getMonth();
	}



	@Override
	public List<Map<String, Object>> getRealTime() {
		return bookListMapper.getRealTime();
	}







}
