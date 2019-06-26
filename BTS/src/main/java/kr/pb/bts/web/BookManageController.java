package kr.pb.bts.web;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.pb.bts.domain.BookManage;
import kr.pb.bts.domain.Page;
import kr.pb.bts.mapper.BookManageMapper;
import kr.pb.bts.service.BookManageService;

@Controller
@RequestMapping("/manage")
public class BookManageController {
	
	private static final Logger logger = LoggerFactory.getLogger(BookManageController.class);
	
	@Autowired BookManageService bookManageService;
	@Autowired BookManageMapper bookManageMapper;
	
	@RequestMapping(value="/book", method = RequestMethod.GET)
	public String bookManage(BookManage bm, Model model) {
		logger.info("bookManage Page");
		
		Page page = new Page();
		int temp;
		
		page.setCategory(bm.getCategory());
		page.setSearchValue(bm.getSearchValue());

		if(bm.getNowPage() == "" || bm.getNowPage() == null || bm.getNowPage() == "1") {
			page.setNowPage(1);
			temp = page.getNowPage();
		}else {
			page.setNowPage(Integer.parseInt(bm.getNowPage()));
			temp = page.getNowPage();	
		}
		
		page.setTotalCnt(bookManageMapper.getTotalCnt(page));
		List<BookManage> list = bookManageService.getBookManageList(page); 
		
		page.setNowPage(temp);
		model.addAttribute("page", page);
		model.addAttribute("list", list);
		return "/web/manage/book.web";
	}
	
	
	@RequestMapping(value="/modiBook", method = RequestMethod.POST )
	@ResponseBody
	public void bookManageModi(BookManage bm) {
		bookManageService.updateBookManage(bm);
	}
	
	
}
