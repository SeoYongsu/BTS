package kr.pb.bts.web;


import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;




import kr.pb.bts.domain.BookInfo;
import kr.pb.bts.domain.Page;
import kr.pb.bts.mapper.BookListMapper;
import kr.pb.bts.service.BookListService;
import kr.pb.bts.service.impl.TestServiceImpl;


@Controller
@RequestMapping(value = "/BookList")
public class BookListController {
	
	private static final Logger logger = LoggerFactory.getLogger(TestServiceImpl.class);
	
	@Autowired BookListService bookListService;
	@Autowired BookListMapper bookListMapper;
	
	//검색별 컨트롤러
	@RequestMapping(value="/searchList", method = RequestMethod.GET)
	public String SerchList(Page page, Model model) {
		logger.info("컨트롤러  == 검색");
		
		int totalCnt = bookListMapper.getSearchCnt(page);
		int nowPage = page.getNowPage();
		String searchValue = page.getSearchValue();

		List<BookInfo> list = bookListService.getSearchList(page);
		
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("list", list);
		return "/web/bookList/bookList.web";
		
	}
	
	//장르별 컨트롤러
	@RequestMapping(value="/bookList")
	public String BookList(Page page, Model model) {
		logger.info("컨트롤러 == 장르");
		
		int totalCnt = bookListMapper.getTotalCnt(page);
		int nowPage = page.getNowPage();
		String biGenre = page.getBiGenre();

		List<BookInfo> list = bookListService.getBookList(page);
		
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("biGenre", biGenre);
		model.addAttribute("list", list);

		return "/web/bookList/bookList.web";
	}
	
	//BEST 컨트롤러
	@RequestMapping(value="best100")
	public String BookBestList(Page page, Model model) {
		logger.info("베스트,뉴,hot");
		
		List<Map<String, Object>> month = bookListService.getMonth();		//월간
		List<Map<String, Object>> weekly = bookListService.getWeekly();		//주간
		List<Map<String, Object>> day = bookListService.getDay();			//일간
		List<Map<String, Object>> realTime = bookListService.getRealTime(); // 실시간
		
		model.addAttribute("month", month);		//월간
		model.addAttribute("weekly", weekly);  	//주간
		model.addAttribute("day", day);			//일간
		model.addAttribute("realTime", realTime);
		return "/web/bookList/bookBestList.web";
		
	}
	
	//newBook 컨트롤러
	@RequestMapping(value="newBook")
	public String NewBook(Page page, Model model) {
		int totalCnt = bookListMapper.getNewCnt(page);
		int nowPage = page.getNowPage();

		List<BookInfo> list = bookListService.getNew(page);

		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("list", list);
		
		return "/web/bookList/bookNewList.web";
	}

	@RequestMapping(value="/userBest")
	public String BookBestList(BookInfo bi, Model model) {
		List<BookInfo> list = bookListService.getBookBestList(bi);
		model.addAttribute("list",list);
		return "/web/bookList/bookList.web";
	}
	

}

