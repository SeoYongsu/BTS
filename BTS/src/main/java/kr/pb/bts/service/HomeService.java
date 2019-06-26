package kr.pb.bts.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface HomeService {
	
	List<Map<String, Object>> getBest4();
	
	List<Map<String, Object>> getChoice3();

	List<Map<String, Object>> getRecommendList(int mNo);
	
	//아래 용수 작업
	//실시간
	List<Map<String, Object>> getRealtime();
	//주간 판매순위
	List<Map<String, Object>> getWeekly5();
	//일간 판매순위
	List<Map<String, Object>> getDay5();
	
	List<Map<String, Object>> getSilgum();

}
