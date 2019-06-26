package kr.pb.bts.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import kr.pb.bts.domain.Chart;

@Transactional
public interface ChartService {

	 List<Chart> firstWeek(Chart chartVo) throws Exception;
	 List<Chart> secoundWeek(Chart chartVoa) throws Exception;
	 List<Chart> ageChart() throws Exception;
	 List<Chart> genreChart() throws Exception;
	 List<Chart> liveChart() throws Exception;
	
	
}
