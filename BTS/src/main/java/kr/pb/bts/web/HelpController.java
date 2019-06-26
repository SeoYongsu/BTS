package kr.pb.bts.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.pb.bts.domain.Help;
import kr.pb.bts.domain.Notice;
import kr.pb.bts.domain.Page;
import kr.pb.bts.mapper.HelpMapper;
import kr.pb.bts.service.HelpService;
import kr.pb.bts.service.NoticeService;

@Controller
@RequestMapping("/help")
public class HelpController {

	@Autowired HelpService helpService;
	@Autowired NoticeService noticeService;
	@Autowired HelpMapper helpMapper;
	
	private static final Logger logger = LoggerFactory.getLogger(HelpController.class);
	
	@RequestMapping(value="/center")
	public String helpCenter(HttpSession session, Model model) {		
		
		logger.info("센터");
		
		List<Notice> notice = noticeService.getNoticeList2();
		model.addAttribute("notice", notice);
		
		Integer mNo = (Integer)session.getAttribute("mNo");
		if(mNo == null) {
			return  "/web/help/center.web";
		}else{
			List<Help> list = helpService.myInquiry(mNo);
			model.addAttribute("list", list);
			return "/web/help/center.web";
		}
		
	}
	
	
	@RequestMapping(value="/inquiry", method = RequestMethod.POST)
	public String helpInquiry(HttpSession session, Help help, Model model) {
		
		Integer mNo = (Integer)session.getAttribute("mNo");
		help.setMmUser(mNo);
		helpService.insertInquiry(help);

		return "redirect:/help/center.web";
	}
	
	
	@RequestMapping(value="/answer")
	public String answerPage(Help help, Model model) {
		
		logger.info("답변");
		
		Page page = new Page();
		int temp;
		
		page.setCategory(help.getCategory());
		page.setSearchValue(help.getSearchValue());
		
		if(help.getNowPage() == "" || help.getNowPage() == null || help.getNowPage() == "1") {
			page.setNowPage(1);
			temp = page.getNowPage();
		}else {
			page.setNowPage(Integer.parseInt(help.getNowPage()));
			temp = page.getNowPage();	
		}
		
		page.setTotalCnt(helpMapper.getTotalCnt(page));
		List<Help> list = helpService.getInquiryList(page);
		
		if(list != null) {
			model.addAttribute("list", list);
		}
		
		page.setNowPage(temp);
		model.addAttribute("page", page);

		return "/web/help/answer.web";
	}
	
	@RequestMapping(value="answerSubmit",  method = RequestMethod.POST )
	@ResponseBody
	public void bookManageModi(Help help) {
		helpService.insertAnswer(help);
	} 
	
}
