package com.com.gentelella.interceptor;

import java.net.InetAddress;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

//시스템 접근하는 로그인 IP리스트 제어 해외접속 및 반복패턴에대한  시스템 방어적 요소 블락처리 목적
//사용자의 세션이 정상인지 체크하는영역
//이상케이스들을 걸러내는 영역이라보면됨. -  인터셉터, 필터

//필터는 아예 진입조차못하게 막음
//인터셉터는 내부에서 금지된 조작을 할 때 제어
public class IpCheckInterceptor implements HandlerInterceptor {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	//클라이언트의 요청을 컨트롤러에 전달하기 전에 호출되는 곳, 여기서 false를 리턴하면 다음 내용을 실행하지 않음.
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object obj) throws Exception {
		//접근한 대상자의 IP정보를 호출해옴
		String ipAddress = request.getHeader("X-FORWARDED-FOR");

		//로컬IP정보를 가져오는게 아닌 
		//기본 게이트웨이 주소를 얻어오는 정보임.
		//null값일 경우에만 해당 게이트웨이 정보를 담는 다.
		if(ipAddress == null) {
			ipAddress = request.getRemoteAddr();
			logger.info("이건 기본게이트웨이 주소 정보 : >>"+ipAddress);
		}

		InetAddress realIp = InetAddress.getLocalHost();
		logger.info("이건 접근한 대상자의 리얼 아이피 정보를 가져오는정보임>>"+realIp);

		//아이피 정보없는 케이스와 지정한 IP를 대조하여 시스템에 접근할 수 있도록 제어
//		if(ipAddress.equals("127.0.0.1") && ipAddress != null) {
//			logger.info("컨트롤러 거치기 최초단계");
			return true; //false인경우 컨트롤러에 값을 넘기지 않는다. true일때만 값을 넘기는 구조임.
//		//나머지 기타 정보 블락처리
//		}else {
//			logger.info("여긴 접근 차단 즉 컨트롤러 진입전 실패뜸.");
//			return false;
//		}
	}

	//클라이언트 요청을 마친 뒤 처리되는 영역, 컨트롤러에서 예외발생 시 실행되지 않음.
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		//logger.info("모든 처리 완료 후 진행됨.");
		//HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}

	//클라이언트의 요청을 먼저 실행 한 다음 실행하는 영역 컨트롤러에서 예외발생 시 실행안됨.
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		//logger.info("컨트롤러까지 진행 된 후 처리되는 자리");
		//HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}


}