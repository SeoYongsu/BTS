package kr.pb.bts.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import kr.pb.bts.domain.Notice;
import kr.pb.bts.domain.Page;

@Transactional
public interface NoticeService {
	
	List<Notice> getNoticeList(Page page);
	
	void insertNotice(Notice notice);
	
	void updateNotice(Notice notice);
	
	Notice detailNotice(Notice notice);
	
	List<Notice> getNoticeList2();

}
