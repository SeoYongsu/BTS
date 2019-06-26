package kr.pb.bts.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import kr.pb.bts.domain.Help;
import kr.pb.bts.domain.Page;

@Transactional
public interface HelpService {

	List<Help> myInquiry(int mNo);
	
	void insertInquiry(Help help);
	
	List<Help> getInquiryList(Page page);
	
	void insertAnswer(Help help);
	
}
