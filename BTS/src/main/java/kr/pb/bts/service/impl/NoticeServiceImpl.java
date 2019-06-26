package kr.pb.bts.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.pb.bts.domain.Notice;
import kr.pb.bts.domain.Page;
import kr.pb.bts.mapper.NoticeMapper;
import kr.pb.bts.service.NoticeService;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired NoticeMapper noticeMapper;

	@Override
	public List<Notice> getNoticeList(Page page) {
		
		int nowPage = page.getNowPage();
		
		if(nowPage == 1) {
			page.setNowPage(0);
		}else {
			page.setNowPage(nowPage*10-10);
		}
		
		return noticeMapper.getNoticeList(page);
	}

	@Override
	public void insertNotice(Notice notice) {
		noticeMapper.insertNotice(notice);
	}

	@Override
	public void updateNotice(Notice notice) {
		noticeMapper.updateNotice(notice);
	}

	@Override
	public Notice detailNotice(Notice notice) {
		noticeMapper.updateHit(notice);
		return noticeMapper.detailNotice(notice);
	}

	@Override
	public List<Notice> getNoticeList2() {
		return noticeMapper.getNoticeList2();
	}

}
