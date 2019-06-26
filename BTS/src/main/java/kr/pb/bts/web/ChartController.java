package kr.pb.bts.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.pb.bts.domain.Chart;
import kr.pb.bts.service.ChartService;


@Controller
@RequestMapping(value="/chart")
public class ChartController {
	
	private static final Logger logger = LoggerFactory.getLogger(ChartController.class);
	
	@Autowired ChartService chartService;
	
	
	//빅데이터 시각화 폼
	@RequestMapping(value="/chartForm")
	public String weekChart() {
		logger.debug("chartcheck");
		return "/web/chart/chartForm.web";
	}
		
	
	//주간매출
	@RequestMapping(value="/weekChart", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> weekChart(Chart chartVo) throws Exception{
		logger.debug("chartcheck");
	
		
		List<Chart> firstWeek = chartService.firstWeek(chartVo);
		List<Chart> secoundWeek = chartService.secoundWeek(chartVo);
		
		Map<String, Object> retVal = new HashMap<String, Object>();

		 if(firstWeek.size()==0) { System.out.println("데이터강벗다"); }
	
	
		 retVal.put("a",firstWeek);
		 retVal.put("b",secoundWeek);

	
		return retVal;
	}
	
	//나이통계
	@RequestMapping(value="/ageChart")
	@ResponseBody
	public List<Chart> ageChart() throws Exception{
		List<Chart>  ageChart= chartService.ageChart();
		
		if(ageChart.size()==0) {System.out.println("데이터체크");}
		
		return ageChart;
	}
	
	//장르별판매량
	@RequestMapping(value="/genreChart")
	@ResponseBody
	public List<Chart> genreChart() throws Exception{
		List<Chart>  genreChart=chartService.genreChart();
		
		if(genreChart.size()==0) {System.out.println("데이터체크");}
		
		return genreChart;
	}
	
	//지역별회원통계
	@RequestMapping(value="/liveChart")
	@ResponseBody
	public List<Chart> liveChart() throws Exception{
		List<Chart>  genreChart=chartService.liveChart();
		
		if(genreChart.size()==0) {System.out.println("데이터체크");}
		
		return genreChart;
	}
	
	
}
