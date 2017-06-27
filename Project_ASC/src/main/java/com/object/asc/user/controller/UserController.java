package com.object.asc.user.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Date;
import java.util.Locale;
import java.util.Properties;

import javax.inject.Inject;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
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
 * 
 * 회원 관련 프로젝트 Controller
 * @RequestMapping("/user") URI 매칭
 * 
 * @패키지 : com.object.asc.user.controller
 * @파일명 : UserController.java
 * @작성자 : 이현명
 * @작성일 : 2017. 6. 01. 
 *
 */
@Controller
@RequestMapping("/user")
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	 
	@Inject
	private UserService service;
	
	User user;
	
   /**
    * 
    * 회원가입 모달에 입력한 정보 저장
    * 
    * @Method Name : register
    * @param photo
    * @param uuidName
    * @param user
    * @param rttr
    * @return
    */
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(@RequestParam("fileupload")MultipartFile photo, String uuidName, User user, RedirectAttributes rttr) {
		
		user.setPhoto(uuidName);
		logger.info(photo.getOriginalFilename());
		if(photo.getOriginalFilename().equals("")){
			user.setPhoto("/asc/noimage2.png");
		}
		service.register(user);
		rttr.addFlashAttribute("message", "success");
		
		return "redirect:/user/mailSender?user="+user.getId();
	}
	
   /**
    * 
    * 회원가입 모달에서 아이디 중복 검사
    * 
    * @Method Name : idCheck
    * @param registerId
    * @return
    */
	@RequestMapping(value = "/idCheck")
	@ResponseBody
	public ResponseEntity<String> idCheck(@RequestParam("registerId") String registerId) {
		ResponseEntity<String> entity = null;
	    
		String result = "";
		
	      try {
	    	  
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
	
   /**
    * 
    * 가입한 회원의 모든 정보 받아오기
    * 
    * @Method Name : get
    * @param user
    */
	@RequestMapping(value="/get", method = RequestMethod.GET)
	public void get(User user){
		
		service.get(user.getUserNo());
		
	}
	
   /**
    * 
    * 가입회원과 탈퇴한 회원을 구별하기 위해서 상태를 부여
    * 
    * @Method Name : setStatus
    * @param id
    * @param rttr
    * @return
    */
	@RequestMapping(value="/setStatus")
	public String setStatus(@RequestParam("user")String id, RedirectAttributes rttr){
		
		service.setStatus(id);
		
		rttr.addFlashAttribute("setStatus", "status");
		return "redirect:/";
	}
	
   /**
    * 
    * 회원의 수정 정보를 입력받아 저장
    * 
    * @Method Name : modify
    * @param photo
    * @param uuidName
    * @param user
    * @param session
    * @param request
    * @param response
    * @param rttr
    * @return
    * @throws Exception
    */	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(@RequestParam("fileupload")MultipartFile photo, String uuidName, User user, HttpSession session, HttpServletRequest request, HttpServletResponse response, RedirectAttributes rttr) throws Exception {
		
		if(photo.getOriginalFilename().equals("")){
			user.setPhoto("/asc/noimage2.png");
			uuidName="/asc/noimage2.png";
	    }else{
	    	user.setPhoto(uuidName);
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
          
			Cookie CookieForUser = new Cookie("CookieForUser", URLEncoder.encode((userCookie.getName()), "utf-8"));
			CookieForUser.setPath("/");
			CookieForUser.setMaxAge(60 * 60 * 24 * 7);
			response.addCookie(CookieForUser);
			
			
			/*쿠키에 사진 저장*/
			Cookie photoCookie = new Cookie("photoCookie", URLEncoder.encode(uuidName, "utf-8"));
			photoCookie.setPath("/");
			photoCookie.setMaxAge(60 * 60 * 24 * 7);
			response.addCookie(photoCookie);
		
		rttr.addFlashAttribute("message", "success");
		
		return "redirect:/lobby/selectProject";
	}
	
   /**
    * 
    * 수정된 회원정보 조회
    * 
    * @Method Name : modifyView
    * @param userNo
    * @return
    * @throws Exception
    */
	@RequestMapping(value = "/modifyView")
	@ResponseBody
	public ResponseEntity<User> modifyView(int userNo) throws Exception {
		ResponseEntity<User> entity = null;
		User user = null;
		
		try {
			user = service.get(userNo);
			
			entity = new ResponseEntity<User>(user, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<User>(HttpStatus.BAD_REQUEST);
		}
		
		
		return entity;
	}
   /**
    * 
    * 로그인 실행
    * 
    * @Method Name : loginPOST
    * @param user
    * @param session
    * @param model
    */	
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
	
   /**
    * 
    * 로그아웃 실행
    * 
    * @Method Name : logout
    * @param request
    * @param response
    * @param session
    * @return
    */	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session ) {
		
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
	
   /**
    * 
    * 회원의 상태를 탈퇴회원으로 변경
    * 
    * @Method Name : delete
    * @param userNo
    * @param password
    * @param repassword
    * @return
    */	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<String> delete(@RequestParam("userNo") int userNo, String password, String repassword) {
		ResponseEntity<String> entity = null;
		
		String result="";
		
		User loginUser= service.get(userNo);
		String userPw = loginUser.getPassword();
		  try {
	    	  
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
	
   /**
    * 
    * 회원가입시 입력한 정보로 아이디를 조회
    * 
    * @Method Name : findId
    * @param name
    * @param phone
    * @return
    */	
	@RequestMapping(value = "/findId")
	@ResponseBody
	public ResponseEntity<String> findId(String name, String phone) {
		ResponseEntity<String> entity = null;
	      
	      try {
	    	  String returnId = service.findId(name, phone);
	    	  entity = new ResponseEntity<String>(returnId, HttpStatus.OK);
	    	  
	      } catch (Exception e) {
	         e.printStackTrace();
	         entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
	      }
	      return entity;
	}
	
   /**
    * 
    * 회원가입시 입력한 정보로 비밀번호를 조회
    * 
    * @Method Name : findPw
    * @param id
    * @param name
    * @param phone
    * @return
    */	
	@RequestMapping(value = "/findPw")
	@ResponseBody
	public ResponseEntity<String> findPw(String id, String name, String phone) {
		ResponseEntity<String> entity = null;
	      
	      try {
	    	  String returnPw = service.findPw(id, name, phone);
	    	  entity = new ResponseEntity<String>(returnPw, HttpStatus.OK);
	    	  
	      } catch (Exception e) {
	         e.printStackTrace();
	         entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
	      }
	      return entity;
	}

   /**
    * 
    * 새로운 비밀번호를 생성
    * 
    * @Method Name : createNewPw
    * @param password
    * @param id
    * @return
    */
	@RequestMapping(value = "/createNewPw")
	@ResponseBody
	public ResponseEntity<String> createNewPw(@RequestParam("password")String password, @RequestParam("id")String id) {
		ResponseEntity<String> entity = null;
	      
	      try {
	    	  service.createNewPw(id, password);
	    	  
	    	  String success ="success";
	    	  
	    	  entity = new ResponseEntity<String>(success, HttpStatus.OK);
	      } catch (Exception e) {
	         e.printStackTrace();
	         entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
	      }
	      return entity;
	}
	
   /**
    * 
    * 회원가입시 입력한 아이디(메일주소)로 인증확인을 위한 메일을 보낸다.
    * 회원가입 등록 모달(뷰 페이지)에서 submit을 하면, 컨트롤러를 통해서 메일전송을 하는 메소드를 실행한다. 
    * 1. pom.xml에서 메일을 보내기위한 dependency를 등록한다. 
    * 2. 정보(발신자의 메일주소, 비밀번호, 메일 포트번호)를 담기 위한 객체를 생성하고, 실제 메일을 보내는 역할을 하는 SMTP 서버 정보를 설정한다.
    * 
    * @Method Name : mailSender
    * @param id
    * @param request
    * @param mo
    * @param rttr
    * @return
    * @throws AddressException
    * @throws MessagingException
    * @throws UnsupportedEncodingException
    */
	@RequestMapping(value = "/mailSender") 
	   public String mailSender(@RequestParam("user") String id, HttpServletRequest request, ModelMap mo, RedirectAttributes rttr) throws AddressException, MessagingException, UnsupportedEncodingException { 
		  String host = "smtp.gmail.com"; 
	      final String username = "kosta146146@gmail.com"; 
	      final String password = "kosta146"; 
	      int port=465; 
	      String recipient = id; 
	      String subject = "회원가입 인증메일입니다."; 
	      String content = "<html>"+
	    	        "<head><title></title></head>"+
	    	        "<body>"+
	    	        "<div style='text-align:center;'>"+
	    	        "<IMG src='http://postfiles13.naver.net/MjAxNzA2MTVfMjQg/MDAxNDk3NTA2MTAzMTY5.CzFDfnyPG7dutsdYF8KabA9_ALStZikgPLjxG7kEFvwg.vhxFSJd_gIShKMD9F6mpQRdl_Kk6ZHC1a3NFFOXRAvEg.PNG.a_spree/mail.png?type=w2' width=50%><br>"+
	    	        "<a href='http://localhost/user/setStatus?user="+id+"'><img src='http://postfiles13.naver.net/MjAxNzA2MTVfMTkx/MDAxNDk3NTA2MTAzNDMx.Q8n_o_gkvkeMhLV_ptC85tDVg_HPYlS2Ajq6Mt-IHTYg.vjN_BmQc7BoVoE2xwUxiSYaR8siXdcnvAhwukHgfwxwg.PNG.a_spree/mail2.png?type=w2' width=40%></a><br>"+
	    	        "</div>"+
	    	        "</body>"+
	    	        "</html>";
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
	      mimeMessage.setSubject(MimeUtility.encodeText(subject, "UTF-8", "B"));
	      mimeMessage.setContent(content, "text/html; charset=utf-8");
	      Transport.send(mimeMessage); 
	      
		  rttr.addFlashAttribute("message", "success");
	      return "redirect:/";
	}
}

