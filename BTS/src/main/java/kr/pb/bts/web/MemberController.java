package kr.pb.bts.web;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import kr.pb.bts.domain.Member;
import kr.pb.bts.domain.Page;
import kr.pb.bts.mapper.MemberMapper;
import kr.pb.bts.service.MemberService;

@Controller
@RequestMapping(value="/member") 					// 기준폴더를 위쪽에 매핑해줌
public class MemberController {
	
private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired MemberService memberService;  // 이용할 서비스(인터페이스) 자동주입 해둠
	@Autowired MemberMapper memberMapper; 
	
	// ------------------------------------------------------------------------------------
	// 회원가입 폼 보여주기
	@RequestMapping(value="/joinForm")
	public String memberJoinForm() {
		return "/web/member/joinForm.web";
	}
	
	// 회원가입 처리하기
	@RequestMapping(value="/joinProc", method=RequestMethod.POST)
	public String memberJoinProc(Member member) {
		logger.info("memberJoinProc");
		
		int result = memberService.memberJoinProc(member);
		if (result==0) {
			// 회원가입 실패시
			return "/web/member/joinProc.web";
		}
		else {
			// 회원가입 성공시
			return "/web/member/loginForm.web";
		}
	}
	
	// 아작스 아이디 중복확인
	@RequestMapping(value="/idCheck", method=RequestMethod.POST)
	@ResponseBody
	public int idCheck(@RequestParam(value="mId") String mId) {
		
		if (mId == null || mId.length()==0) {
			return 0;
		}
		else {
			int count = memberService.idCheck(mId);
			
			return count;
		}
	}
	
	// ------------------------------------------------------------------------------------
	// 로그인 폼 보여주기
	@RequestMapping(value="/loginForm")
	public String memberLoinForm() {
		return "/web/member/loginForm.web";
	}
	
	// 로그인 처리하기
	@RequestMapping(value="/loginProc", method=RequestMethod.POST)
	public ModelAndView memberLoginProc(Member member, HttpSession session) {
		logger.info("memberLoginProc");
		memberService.memberLoginProc(member, session);
		
		System.out.println(member.getmId());
		System.out.println(member.getmPw());
		
		Integer mNo = (Integer)session.getAttribute("mNo");
		ModelAndView mv = new ModelAndView();
		RedirectView rv = null;
		if (mNo==null) {
			rv = new RedirectView("./failLogin.web");
		}
		else {
			rv = new RedirectView("/bts/main.web");
		}
		
		mv.setView(rv);
		return mv;
	}
	
	@RequestMapping(value="/failLogin")
	public String failLogin() { 
		return "/web/member/failLogin.web";
	}
	
	// 로그아웃 처리하기
	@RequestMapping(value="/logout")
	public String memberLogout(HttpSession session) {
		logger.info("memberLogout");
//		Integer mNo = (Integer)session.getAttribute("mNo");
//		String mNo = (String)session.getAttribute("mNo");
		memberService.memberLogout(session);
		
		return "/web/member/logout.web";
	}
	
	
	// ------------------------------------------------------------------------------------
	// 마이페이지 보여주기
	@RequestMapping(value="/myPage")
	public String myPage(Model model,  HttpSession session) {
		logger.info("myPage");
		
		Integer mNo = (Integer)session.getAttribute("mNo");
		
		if (mNo == null) {
			// 회원이 아닐때
			return "/web/member/loginForm.web";
		}
		else {
			// 회원일때
			Member member = memberService.myPage(mNo);
			
			model.addAttribute("MEMBER", member);
			return "/web/member/myPage.web";
		}
	}
	// 마이페이지 수정처리
	@RequestMapping(value="/updateMyPage")
	public ModelAndView updateMyPage(Member member, HttpSession session) {
		logger.info("updateMyPage");
		int result = memberService.updateMyPage(member, session);
		
		ModelAndView mv = new ModelAndView();
		RedirectView rv = null;
		
		if(result==0) {
			// 수정 실패
			rv = new RedirectView("./myPage.web");
		}
		else {
			// 수정 성공
			if(member.getmUse().equals("N")) {
				// 탈퇴한 회원
				rv = new RedirectView("./logout.web");
			}
			else {
				// 탈퇴하지 않은 회원
				rv = new RedirectView("./myPage.web");
			}
		}
		
		mv.setView(rv);
		return mv;
	}
	// 진행중 주문 보여주기
	@RequestMapping(value="/myOrder")
	public String myOrder(Model model,  HttpSession session, Member member) {
			
		logger.info("myOrder");
		
		Page page = new Page();
		int temp;
		
//		String strmNo = (String)session.getAttribute("mNo");
//		int mNo = Integer.parseInt(strmNo);
		Integer mNo = (Integer)session.getAttribute("mNo");
		page.setNo(mNo);
		
		if(member.getNowPage() == "" || member.getNowPage() == null || member.getNowPage() == "1") {
			page.setNowPage(1);
			temp = page.getNowPage();
		}else {
			page.setNowPage(Integer.parseInt(member.getNowPage()));
			temp = page.getNowPage();	
		}
		
		page.setTotalCnt(memberMapper.getMyOrderTotalCnt(page));
		
		List<HashMap<String, Object>> list = memberService.myOrder(page);
			
		page.setNowPage(temp);
		model.addAttribute("page", page);
		model.addAttribute("MYORDER", list);
		return "/web/member/myOrder.web";
		
	}
	
	// 구매확정하기
	@RequestMapping(value="/buyConfirm")
	public String buyConfirm(@RequestParam(value="boNo") int boNo) {
		logger.info("buyConfirm");
		
		memberService.buyConfirm(boNo);
		
		return "/web/member/buyConfirm.web";
	}
	
	// 구매취소하기
	@RequestMapping(value="/buyCancel")
	public String buyCancel(@RequestParam(value="boNo") int boNo) {
		logger.info("buyConfirm");
		
		memberService.buyConfirm(boNo);
		
		return "/web/member/buyConfirm.web";
	}
	
	// 구매목록 주문 보여주기
	@RequestMapping(value="/buyList")
	public String buyList(Model model,  HttpSession session, Member member) {
		
		logger.info("buyList");
		
		Page page = new Page();
		int temp;
//		String strmNo = (String)session.getAttribute("mNo");
//		int mNo = Integer.parseInt(strmNo);
		Integer mNo = (Integer)session.getAttribute("mNo");
		page.setNo(mNo);
		
		if(member.getNowPage() == "" || member.getNowPage() == null || member.getNowPage() == "1") {
			page.setNowPage(1);
			temp = page.getNowPage();
		}else {
			page.setNowPage(Integer.parseInt(member.getNowPage()));
			temp = page.getNowPage();	
		}
		
		page.setTotalCnt(memberMapper.getBuyListTotalCnt(page));
		
		List<HashMap<String, Object>> list = memberService.buyList(page);
		
		page.setNowPage(temp);
		model.addAttribute("page", page);
		model.addAttribute("BUYLIST", list);
		return "/web/member/buyList.web";
	}
	// ------------------------------------------------------------------------------------
	
	// 회원 리스트 보여주기
	@RequestMapping(value="/memberList")
	public String memberList(Model model, Member member) {
		
		logger.info("memberList");
		
		Page page = new Page();
		int temp;
		
		page.setCategory(member.getCategory());
		page.setSearchValue(member.getSearchValue());
		
		if(member.getNowPage() == "" || member.getNowPage() == null || member.getNowPage() == "1") {
			page.setNowPage(1);
			temp = page.getNowPage();
		}else {
			page.setNowPage(Integer.parseInt(member.getNowPage()));
			temp = page.getNowPage();	
		}
		
		page.setTotalCnt(memberMapper.getMemberTotalCnt(page));

		List<HashMap<String, Object>> list = memberService.memberList(page);
		
		page.setNowPage(temp);
		model.addAttribute("page", page);
		model.addAttribute("MEMBERLIST", list);
		
		return "/web/member/memberList.web";
	}
	
	// 회원정보 상세보기
	@RequestMapping(value="/memberDetail")
	public String memberDetail(Model model, 
			@RequestParam(value="userNo") int userNo) {
		
		logger.info("memberDetail");
		
		Member member = memberService.memberDetail(userNo);
		model.addAttribute("MEMBERDETAIL", member);
		
		return "/web/member/memberDetail.web";
	}
	
	// 회원정보 수정하기
	@RequestMapping(value="/memberUpdate")
	public ModelAndView memberUpdate(Member member) {
		
		logger.info("memberUpdate");
		int result = memberService.memberUpdate(member);
		
		ModelAndView mv = new ModelAndView();
		RedirectView rv = null;
		if(result==0) {
			// 수정 실패
			rv = new RedirectView("/web/member/myPage.web");
		}
		else {
			// 수정 성공
			rv = new RedirectView("/web/member/myPage.web");
		}
		
		mv.setView(rv);
		return mv;
	}
	
	// 기존 비밀번호 일치 확인
	@RequestMapping(value="/pwConfirm")
	public String pwConfirm() {
		return "/web/member/pwConfirm.web";
	}
	
	// 비밀번호 수정 폼
	@RequestMapping(value="/myPw")
	public String myPw(Member member, HttpSession session) {
		int result = memberService.myPw(member, session);
		if (result==0) {
			return "/web/member/failLogin.web";
		}
		else {
			return "/web/member/myPw.web";
		}
	}
	
	// 비밀번호 수정하기
	@RequestMapping(value="/myPwProc")
	public ModelAndView myPwProc(Member member, HttpSession session) {
		logger.info("myPwProc");
		
		memberService.myPwProc(member, session);
		ModelAndView mv = new ModelAndView();
		RedirectView rv = new RedirectView("/bts/main.web");
		
		mv.setView(rv);
		return mv;
	}
	
	// 회원 주문목록 보여주기
	@RequestMapping(value="/orderList", method = RequestMethod.GET)
	public String orderList(Model model, Member member) {
		
		logger.info("orderList");
		
		Page page = new Page();
		int temp;
		
		page.setCategory(member.getCategory());
		page.setSearchValue(member.getSearchValue());
		System.out.println("컨트롤러 서치벨류 -> "+member.getSearchValue());
		
		if(member.getNowPage() == "" || member.getNowPage() == null || member.getNowPage() == "1") {
			page.setNowPage(1);
			temp = page.getNowPage();
		}else {
			page.setNowPage(Integer.parseInt(member.getNowPage()));
			temp = page.getNowPage();	
		}
		
		page.setTotalCnt(memberMapper.getOrderTotalCnt(page));
		
		List<HashMap<String, Object>> list = memberService.orderList(page);
		
		page.setNowPage(temp);
		model.addAttribute("page", page);
		model.addAttribute("ORDERLIST", list);
		
		return "/web/member/orderList.web";
	}
	
	// ---------------------------------------------------------
	// 아이디찾기
	@RequestMapping(value="/findId")
	public String findId() {
			
		return "/web/member/findId.web";
	}
	
	@RequestMapping(value="/findIdProc")
	public String findIdProc(Model model, Member member) {
		
		
		Member member2 = memberService.findIdProc(member);	
		if (member2==null) {
			// 일치하는 회원이 없으면
			return "/web/member/failLogin.web";
		}
		else {
			// 일치하는 회원이 있으면
			model.addAttribute("FINDID", member2);
			return "/web/member/findIdProc.web";
		}
	}
	
	// 비밀번호 찾기
	@RequestMapping(value="/findPw")
	public String findPw() {
			
		return "/web/member/findPw.web";
	}
	
	@RequestMapping(value="/findPwProc")
	public String findPwProc(Model model, Member member) {
		
		
		Member member2 = memberService.findPwProc(member);	
		if (member2==null) {
			// 데이터가 일치하지 않으면
			return "/web/member/failLogin.web";
		}
		else {
			// 데이터가 일치하면
			model.addAttribute("FINDPW", member2);
			
			return "/web/member/findPwProc.web";
		}
	}
}
