package kr.pb.bts.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.pb.bts.domain.Notice;
import kr.pb.bts.domain.Page;

@Repository
public interface NoticeMapper {

	int getTotalCnt(Page page);
	
	List<Notice> getNoticeList(Page page);
	
	List<Notice> getNoticeList2();
	
	void insertNotice(Notice notice);
	
	void updateNotice(Notice notice);
	
	void updateHit(Notice notice);
	
	void deleteNotice(Notice notice);
	
	Notice detailNotice(Notice notice);
	
}
