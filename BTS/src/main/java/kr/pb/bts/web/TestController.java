package kr.pb.bts.web;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.pb.bts.domain.BookInfo;
import kr.pb.bts.domain.Test;
import kr.pb.bts.service.TestService;

@Controller
@RequestMapping(value="/test") 					// 기준폴더를 위쪽에 매핑해줌
public class TestController {
	
	@Autowired TestService testService;			// 이용할 서비스(인터페이스) 자동주입 해둠
	
		
	@RequestMapping(value="/list")				// 하위폴더를 아래쪽에 매핑해줌
	public String testList(Model model) {
		
		List<HashMap<String, Object>> list = testService.getList();
		model.addAttribute("list", list);
		
		return "/web/test/list.web";
	}
	
	
	// 만약 로그인, 결제정보등 GET이 아닌 POST로만 요청되면 처리해야할 것들은 아래처럼 method 안에 어떤방식으로 올떄만 처리해줄지 선언해두셈
	@RequestMapping(value="/dbList", method = RequestMethod.POST)
	public String testDbList(Test test, Model model) {
		List<Test> list = testService.getDbList(test);
		model.addAttribute("list", list);
		return "/web/test/dbList.web";
	}
	
	
	@RequestMapping(value="/bookList", method = RequestMethod.POST)
	public String testBookList(BookInfo bi, Model model) {
		List<BookInfo> list = testService.getBookList(bi);
		model.addAttribute("list", list);
		return "/web/test/bookList.web";
	}
	
	
	@RequestMapping(value="/listUpdate")
	public String listUpdate() {
		testService.updateBM();
		return "/web/test/bookList.web";
	}
	
	@RequestMapping(value="/boUpdate")
	public String boUpdate() {
		testService.updateBO();
		return "/web/test/bookList.web";
	}
	
}
