package com.object.asc.user.controller;

import java.sql.Date;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.object.asc.user.domain.User;
import com.object.asc.user.service.UserService;

/**
 * User Controller
 */
@Controller
@RequestMapping("/user")
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	 
	@Inject
	private UserService service;
	User user;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String release(Locale locale, Model model) {
		logger.info("모야모야 테스트");
		
		return "/index";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(@RequestParam("fileupload")MultipartFile photo, User user, RedirectAttributes rttr) {
		logger.info("회원가입 테스트");
		
		user.setPhoto(photo.getOriginalFilename());
		logger.info(photo.getOriginalFilename());
		
		service.register(user);
		rttr.addFlashAttribute("message", "success");
		
		return "redirect:/";
	}
	
	
	@RequestMapping(value = "/idCheck")
	@ResponseBody
	public ResponseEntity<String> idCheck(@RequestParam("registerId") String registerId) {
		ResponseEntity<String> entity = null;
	    
		String result = "";
		
	      try {
	    	  logger.info("아이디 중복체크 테스트");
	    	  
	    	  boolean name = service.idCheck(registerId);
	    	  
	    	  if(name == true){
	    		  result = "success";
	    	  }else{
	    		  result = "fail";
	    	  }
	    	  
	    	  entity = new ResponseEntity<String>(result, HttpStatus.OK);
	    	  
	      } catch (Exception e) {
	         e.printStackTrace();
	         entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
	      }
	      return entity;
	}
	
	
	@RequestMapping(value="/get", method = RequestMethod.GET)
	public void get(User user){
		logger.info("가입정보 불러오기 테스트");
		
		service.get(user.getUserNo());
		
	}
	
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modify(User user, RedirectAttributes rttr) {
		logger.info("회원수정 테스트");
		
		service.modify(user);
		
		rttr.addFlashAttribute("message", "success");
		
		return "redirect:/lobby/selectProject";
	}
	
	
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void loginPOST(User user, HttpSession session, Model model) {
		
		User loginCheck = service.login(user);

		if(loginCheck == null){return;} 
		
		
		if (user.isUseCookie()) {
			int amount = 60 * 60 * 24 * 7;
			Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));
			
			service.keepLogin(user.getId(), session.getId(), sessionLimit);

		}
		
		model.addAttribute("user", loginCheck);
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session ) {
		logger.info("로그아웃하자~~");
		
		Object obj = session.getAttribute("login");
		
		if (obj != null) {
			User user = (User) obj;
			
			session.removeAttribute("login");
			session.invalidate();
			
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			Cookie userIdCookie = WebUtils.getCookie(request, "userIdCookie");
			
			if (loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				service.keepLogin(user.getId(), session.getId(), new Date(0));
			}
			if (userIdCookie != null) {
				userIdCookie.setPath("/");
				userIdCookie.setMaxAge(0);
				response.addCookie(userIdCookie);
				service.keepLogin(user.getId(), session.getId(), new Date(0));
			}
			
		}
		return "redirect:/";
	}
	
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<String> delete(@RequestParam("userNo") int userNo, String password, String repassword) {
		ResponseEntity<String> entity = null;
		  
	      
		String result="";
		  try {
	    	  
	    	  logger.info("탈퇴합니다~~");
	    	  
	    	  service.delete(userNo);/** 회원 상태 2로 변경*/
	    	  
	    	  if(password.equals("")){
	    		  result = "null";
	    		  
	    	  }else if(password != repassword){
	    		  result="fail";
	    		  
	    	  }else{
	    		  result = "success";
	    	  };
	    	  logger.info(result+"모라고나오냥");
	    	  
	    	  entity = new ResponseEntity<String>(result, HttpStatus.OK);
	    	  
	      } catch (Exception e) {
	         e.printStackTrace();
	         entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
	      }
	      return entity;
	}
	
	@RequestMapping(value = "/findId")
	@ResponseBody
	public ResponseEntity<String> findId(String name, String phone) {
		ResponseEntity<String> entity = null;
	      
	      try {
	    	  logger.info("아이디 찾아준다");
	    	  
	    	  String returnId = service.findId(name, phone);
	    	  entity = new ResponseEntity<String>(returnId, HttpStatus.OK);
	    	  
	      } catch (Exception e) {
	         e.printStackTrace();
	         entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
	      }
	      return entity;
	}
	
	@RequestMapping(value = "/findPw")
	@ResponseBody
	public ResponseEntity<String> findPw(String id, String name, String phone) {
		ResponseEntity<String> entity = null;
	      
	      try {
	    	  logger.info("비밀번호 찾아준다");
	    	  
	    	  String returnPw = service.findPw(id, name, phone);
	    	  entity = new ResponseEntity<String>(returnPw, HttpStatus.OK);
	    	  
	      } catch (Exception e) {
	         e.printStackTrace();
	         entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
	      }
	      return entity;
	}
	
	@RequestMapping(value = "/createNewPw")
	@ResponseBody
	public ResponseEntity<String> createNewPw(@RequestParam("password")String password, @RequestParam("id")String id) {
		ResponseEntity<String> entity = null;
	      
	      try {
	    	  logger.info("새로운 비밀번호 만들자");
	    	  service.createNewPw(id, password);
	    	  
	    	  String success ="success";
	    	  
	    	  entity = new ResponseEntity<String>(success, HttpStatus.OK);
	      } catch (Exception e) {
	         e.printStackTrace();
	         entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
	      }
	      return entity;
	}
	
}

