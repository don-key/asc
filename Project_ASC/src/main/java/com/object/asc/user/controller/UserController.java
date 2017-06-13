package com.object.asc.user.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;

import javax.inject.Inject;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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
import org.springframework.ui.ModelMap;
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
	public String register(@RequestParam("fileupload")MultipartFile photo, String uuidName, User user, RedirectAttributes rttr) {
		logger.info("회원가입 테스트");
		
		user.setPhoto(uuidName);
		logger.info(photo.getOriginalFilename());
		if(photo.getOriginalFilename().equals("")){
			user.setPhoto("noimage2.png");
		}
		service.register(user);
		rttr.addFlashAttribute("message", "success");
		
		return "redirect:/user/mailSender?user="+user.getId();
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
	
	@RequestMapping(value="/setStatus")
	public String setStatus(@RequestParam("user")String id, RedirectAttributes rttr){
		logger.info("계정 활성화 테스트");
		
		service.setStatus(id);
		
		rttr.addFlashAttribute("setStatus", "status");
		return "redirect:/";
	}
	
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(@RequestParam("fileupload")MultipartFile photo, String uuidName, User user, HttpSession session, HttpServletRequest request, HttpServletResponse response, RedirectAttributes rttr) throws Exception {
		logger.info("회원수정 테스트");
		
		user.setPhoto(uuidName);
		
		if(photo.getOriginalFilename().equals("")){
			user.setPhoto("noimage2.png");
			}
		
		service.modify(user);
		
	      Object obj = session.getAttribute("login");
	      Cookie userIdCookie = WebUtils.getCookie(request, "userIdCookie");
	      if (obj != null) {
	         User user2 = (User) obj;
	         if (userIdCookie != null) {
	            userIdCookie.setPath("/");
	            userIdCookie.setMaxAge(0);
	            response.addCookie(userIdCookie);
	            service.keepLogin(user2.getId(), session.getId(), new Date(0));
	            
	            }
	      }
	      
	      User userCookie = (User) user;
          Cookie userIdCookie2 = new Cookie("userIdCookie", userCookie.getId());
          userIdCookie2.setPath("/");
          userIdCookie2.setMaxAge(60 * 60 * 24 * 7);
          response.addCookie(userIdCookie2);
          
          
	        User anotherUser = (User) user;
			Cookie CookieForUser = new Cookie("CookieForUser", URLEncoder.encode((anotherUser.getName()), "utf-8"));
			CookieForUser.setPath("/");
			CookieForUser.setMaxAge(60 * 60 * 24 * 7);
			response.addCookie(CookieForUser);
		
		rttr.addFlashAttribute("message", "success");
		
		return "redirect:/lobby/selectProject";
	}
	
	@RequestMapping(value = "/modifyView")
	@ResponseBody
	public ResponseEntity<User> modifyView(int userNo) throws Exception {
		ResponseEntity<User> entity = null;
		User user = null;
		
		logger.info("회원수정 정보 모달 테스트");

		try {
			
			user = service.get(userNo);
			
			entity = new ResponseEntity<User>(user, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<User>(HttpStatus.BAD_REQUEST);
		}
		
		
		return entity;
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
		
		User loginUser= service.get(userNo);
		String userPw = loginUser.getPassword();
		  try {
	    	  
	    	  logger.info("탈퇴합니다~~");
	    		  
	    	/**회원 비번이랑 입력한 비번이랑 다르면*/  
	    	  if(!password.equals(userPw)){
	    		  result="fail";
	    	  
	    	  }else{
	    		  result = "success";
	    		
	    		  service.delete(userNo);
	    	  };
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
	
	
	@RequestMapping(value = "/mailSender") 
	   public String mailSender(@RequestParam("user") String id, HttpServletRequest request, ModelMap mo, RedirectAttributes rttr) throws AddressException, MessagingException { 
		  logger.info("계정 활성화 테스트");
		  
		  String host = "smtp.gmail.com"; 
	      final String username = "kosta146146@gmail.com"; 
	      final String password = "kosta146"; 
	      int port=465; 
	      String recipient = id; 
	      String subject = "회원가입 인증메일입니다."; 
	      String content = "<a href='http://192.168.0.4/user/setStatus?user="+id+"'>회원 가입 인증</a>"; 
	      Properties props = System.getProperties(); 
	      // 정보를 담기 위한 객체 생성 
	      // SMTP 서버 정보 설정 
	      props.put("mail.smtp.host", host); 
	      props.put("mail.smtp.port", port); props.put("mail.smtp.auth", "true"); 
	      props.put("mail.smtp.ssl.enable", "true"); props.put("mail.smtp.ssl.trust", host); 
	      Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
	         String un=username; 
	         String pw=password; 
	         protected javax.mail.PasswordAuthentication getPasswordAuthentication() { 
	            return new javax.mail.PasswordAuthentication(un, pw); 
	            } 
	         }); 
	
	      session.setDebug(true); 
	      //for debug 
	      Message mimeMessage = new MimeMessage(session); 
	      mimeMessage.setFrom(new InternetAddress("kosta146146@gmail.com")); 
	      mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); 
	      mimeMessage.setSubject(subject); 
	      mimeMessage.setContent(content, "text/html; charset=utf-8");
	      Transport.send(mimeMessage); 
	      
		  rttr.addFlashAttribute("message", "success");
	      return "redirect:/";
	     	}
	
	
}

