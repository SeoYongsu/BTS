package kr.pb.bts.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.pb.bts.mapper.HomeMapper;
import kr.pb.bts.service.HomeService;

@Controller
public class HomeController {
	
	@Autowired HomeService homeService;
	@Autowired HomeMapper homeMapper;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value= {"", "main"})
	public String home(Model model, HttpSession session) {
		
		logger.info("BTS _ 노예");
		
		List<Map<String, Object>> choice3 = homeService.getChoice3();
		List<Map<String, Object>> best4 = homeService.getBest4();
		List<Map<String, Object>> weekly5 = homeService.getWeekly5();	//용수작업
		List<Map<String, Object>> day5 = homeService.getDay5();			//용수작업	
		List<Map<String, Object>> realtime = homeService.getRealtime(); //용수작업 - 실시간
		List<Map<String, Object>> silgum = homeService.getSilgum();
		
		
		Integer mNo = (Integer)session.getAttribute("mNo");
		
		if(mNo != null) {
			List<Map<String, Object>> recomend = homeService.getRecommendList(mNo);
			model.addAttribute("recomend", recomend);
			model.addAttribute("mName", homeMapper.getUserName(mNo));
		}
		
		
		model.addAttribute("choice3", choice3);
		model.addAttribute("best4", best4);
		model.addAttribute("weekly5", weekly5);  	//용수작업
		model.addAttribute("day5", day5);			//용수작업
		model.addAttribute("realtime", realtime);	//용수작업
		model.addAttribute("silgum", silgum);
		return "/web/home.web";
		
	}


}
