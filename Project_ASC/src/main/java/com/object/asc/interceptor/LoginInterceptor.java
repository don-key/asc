package com.object.asc.interceptor;

import java.net.URLEncoder;
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

/**
 * 
 * 로그인 유지를 위한 필터역할을 해주는 인터셉터
 * preHandle 메소드, postHandle 메소드 활용
 * 
 * @패키지 : com.object.asc.interceptor
 * @파일명 : LoginInterceptor.java
 * @작성자 : 이현명
 * @작성일 : 2017. 6. 01.
 *
 */
public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	@Inject
	UserService service;
	
	private static final String LOGIN = "login";
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler){
		
		HttpSession session = request.getSession();
		
		if (session.getAttribute(LOGIN) != null) {
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
				
				session.setAttribute(LOGIN, userInfo);
	
				if (request.getParameter("useCookie") != null) {
					
					Cookie loginCookie = new Cookie("loginCookie", session.getId());
					loginCookie.setPath("/");
					loginCookie.setMaxAge(60 * 60 * 24 * 7);
					response.addCookie(loginCookie);
					
				}
					/*쿠키에 아이디 저장*/
					User userCookie = (User) user;
					Cookie userIdCookie = new Cookie("userIdCookie", userCookie.getId());
					userIdCookie.setPath("/");
					userIdCookie.setMaxAge(60 * 60 * 24 * 7);
					response.addCookie(userIdCookie);
					
					
					/*쿠키에 이름 저장*/
					Cookie CookieForUser = new Cookie("CookieForUser", URLEncoder.encode(userInfo.getName(), "utf-8"));
					CookieForUser.setPath("/");
					CookieForUser.setMaxAge(60 * 60 * 24 * 7);
					response.addCookie(CookieForUser);

					/*쿠키에 사진 저장*/
					Cookie photoCookie = new Cookie("photoCookie", URLEncoder.encode(userInfo.getPhoto(), "utf-8"));
					photoCookie.setPath("/");
					photoCookie.setMaxAge(60 * 60 * 24 * 7);
					response.addCookie(photoCookie);
					
					response.sendRedirect("/lobby/selectProject");
				
			
			 }else if(userInfo.getStatus() == 0){
					response.sendRedirect("/?result=notAuth");
				}else {
					response.sendRedirect("/?result=delete");
				}
				
		}else{
					response.sendRedirect("/?result=error");
				}
		}
	}

 
