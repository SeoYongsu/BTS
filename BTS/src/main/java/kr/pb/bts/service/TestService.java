package kr.pb.bts.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import kr.pb.bts.domain.BookInfo;
import kr.pb.bts.domain.Test;

// 서비스(인터페이스)에는 트랜젝션 어노테이션 선언해둠
// 이 트랜잭션은 해당 서비스를 구현한 내용안에서 여러 로직이 수행되는 도중
// 중간에서 실패할 시 최초시작시점으로 되돌려줌(오류방지용도)
@Transactional
public interface TestService {
	
	// DB연동 없이 데이터 처리
	List<HashMap<String, Object>>  getList();
	
	// DB연동을 통해 가져오기 (예시1)
	List<Test>  getDbList(Test test);
	
	// DB연동을 통해 가져오기 (예시2)
	List<BookInfo> getBookList(BookInfo bi);
	
	void updateBM();
	
	void updateBO();
	
}
