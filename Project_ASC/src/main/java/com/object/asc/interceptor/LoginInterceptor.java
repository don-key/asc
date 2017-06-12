package com.object.asc.interceptor;

import java.sql.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.object.asc.user.domain.User;
import com.object.asc.user.service.UserService;


public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	@Inject
	UserService service;
	
	private static final String LOGIN = "login";
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler){
		
		HttpSession session = request.getSession();
		
		if (session.getAttribute(LOGIN) != null) {
			logger.info("이전 로그인 데이터 지우기");
			session.removeAttribute(LOGIN);
		}
		Object obj = session.getAttribute("login");
		Cookie userIdCookie = WebUtils.getCookie(request, "userIdCookie");
		if (obj != null) {
			User user = (User) obj;
			if (userIdCookie != null) {
				userIdCookie.setPath("/");
				userIdCookie.setMaxAge(0);
				response.addCookie(userIdCookie);
				service.keepLogin(user.getId(), session.getId(), new Date(0));
				}
		}
		return true;	
	}
	
	@Override	
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception{
		
		HttpSession session = request.getSession();
		
		ModelMap modelMap = modelAndView.getModelMap();
		Object user = modelMap.get("user");
		
		User user2 = (User) user;
		
		if (user2.getName() != null) {
			
			User userInfo = service.get(user2.getUserNo());

			if(userInfo.getStatus() == 1){
				
				logger.info("로그인 성공");
				session.setAttribute(LOGIN, userInfo);
	
				if (request.getParameter("useCookie") != null) {
					logger.info("remember me~~~~~~~~~");
					
					Cookie loginCookie = new Cookie("loginCookie", session.getId());
					loginCookie.setPath("/");
					loginCookie.setMaxAge(60 * 60 * 24 * 7);
					response.addCookie(loginCookie);
					
				}
				
					User userCookie = (User) user;
					Cookie userIdCookie = new Cookie("userIdCookie", userCookie.getId());
					userIdCookie.setPath("/");
					userIdCookie.setMaxAge(60 * 60 * 24 * 7);
					response.addCookie(userIdCookie);
					
					response.sendRedirect("/lobby/selectProject");
				
			
			 }else if(userInfo.getStatus() == 0){
					logger.info("메일 미인증 회원");
					response.sendRedirect("/?result=notAuth");
				}else {
					logger.info("탈퇴회원");
					response.sendRedirect("/?result=delete");
				}
				
		}else{
					logger.info("아이디 비번 불일치");
					response.sendRedirect("/?result=error");
				}
		}
	}

 
