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

import kr.pb.bts.domain.Notice;
import kr.pb.bts.domain.Page;
import kr.pb.bts.mapper.NoticeMapper;
import kr.pb.bts.service.NoticeService;


@Controller
@RequestMapping(value="/notice")
public class NoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	@Autowired NoticeService noticeService;
	@Autowired NoticeMapper noticeMapper;
	
	@RequestMapping(value="/list")
	public String noticeList(Notice notice, Model model) {		
		
		logger.info("공지사항");
		Page page = new Page();
		int temp;
		
		page.setCategory(notice.getCategory());
		page.setSearchValue(notice.getSearchValue());
		
		if(notice.getNowPage() == "" || notice.getNowPage() == null || notice.getNowPage() == "1") {
			page.setNowPage(1);
			temp = page.getNowPage();
		}else {
			page.setNowPage(Integer.parseInt(notice.getNowPage()));
			temp = page.getNowPage();	
		}
		
		page.setTotalCnt(noticeMapper.getTotalCnt(page));
		List<Notice> list = noticeService.getNoticeList(page);
		
		page.setNowPage(temp);
		model.addAttribute("page", page);
		model.addAttribute("list", list);
		return "/web/notice/list.web";
	}
	
	@RequestMapping(value="/detail")
	public String noticeDetail(Notice notice, Model model) {
		logger.info("공지- 디테일");
		Notice detail = noticeService.detailNotice(notice);
		model.addAttribute("detail", detail);
		return "/web/notice/detail.web";
	}
	
	@RequestMapping(value="/modify")
	public String noticeModifyDetail(Notice notice, Model model) {
		logger.info("공지- 수정 디테일");
		Notice detail = noticeService.detailNotice(notice);
		model.addAttribute("detail", detail);
		return "/web/notice/modify.web";
	}
	
	
	@RequestMapping(value="/update", method = RequestMethod.POST)
	@ResponseBody
	public String noticeUpdate(Notice notice, Model model) {
		logger.info("공지- 수정완료");
		noticeService.updateNotice(notice);
		return "redirect:/notice/modify.web";
	}
	
	
	@RequestMapping(value="/delete")
	public String noticeDelete(Notice notice, Model model) {
		logger.info("공지- 삭제");
		noticeMapper.deleteNotice(notice);
		return "redirect:/notice/list.web";
	}
	
	@RequestMapping(value="/write")
	public String noticeWriteFrm() {
		return "/web/notice/write.web";
	}
	
	@RequestMapping(value="/writeProc")
	public String noticeWriteProc(Notice notice) {	
		
		String title = notice.getnTitle();
		String body = notice.getnBody();
		
		System.out.println(title+"::::"+body);
		
		noticeMapper.insertNotice(notice);
		return "redirect:/notice/list.web";
	}
	
	
	
}
