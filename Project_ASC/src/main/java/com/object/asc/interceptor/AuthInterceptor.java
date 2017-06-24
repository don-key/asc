package com.object.asc.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.object.asc.user.domain.User;
import com.object.asc.user.service.UserService;

/** 로그인 유지를 위한 필터역할을 해주는 인터셉터 */
public class AuthInterceptor extends HandlerInterceptorAdapter{
	
	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	
	@Inject
	private UserService service;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		
		HttpSession session = request.getSession();
		
		if (session.getAttribute("login") == null) {
			
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			
			if (loginCookie != null) {
				User user = service.checkUserWithSessionKey(loginCookie.getValue());
				
				if (user != null) {
					session.setAttribute("login", user);
					return true;
				}
			}
			
			/** 로그인 상태 아닐 때 로그인 페이지로 보내줌*/
			response.sendRedirect("/");
			return false;
		}
		return true;
	}

 }
