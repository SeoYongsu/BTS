package kr.pb.bts.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;



public class AuthInterceptor extends HandlerInterceptorAdapter {
	
	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		
		logger.debug("handle");
		if(this.isMain(request)) return true;
		
		if(this.isUriToExclude(request)) return true; 
		
		if(this.isMember(request)){
			return true;
		}else{
			logger.debug("메인페이지로 보내줌");
			response.sendRedirect(request.getContextPath() + "/");
		};
		return false;
	}
	
	
	
	/**
	 * 
	 * @param request
	 * @return
	 */
	private boolean isMember(HttpServletRequest request){
		
		boolean isMember = false;
		HttpSession session = request.getSession();
		Integer user = (Integer) session.getAttribute("mNo");
		
		isMember = (user == null) ? false : true;
		return isMember;
	}
	
	/**
	 * 루트는 통과
	 * @param request
	 * @return
	 */
	private boolean isMain(HttpServletRequest request){
		String requestUri = request.getRequestURI();
		String contextPath = request.getContextPath();
		if(requestUri.equals(contextPath + "/") || requestUri.equals(contextPath + "/main")){
			return true;
		}		
		return false;
	}
	
	/**
	 * 
	 * @param request
	 * @return
	 */
	private boolean isUriToExclude(HttpServletRequest request){
		String requestUri = request.getRequestURI();
		logger.debug("isUriToExclude 메소드");
		for(String uriToExclude : URI_TO_EXCLUDE){
			if(requestUri.indexOf(uriToExclude) > -1) return true;
		}
		
		return false;
	}
	
	
	
	/**
	 * 통과
	 */
	static final String[] URI_TO_EXCLUDE = {
		"/main"	
		, "/joinForm"
		, "/joinProc"
		, "/idCheck"
		, "/loginForm"
		, "/loginProc"
		, "/logout"
		, "/idCheck"
		, "/order/detail"
		, "/order/hit"
		, "/notice/list"
		, "/help/center"
		, "/member/findId"
		, "/member/findPw"
		, "/BookList"
	};
	
}
