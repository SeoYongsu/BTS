package kr.pb.bts.web;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import kr.pb.bts.domain.BookOrder;
import kr.pb.bts.service.OrderService;

@Controller
@RequestMapping(value="/order")
public class OrderController {	
	@Autowired OrderService OrderService;
	//조회수 증가과정을 거쳐 상세보기 창으로 이동
	@RequestMapping(value="/hit")
	public ModelAndView updateHit(BookOrder vo, ModelAndView mv) {
		OrderService.updateHit(vo);
		RedirectView rv=new RedirectView("/bts/order/detail.web");
		
		rv.addStaticAttribute("biNo", vo.getBiNo());
		mv.setView(rv);
		return mv;
	}
	
	//상세보기-책 상세정보(바로구매, 장바구니 버튼), 조건 맞는 유저에게 리뷰쓰기 폼, 등록된 리뷰(작성자일 경우 수정 삭제 버튼)이 뜬다
	@RequestMapping(value="/detail")
	public String getDetail(BookOrder vo, Model model,HttpSession session,@RequestParam(value="biNo")int biNo) {
		if((Integer)session.getAttribute("mNo")!=null) {
			Integer mNo = (Integer)session.getAttribute("mNo");

			vo.setmNo(mNo);//유저번호 도메인에 저장			
			model.addAttribute("mNo",mNo);
		}
		
		vo.setBiNo(biNo);
		
		BookOrder detail= OrderService.getDetail(vo);//책의 상세정보 가져오기				
		List<BookOrder> review=OrderService.getReview(vo);//해당 책에 달린 리뷰 가져오기	
		
		int buyFact=OrderService.getBuyFact(vo);//유저가 이 책을 구매하였는지 여부 확인값
		int reviewFact=OrderService.getReviewFact(vo);//유저가 이 책에 리뷰를 이미 달았는지 여부 확인
		boolean reviewShow=false;
		if(buyFact==1 && reviewFact==0) {//책을 구매하였고 리뷰를 아직 달지 않았을 경우(또는 리뷰를 삭제한 경우) 리뷰 쓰기 폼을 보여주자
			reviewShow=true;
		}	
		model.addAttribute("VIEW", detail);
		model.addAttribute("REVIEW",review);
		model.addAttribute("SHOW",reviewShow);
		return "/web/order/detail.web";
	}
	
	
	//장바구니 담기
	@RequestMapping(value="/cartput")
	public String cartPut(BookOrder vo,Model model,HttpSession session) {
		
		ArrayList<HashMap<String,Object>> list=(ArrayList<HashMap<String,Object>>)session.getAttribute("cart");
		
		boolean exist=false;//추가하고자하는 상품이 장바구니에 이미 존재하는지 여부
		
		if(list==null) {//세션에 장바구니 리스트가 없다면 새로 만들어주기
			list=new ArrayList<HashMap<String,Object>>();
		}
		for(int i=0;i<list.size();i++) {//장바구니에 이미 해당 상품이 있는 경우 상품 갯수를 최근 것으로 갱신해준다
			HashMap<String,Object> map=list.get(i);
			if(vo.getBiNo()==(Integer) map.get("biNo")) {
				exist=true;
				map.put("boOrdercount", vo.getBoOrdercount());
				break;
			}			
		}
		if(exist==false) {//장바구니에 없다면 상품 내용을 추가하기		
			HashMap<String,Object> item=new HashMap<String,Object>();			
			item.put("biNo", vo.getBiNo());
			item.put("boOrdercount", vo.getBoOrdercount());
			list.add(item);				
		}
			
		session.setAttribute("cart", list);
		
		model.addAttribute("biNo",vo.getBiNo());
		return "/web/order/cartput.web";
	}
	//장바구니 보기
	@RequestMapping(value="/cart")
	public String cart(Model model,HttpSession session) {
		
		ArrayList<HashMap<String,Object>> list=(ArrayList<HashMap<String,Object>>)session.getAttribute("cart");
		ArrayList<BookOrder> out = new ArrayList<BookOrder>();
		int sum=0;
		if(list!=null) {
			for(int i=0;i<list.size();i++) {//리스트에 든 맵 vo로 전환
				BookOrder vo=new BookOrder();
				HashMap<String,Object> map=list.get(i);
				vo.setBiNo((Integer) map.get("biNo"));
				
				BookOrder info=OrderService.getDetail(vo);//vo를 이용해 각 장바구니 목록 정보 가져오기			
				info.setBoOrdercount((Integer) map.get("boOrdercount"));
				
				sum=sum+(info.getBoOrdercount()*info.getBiSalPrice());
				out.add(info);//가져온 정보 vo를 리스트에 담기
			}		
			model.addAttribute("CART",out);//장바구니 정보를 뷰로 내보내기			
		}
		model.addAttribute("SUM",sum);
		return "/web/order/cart.web";
	}
	
	//장바구니 수정
	@RequestMapping(value="/cartcha")
	public ModelAndView cartChange(BookOrder vo,ModelAndView mv,HttpSession session) {
		
		ArrayList<HashMap<String,Object>> list=(ArrayList<HashMap<String,Object>>)session.getAttribute("cart");
		ArrayList<BookOrder> out = new ArrayList<BookOrder>();
		for(int i=0;i<list.size();i++) {
			HashMap<String,Object> map=list.get(i);
			if(vo.getBiNo()==(Integer) map.get("biNo")) {
				map.put("boOrdercount", vo.getBoOrdercount());//상품갯수 변경
			}			
		}
		RedirectView rv=new RedirectView("/bts/order/cart.web");
		mv.setView(rv);
		return mv;
	}
	
	//장바구니 삭제
	@RequestMapping(value="/cartdel")
	public ModelAndView cartDelete(BookOrder vo,ModelAndView mv,HttpSession session) {
		
		ArrayList<HashMap<String,Object>> list=(ArrayList<HashMap<String,Object>>)session.getAttribute("cart");
		ArrayList<BookOrder> out = new ArrayList<BookOrder>();
		for(int i=0;i<list.size();i++) {
			HashMap<String,Object> map=list.get(i);
			if(vo.getBiNo()==(Integer) map.get("biNo")) {
				list.remove(i);//리스트에서 해당 상품의 맵 제거
			}			
		}
		RedirectView rv=new RedirectView("/bts/order/cart.web");
		mv.setView(rv);
		return mv;
	}
	
	//장바구니 구매페이지-주문상품 정보, 유저 배송지 정보가 뜬다
	@RequestMapping(value="/cartbuy")
	public String cartBuy(BookOrder vo, Model model,HttpSession session) {
		Integer mNo = (Integer)session.getAttribute("mNo");
		vo.setmNo(mNo);//유저번호 도메인에 저장
		
		BookOrder user= OrderService.getUserInfo(vo);//구매자 정보 도메인 통해 가져오기
		
		String[] phonearray = user.getmPhone().split("-");
		user.setmPhone1(phonearray[0]);
		user.setmPhone2(phonearray[1]);
		user.setmPhone3(phonearray[2]);
		
		String[] addrarray = user.getmAddr().split("/");
		user.setmAddr1(addrarray[0]);
		user.setmAddr2(addrarray[1]);
		user.setmAddr3(addrarray[2]);
		
		ArrayList<HashMap<String,Object>> list=(ArrayList<HashMap<String,Object>>)session.getAttribute("cart");		
		ArrayList<BookOrder> out = new ArrayList<BookOrder>();		
		int sum=0;		
		for(int i=0;i<list.size();i++) {//리스트에 든 맵 vo로 전환
			BookOrder cart=new BookOrder();
			HashMap<String,Object> map=list.get(i);
			cart.setBiNo((Integer) map.get("biNo"));
			
			BookOrder info=OrderService.getDetail(cart);//vo를 이용해 각 장바구니 목록 정보 가져오기			
			info.setBoOrdercount((Integer) map.get("boOrdercount"));
			out.add(info);//가져온 정보 vo를 리스트에 담기
			
			sum=sum+(info.getBoOrdercount()*info.getBiSalPrice());
			
			model.addAttribute("ORDER",out);
			
		}
		
		model.addAttribute("SUM",sum);
		model.addAttribute("USER", user);
		return "/web/order/cartbuy.web";
	}
	
	//장바구니 구매 진행 안내 DB에 구매내역이 저장된다
	@RequestMapping(value="/cartguide")
	public String cartGuide(BookOrder vo,Model model,HttpSession session) {
		Integer mNo = (Integer)session.getAttribute("mNo");
		vo.setBoUser(mNo);//유저번호 도메인에 저장
		
		String boPhone = vo.getmPhone1() + "-" + vo.getmPhone2() + "-" + vo.getmPhone3();
		vo.setBoPhone(boPhone);
		
		String addr = vo.getmAddr1()+"/"+vo.getmAddr2()+"/"+vo.getmAddr3();
		vo.setBoAddr(addr);
		
		ArrayList<HashMap<String,Object>> list=(ArrayList<HashMap<String,Object>>)session.getAttribute("cart");
		for(int i=0;i<list.size();i++) {//리스트에 든 맵 vo로 전환
			HashMap<String,Object> map=list.get(i);
			vo.setBiNo((Integer) map.get("biNo"));
			vo.setBoBook((Integer) map.get("biNo"));
			vo.setBoOrdercount((Integer) map.get("boOrdercount"));
			BookOrder detail=OrderService.getDetail(vo);
			vo.setBoPrice(detail.getBiSalPrice()*vo.getBoOrdercount());
			OrderService.insertOrder(vo);//구매내역 book_order에 기록		
			OrderService.updateManage(vo);//재고, 판매량 변동 book_manage에 적용
		}
		session.removeAttribute("cart");
		
		return "/web/order/cartguide.web";
	}
	
	//구매페이지-주문상품 정보, 유저 배송지 정보가 뜬다
	@RequestMapping(value="/buy")
	public String buyBook(BookOrder vo, Model model,HttpSession session) {
		Integer mNo = (Integer)session.getAttribute("mNo");
		vo.setmNo(mNo);//유저번호 도메인에 저장
		
		BookOrder user= OrderService.getUserInfo(vo);//구매자 정보 도메인 통해 가져오기
		
		String[] phonearray = user.getmPhone().split("-");
		user.setmPhone1(phonearray[0]);
		user.setmPhone2(phonearray[1]);
		user.setmPhone3(phonearray[2]);
		
		String[] addrarray = user.getmAddr().split("/");
		user.setmAddr1(addrarray[0]);
		user.setmAddr2(addrarray[1]);
		user.setmAddr3(addrarray[2]);
		
		BookOrder order= OrderService.getDetail(vo);//책 번호 통해 구매도서 정보 가져오기
		
		model.addAttribute("USER", user);
		model.addAttribute("ORDER",order);
		model.addAttribute("boOrdercount",vo.getBoOrdercount());
		return "/web/order/buy.web";
	}

	//구매 진행 안내 DB에 구매내역이 저장된다
	@RequestMapping(value="/guide")
	public String buyGuide(BookOrder vo,Model model,HttpSession session) {
		Integer mNo = (Integer)session.getAttribute("mNo");
		vo.setBoUser(mNo);//유저번호 도메인에 저장
		
		String boPhone = vo.getmPhone1() + "-" + vo.getmPhone2() + "-" + vo.getmPhone3();
		vo.setBoPhone(boPhone);
		
		String addr = vo.getmAddr1()+"/"+vo.getmAddr2()+"/"+vo.getmAddr3();
		vo.setBoAddr(addr);

		OrderService.insertOrder(vo);//구매내역 book_order에 기록
		OrderService.updateManage(vo);//재고, 판매량 변동 book_manage에 적용
		
		return "/web/order/guide.web";
	}
	
	//구매 확정 진행 페이지- 그날 구매한 상품목록이 뜬다 : 확정과 취소 가능
	@RequestMapping(value="/confirm")
	public String buyConfirm(BookOrder vo, Model model,HttpSession session) {
		Integer mNo = (Integer)session.getAttribute("mNo");
		vo.setBoUser(mNo);//유저번호 도메인에 저장
		
		List<BookOrder> list=OrderService.getOrder(vo);//유저의 구입 목록 중 오늘 구입한 항목 가져오기
		
		model.addAttribute("BUY", list);
		return "/web/order/confirm.web";
	}
	
	//구매 확정 클릭시 DB처리
	@RequestMapping(value="/fix")
	public ModelAndView buyFix(BookOrder vo, Model model,HttpSession session,ModelAndView mv,@RequestParam(value="boNo")int boNo) {
		Integer mNo = (Integer)session.getAttribute("mNo");
		vo.setBoUser(mNo);//유저번호 도메인에 저장
		vo.setBoNo(boNo);//주문번호 도메인에 저장
		
		OrderService.fixOrder(vo);//구매 확정 book_manage에 적용
		
		RedirectView rv=new RedirectView("/bts/order/confirm.web");
		mv.setView(rv);
		return mv;
	}
	
	//구매 취소시 클릭시 DB처리
	@RequestMapping(value="/cancel")
	public ModelAndView buyCancel(BookOrder vo, Model model,HttpSession session,ModelAndView mv,@RequestParam(value="boNo")int boNo) {
		Integer mNo = (Integer)session.getAttribute("mNo");
		vo.setBoUser(mNo);//유저번호 도메인에 저장
		vo.setBoNo(boNo);//주문번호 도메인에 저장
		
		OrderService.cancelOrder(vo);//구매 취소 book_manage에 적용
		
		RedirectView rv=new RedirectView("/bts/order/confirm.web");
		mv.setView(rv);
		return mv;
	}
	
	//리뷰 등록 DB 처리
	@RequestMapping(value="/review")
	public ModelAndView buyReview(BookOrder vo,HttpSession session,ModelAndView mv) {
		Integer mNo = (Integer)session.getAttribute("mNo");
		vo.setBrMno(mNo);//유저번호 도메인에 저장
		
		OrderService.insertReview(vo);//작성한 리뷰 DB에 기록
		
		RedirectView rv=new RedirectView("/bts/order/detail.web");		
		rv.addStaticAttribute("biNo", vo.getBiNo());
		mv.setView(rv);
		return mv;
	}
	
	//리뷰 삭제 DB처리
	@RequestMapping(value="/delete")
	public ModelAndView deleteReview(BookOrder vo, Model model,HttpSession session,ModelAndView mv) {
		Integer mNo = (Integer)session.getAttribute("mNo");
		vo.setmNo(mNo);//유저번호 도메인에 저장
		
		OrderService.deleteReview(vo);
		
		RedirectView rv=new RedirectView("/bts/order/detail.web");
		rv.addStaticAttribute("biNo", vo.getBiNo());
		mv.setView(rv);
		return mv;
	}
	
	//리뷰 수정 폼 가져오기
	@RequestMapping(value="/change")
	public String changeReviewInfo(BookOrder vo, Model model,HttpSession session) {
		Integer mNo = (Integer)session.getAttribute("mNo");
		vo.setmNo(mNo);//유저번호 도메인에 저장
		
		BookOrder change= OrderService.changeReview(vo);//책의 상세정보 가져오기		
		
		model.addAttribute("biNo",vo.getBiNo());
		model.addAttribute("change",change);
		return "/web/order/change.web";
	}
	
	//리뷰 수정 DB처리
	@RequestMapping(value="/changeproc")
	public ModelAndView changeReviewProc(BookOrder vo, Model model,HttpSession session,ModelAndView mv) {
		Integer mNo = (Integer)session.getAttribute("mNo");
		vo.setmNo(mNo);//유저번호 도메인에 저장
		
		OrderService.changeReviewProc(vo);
		
		RedirectView rv=new RedirectView("/bts/order/detail.web");
		rv.addStaticAttribute("biNo", vo.getBiNo());
		mv.setView(rv);
		return mv;
	}
}
