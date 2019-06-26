package kr.pb.bts.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.pb.bts.domain.Chart;
import kr.pb.bts.mapper.ChartMapper;
import kr.pb.bts.service.ChartService;


@Service
public class ChartServiceImpl implements ChartService{

	@Autowired ChartMapper chartMapper;
	
	private static final Logger logger = LoggerFactory.getLogger(ChartServiceImpl.class);
	
	
	@Override
	public List<Chart> firstWeek(Chart chartVo) throws Exception{
		logger.debug("service");
		
		return chartMapper.firstWeek(chartVo);

	}
	@Override
	public List<Chart> secoundWeek(Chart chartVoa) throws Exception{
		logger.debug("service");
		return chartMapper.secoundWeek(chartVoa);
		
	}
	
	@Override
	public List<Chart> ageChart() throws Exception {
		logger.debug("service");
		return chartMapper.ageChart();
	}
	
	@Override
	public List<Chart> genreChart() throws Exception {
		logger.debug("service");
		return chartMapper.genreChart();
	}
	@Override
	public List<Chart> liveChart() throws Exception {
		logger.debug("service");
		return chartMapper.liveChart();
	}

}
