package kr.pb.bts.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.pb.bts.mapper.HomeMapper;
import kr.pb.bts.service.HomeService;

@Service
public class HomeServiceImpl implements HomeService {

	@Autowired HomeMapper homeMapper;
		
	@Override
	public List<Map<String, Object>> getChoice3() {
		return homeMapper.getChoice3();
	}
	
	@Override
	public List<Map<String, Object>> getBest4() {
		return homeMapper.getBest4();
	}

	@Override
	public List<Map<String, Object>> getRecommendList(int mNo) {
		return homeMapper.getRecommendList(mNo);
	}

	//아래부터 용수 작업
	@Override
	public List<Map<String, Object>> getWeekly5() {
		return homeMapper.getWeekly5();
	}

	@Override
	public List<Map<String, Object>> getDay5() {
		return homeMapper.getDay5();
	}

	@Override
	public List<Map<String, Object>> getRealtime() {
		return homeMapper.getRealtime();
	}

	@Override
	public List<Map<String, Object>> getSilgum() {
		return homeMapper.getSilgum();
	}


}
