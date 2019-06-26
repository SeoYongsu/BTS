package kr.pb.bts.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.pb.bts.domain.Help;
import kr.pb.bts.domain.Page;
import kr.pb.bts.mapper.HelpMapper;
import kr.pb.bts.service.HelpService;

@Service
public class HelpServiceImpl implements HelpService {

	@Autowired HelpMapper helpMapper;
	
	@Override
	public List<Help> myInquiry(int mNo) {
		return helpMapper.myInquiry(mNo);
	}
	
	@Override
	public void insertInquiry(Help help) {
		helpMapper.insertInquiry(help);
	}

	@Override
	public List<Help> getInquiryList(Page page) {
		
		int nowPage = page.getNowPage();
		
		if(nowPage == 1) {
			page.setNowPage(0);
		}else {
			page.setNowPage(nowPage*10-10);
		}
		
		System.out.println(page.getCategory());
		System.out.println(page.getSearchValue());
		
		return helpMapper.getInquiryList(page);
	}

	@Override
	public void insertAnswer(Help help) {
		helpMapper.insertAnswer(help);
	}


}
