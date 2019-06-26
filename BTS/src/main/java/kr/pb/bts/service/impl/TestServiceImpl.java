package kr.pb.bts.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.pb.bts.domain.BookInfo;
import kr.pb.bts.domain.BookManage;
import kr.pb.bts.domain.BookOrder;
import kr.pb.bts.domain.Test;
import kr.pb.bts.mapper.TestMapper;
import kr.pb.bts.service.TestService;


// 서비스 인터페이스를 상속받은 실제 로직이 존재하는 서비스 단에는 서비스 어노테이션을 선언해둠
@Service
public class TestServiceImpl implements TestService {
	
	private static final Logger logger = LoggerFactory.getLogger(TestServiceImpl.class);	// 로거 = syso 대신 이용하는거라 생각하면됨.
	
	@Autowired TestMapper testMapper;			// 연결될 매퍼(인터페이스)를 자동주입해둠

	
	@Override
	public List<HashMap<String, Object>> getList() {
		
		logger.info("앗..! 서비스impl 로 들어왔네!");	// 로거를 이용한 콘솔찍는법
		
		// 제너릭 선언은 필수임 노란줄 용납 안함, 애초에 자기가 어떤 데이터타입을 운용하는지 모르고 코드만 찎찎 써놓으면
		// 나중에 수정해주거나 할때 다른사람이 고생할 수 있기때문에 무조건 아래처럼 달아두는걸 권장함
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();	
		HashMap<String, Object> map1 = new HashMap<String, Object>();
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		
		map1.put("name", "윤종수");
		map1.put("age", "31");
		map2.put("name", "이정현");
		map2.put("age", "30");
		list.add(map1);
		list.add(map2);
		
		return list;
	}


	@Override
	public List<Test> getDbList(Test test) {	
		logger.info("DB List 로 들어옴");
		return testMapper.getDbList(test);
	}


	@Override
	public List<BookInfo> getBookList(BookInfo bi) {
		logger.info("Book List - Test 서비스 진입");
		return testMapper.getBookList(bi);
	}


	@Override
	public void updateBM() {
		logger.info("BM 테이블 업데이트 서비스 진입");
		int count = testMapper.getBookCount();
		
		for(int i = 0; i<count; i++) {
			BookManage manage = new BookManage();
			manage.setBmCount((int)(Math.random()*70)+1);
			manage.setBmHit((int)(Math.random()*100)+1);
			manage.setBmHave((int)(Math.random()*50)+1);
			testMapper.updateBm(manage);		
		}
	}


	@Override
	public void updateBO() {
		logger.info("BO 테이블 업데이트 서비스 진입");
		int count = testMapper.getBookCount();   // 총 책 info 데이터 갯수
		for(int i = 0; i<count; i++) {
			int bmCount = testMapper.getBmCount(i+1);	// 해당 책번호의 총판매량
			int biPrice = testMapper.getBiPrice(i+1);
			for(int j = 0; j<bmCount; j++) {
				BookOrder order = new BookOrder();
				int boUser = (int)(Math.random()*500)+1;	// 유저번호 500번 까지만
				String boAddr = testMapper.getAddr(boUser);
				String month = String.valueOf((int)(Math.random()*5)+1);
				String day = String.valueOf((int)(Math.random()*26)+1);
				if(day.length() < 2) {
					day = "0"+day;
				}
				String boDate = "2019-0"+month+"-"+day+" "+"00:00:00";
				String boConfirm = "2019-0"+month+"-"+day;
				
				order.setBoUser(boUser);
				order.setBoAddr(boAddr);
				order.setBoBook(i+1);
				order.setBoDate(boDate);
				order.setBoPrice(biPrice);
				order.setBoConfirm(boConfirm);
				testMapper.synchData(order);
			}
			
			
		}
	}

}
