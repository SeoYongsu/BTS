package kr.pb.bts.service.impl;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.pb.bts.domain.BookOrder;
import kr.pb.bts.mapper.OrderMapper;
import kr.pb.bts.service.OrderService;


// 서비스 인터페이스를 상속받은 실제 로직이 존재하는 서비스 단에는 서비스 어노테이션을 선언해둠
@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired OrderMapper OrderMapper;			// 연결될 매퍼(인터페이스)를 자동주입해둠
	private static final Logger logger = LoggerFactory.getLogger(OrderServiceImpl.class);	// 로거 = syso 대신 이용하는거라 생각하면됨.

	@Override
	public void updateHit(BookOrder vo) {
		logger.info("updateHit 서비스 진입");
		OrderMapper.updateHit(vo);
	}

	@Override
	public BookOrder getDetail(BookOrder vo) {
		logger.info("getDetail 서비스 진입");
		return OrderMapper.getDetail(vo);
	}

	@Override
	public BookOrder getUserInfo(BookOrder vo) {
		logger.info("getUserInfo 서비스 진입");
		return OrderMapper.getUserInfo(vo);
	}

	@Override
	public void insertOrder(BookOrder vo) {
		logger.info("insertOrder 서비스 진입");
		OrderMapper.insertOrder(vo);
	}

	@Override
	public void updateManage(BookOrder vo) {
		logger.info("updateManage 서비스 진입");
		OrderMapper.updateManage(vo);
		
	}
	
	@Override
	public List<BookOrder> getOrder(BookOrder vo) {
		logger.info("getOrder 서비스 진입");
		return OrderMapper.getOrder(vo);
	}

	@Override
	public void fixOrder(BookOrder vo) {
		logger.info("fixOrder 서비스 진입");
		OrderMapper.fixOrder(vo);
	}

	@Override
	public void cancelOrder(BookOrder vo) {
		logger.info("fixOrder 서비스 진입");
		OrderMapper.cancelOrder(vo);
	}

	@Override
	public void insertReview(BookOrder vo) {
		logger.info("insertReview 서비스 진입");
		OrderMapper.insertReview(vo);
	}

	@Override
	public List<BookOrder> getReview(BookOrder vo) {
		logger.info("getReview 서비스 진입");
		return OrderMapper.getReview(vo);
	}

	@Override
	public int getBuyFact(BookOrder vo) {
		logger.info("getBuyFact 서비스 진입");
		return OrderMapper.getBuyFact(vo);
	}

	@Override
	public int getReviewFact(BookOrder vo) {
		logger.info("getReviewFact 서비스 진입");
		return OrderMapper.getReviewFact(vo);
	}

	@Override
	public void deleteReview(BookOrder vo) {
		logger.info("deleteReview 서비스 진입");
		OrderMapper.deleteReview(vo);
	}

	@Override
	public BookOrder changeReview(BookOrder vo) {
		logger.info("changeReview 서비스 진입");
		return OrderMapper.changeReview(vo);
	}

	@Override
	public void changeReviewProc(BookOrder vo) {
		logger.info("changeReviewProc 서비스 진입");
		OrderMapper.changeReviewProc(vo);		
	}




}
