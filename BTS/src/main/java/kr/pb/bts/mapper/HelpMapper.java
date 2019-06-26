package kr.pb.bts.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.pb.bts.domain.Help;
import kr.pb.bts.domain.Page;

@Repository
public interface HelpMapper {
	
	List<Help> myInquiry(int mNo);
	
	void insertInquiry(Help help);
	
	List<Help> getInquiryList(Page page);
	
	int getTotalCnt(Page page);

	void insertAnswer(Help help);
}
