package kr.pb.bts.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.pb.bts.domain.Chart;

@Repository
public interface ChartMapper {

	List<Chart> firstWeek(Chart chartVo);
	List<Chart> secoundWeek(Chart chartVoa);
	List<Chart> ageChart();
	List<Chart> genreChart();
	List<Chart> liveChart();
	
	
}
