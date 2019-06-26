package kr.pb.bts.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface HomeMapper {
	
	// 상단 슬라이드 3
	List<Map<String, Object>> getChoice3();
	
	// 중단 카드형 4
	List<Map<String, Object>> getBest4();
	
	// 유저별 추천리스트 4
	List<Map<String, Object>> getRecommendList(int mNo);
	
	// 유저이름
	String getUserName(int mNo);
	
	//아래부터 용수 작업

	//실시간 클릭!!
	List<Map<String, Object>> getRealtime();
	
	//주간 베스트 5
	List<Map<String, Object>> getWeekly5();
	
	//일간 베스트(오늘의책)
	List<Map<String, Object>> getDay5();
	
	List<Map<String, Object>> getSilgum();
	
}
