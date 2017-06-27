package com.object.asc.project.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.object.asc.lobby.domain.ProjectList;
import com.object.asc.lobby.service.LobbyService;
import com.object.asc.log.service.LogService;
import com.object.asc.project.domain.LibraryList;
import com.object.asc.project.service.ProjectService;
import com.object.asc.user.domain.User;
import com.object.asc.user.service.UserService;
import com.object.asc.util.MediaUtils;
import com.object.asc.util.UploadFileUtils;

/**
 * 
 * 대시보드, 자료실 관련 프로젝트 Controller
 * @RequestMapping("/project") URI 매칭
 * 
 * @패키지 : com.object.asc.project.controller
 * @파일명 : ProjectController.java
 * @작성자 : 이종윤
 * @작성일 : 2017. 6. 01.
 *
 */
@Controller
@RequestMapping("/project")
public class ProjectController {

	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);
	
	@Inject
	private ProjectService projectService;
	
	@Inject
	private UserService userService;
	
	@Inject
	private LobbyService lobbyService;
	
	@Inject
	private LogService logService;

	@Resource(name = "uploadPath")
	private String uploadPath;
	
   /**
    * 
    * 프로젝트 번호와 회원 번호를 가지고 대시보드 페이지로 이동
    * 
    * @Method Name : dashBoard
    * @param projectListNo     프로젝트 번호
    * @param locale
    * @param model 
    * @param userNo            회원 번호
    * @return 
    */	
	@RequestMapping(value = {"/dashBoard/{projectListNo}/{userNo}"}, method = RequestMethod.GET)
	public String dashBoard(@PathVariable int projectListNo, Locale locale, Model model, @PathVariable int userNo) {
		
  		String memo = projectService.getMemo(projectService.findDashBoard(projectListNo, userNo));
  		ProjectList projectList = new ProjectList();
  		projectList = lobbyService.projectDate(projectListNo);
  		Date endDate = projectList.getEndDate();
  		
  		User user = userService.get(userNo);
  		
  		List<String> todayList = projectService.todayListDashboard(projectListNo, user.getName());
  		
  		String actionPercent = projectService.getActionPercent(projectListNo);
  		
  		
  		model.addAttribute("memo", memo);
  		model.addAttribute("endDate", endDate);
  		model.addAttribute("todayList", todayList);
  		model.addAttribute("actionPercent", actionPercent);
  		model.addAttribute("projectListNo", projectListNo);
  		
		return "/project/dashboard";
	}
	
   /**
    * 
    * 메모 작성
    * 
    * @Method Name : memoUpdate
    * @param memo               작성한 메모 객체
    * @param projectListNo      프로젝트 번호
    * @param userNo             회원 번호
    * @param rttr
    * @return
    */
	@RequestMapping(value = "/memoUpdate", method = RequestMethod.POST)
	public String memoUpdate (String memo, int projectListNo, int userNo, RedirectAttributes rttr) {
		int dashBoardNo = projectService.findDashBoard(projectListNo, userNo);
		projectService.memoUpdate(dashBoardNo, memo);
		
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/project/dashBoard/"+projectListNo+"/"+userNo;
	}
	
   /**
    * 프로젝트 번호와 회원 번호를 가지고 자료실 페이지로 이동
    *
    * @Method Name : library
    * @param locale
    * @param model
    * @param projectListNo     프로젝트 번호
    * @param userNo            회원 번호
    * @return
    */
	@RequestMapping(value = "/library/{projectListNo}/{userNo}", method = RequestMethod.GET)
	public String library(Locale locale, Model model, @PathVariable int projectListNo, @PathVariable int userNo) {
		List<LibraryList>  libraryLists= projectService.libraryListListAll(projectListNo);
		List<User> name = new ArrayList<User>();
		for (LibraryList libraryList : libraryLists) {
			name.add(userService.get(libraryList.getUserNo()));
		}
		model.addAttribute("list", libraryLists);		// 자료 내역 리스트 목록 뿌려주기
		model.addAttribute("name", name);
		model.addAttribute("projectListNo", projectListNo);
		model.addAttribute("userNo", userNo);
		return "/project/library";
	}
	
   /**
    * 
    * 데이터베이스에 게시글 등록
    * 
    * @param file
    * @param uuidName
    * @param libraryList
    * @param rttr
    * @return
    */
	@RequestMapping(value = "/registLibraryList", method = RequestMethod.POST)
	public String libraryListRegist (int projectListNo, @RequestParam("file") MultipartFile file,String uuidName, LibraryList libraryList, RedirectAttributes rttr, int userNo) {
		 
		libraryList.setFileName(file.getOriginalFilename());
		libraryList.setUuidName(uuidName);
		libraryList.setLibraryNo(projectListNo);
		
		projectService.libraryListRegister(libraryList); // 매퍼를 통해 등록 메소드 호출
		
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/project/library/"+projectListNo+"/"+userNo;
	}

	/**
	 * 
	 * 파일 업로드 처리
	 * 
	 * @param file      POST 방식으로 들어온 파일 데이터
	 * @param model     스프링 MVC에서 제공하는 데이터 전달용 객체
	 * @throws Exception
	 */
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public void upload(MultipartFile file, Model model) throws Exception {

		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());

		model.addAttribute("savedName", savedName);
	}
	
	@RequestMapping(value = "/uploadForm", method = RequestMethod.POST)
	public String uploadForm(MultipartFile file, Model model) throws Exception {

		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());

		model.addAttribute("savedName", savedName);
		
		return "/library";
	}

	/**
	 * 
	 * 실제 파일 업로드
	 * 
	 * @param originalName  원본 파일 이름
	 * @param fileData      파일 데이터를 byte[]로 변환한 정보
	 * @return
	 * @throws Exception
	 */
	private String uploadFile(String originalName, byte[] fileData) throws Exception {
		UUID uuid = UUID.randomUUID();

		String savedName = uuid.toString() + "_" + originalName;

		File target = new File(uploadPath, savedName);

		FileCopyUtils.copy(fileData, target); // 데이터가 담긴 바이트 배열을 파일에 기록

		return savedName;
	}

	/**
	 * Ajax를 사용한 파일 업로드
	 * 
	 * @param file
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/uploadAjax", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {
		return new ResponseEntity<>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.CREATED);
	}
	
	
   /**
    * 
    * 참여멤버 조회 메소드
    *
    * @Method Name : member
    * @param projectListNo
    * @param model
    * @return
    */
	@RequestMapping(value = "/member/{projectListNo}", method = RequestMethod.GET)
	public String member(@PathVariable int projectListNo, Model model) {
		SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		Calendar cal = Calendar.getInstance();
		String status = null;
		int index = 0;
		Map<Integer, List<String>> map = new HashMap<Integer, List<String>>();
		
		
		List<Map<String, Object>> joinListMap = lobbyService.memberId(projectListNo);
		for (Map<String, Object> row : joinListMap) {
			List<String> joinList = new ArrayList<String>();
			String id = (String) row.get("id");
			String name = (String) row.get("name");
			String phone = (String) row.get("phone");
			String photo = (String) row.get("photo");
			row.get("recentLogin");
			cal.setTime((Date) row.get("recentLogin"));
			cal.add(Calendar.HOUR, -9);
			String recentLogin = sdformat.format(cal.getTime());
			
			int stautsInt = (int) row.get("status");
			if(stautsInt == 1) status = "스크럼";
			else status = "팀원";
			joinList.add(id);
			joinList.add(name);
			joinList.add(phone);
			joinList.add(photo);
			joinList.add(recentLogin.toString());
			joinList.add(status);
			map.put(index, joinList);
			index++;
			System.out.println(row.get("recentLogin"));
			System.out.println(recentLogin);
		}
		model.addAttribute("map", map);
		return "/project/member";
	}

	
	/**
	 * 
	 * 특정 URI를 호출했을 때 업로드 된 파일이 제대로 보이게 처리
	 * 
	 * @param fileName		브라우저에서 전송받기를 원하는 파일 이름
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/library/{projectListNo}/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;

		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);	// 파일 확장자 이름

			MediaType mType = MediaUtils.getMediaType(formatName);	// 파일 이름에서 확장자 추출하고, 이미지 타입일 경우 적절한 MIME 타입 지정

			HttpHeaders headers = new HttpHeaders();

			in = new FileInputStream(uploadPath + fileName);

			if (mType != null) {
				int length =  fileName.length();
		    	String front = fileName.substring(0,5);
		    	String end = fileName.substring(7, length);
		    	String realImage = front+end;

		    	headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);	// 이미지가 아닌 경우 MIME 타입을 다운로드용으로 지정
				headers.add("Content-Disposition", "attachment; filename=\"" + realImage +"\"");
			} else {
				fileName = fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);	// 이미지가 아닌 경우 MIME 타입을 다운로드용으로 지정
				headers.add("Content-Disposition", "attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
			}
			
			entity = new ResponseEntity<byte[]> (IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]> (HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		
		return entity;
	}
	
	/**
	 * 
	 * 파일 등록 모달에서 삭제 처리 (폴더의 사진)
	 * 
	 * @param fileName		삭제할 파일 이름
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/deleteFile", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName) {
		
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
		
		MediaType mType = MediaUtils.getMediaType(formatName);
		
		if (mType != null) {
			String front = fileName.substring(0, 5);	// /asc 경로 추출
			String end = fileName.substring(7); 	// s_ 제거
			
			new File(uploadPath + (front+end).replace('/', File.separatorChar)).delete();
		}
		
		new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
		
		return new ResponseEntity<String> ("deleted", HttpStatus.OK);
	}
   /**
    * 
    * 업로드한 파일 삭제
    *
    * @Method Name : deleteFile
    * @param files      삭제할 파일
    * @return
    */
	@ResponseBody
	@RequestMapping(value = "/deleteAllFiles", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(@RequestParam("files[]") String[] files) {
		
		if (files == null || files.length == 0) {
			return new ResponseEntity<String>("deleted", HttpStatus.OK);
		}
		
		for (String fileName : files) {
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
			
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			if (mType != null) {
				String front = fileName.substring(0, 5);	// /asc 경로 추출
				String end = fileName.substring(7); 	// s_ 제거
				
				new File(uploadPath + (front+end).replace('/', File.separatorChar)).delete();
			}
			
			new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
		}
		
		return new ResponseEntity<String> ("deleted", HttpStatus.OK);
	}
	
	/**
	 * 
	 * 자료 내역 삭제
	 * 
	 * @param libraryListNo 삭제할 자료 내역 번호
	 * @param rttr
	 * @return
	 */
	@RequestMapping(value = "/remove/{projectListNo}/{userNo}", method = RequestMethod.POST)
	public String remove(@RequestParam int libraryListNo, RedirectAttributes rttr, @PathVariable int projectListNo,@PathVariable int userNo) {
		
		projectService.libraryListDelete(libraryListNo, projectListNo);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/project/library/"+projectListNo+"/"+userNo;
	}
	
	/**
	 * 
	 * 채팅방 이름 리턴 메소드
	 * 
	 * @Method Name : getChatName
	 * @param projectListNo
	 * @param response
	 */
	@RequestMapping(value="/getChatName", method=RequestMethod.POST)
	 	public void getChatName(int projectListNo, HttpServletResponse response){
	 		String chatName = projectService.chatName(projectListNo);
	 		
	 		try {
	 			response.getWriter().print(chatName);
	 		} catch (IOException e) {
	 			e.printStackTrace();
	 		}
	 		
	 	}
	/**
	 * 
	 * 현재 스프린트 넘버 리턴 메소드
	 * 
	 * @Method Name : getSprintNo
	 * @param scrumNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/getSprintNo")
	public ResponseEntity<Integer> getSprintNo(int scrumNo) {
		ResponseEntity<Integer> entity = null;
		int sprintNo = projectService.getSprintNo(scrumNo);
		
		try {
			entity = new ResponseEntity<Integer> (sprintNo, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Integer>(HttpStatus.BAD_REQUEST);
		}
		return entity; 
	}
	
	/**
	 * 
	 * 각 유저의 수정 사항 리턴하여 수정 사항 페이지에 출력
	 * 
	 * @Method Name : log
	 * @param projectListNo
	 * @param userNo
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/log/{projectListNo}/{userNo}", method = RequestMethod.GET)
	public String log(@PathVariable int projectListNo, @PathVariable int userNo, Model model) {
		List<String> front = new ArrayList<String>();
		List<String> end = new ArrayList<String>();
		List<String> list = logService.logListAll(projectListNo, userNo);
		
		for (String logContent : list) {
			StringTokenizer st = new StringTokenizer(logContent, "##");
			front.add(st.nextToken());
			end.add(st.nextToken());
		}
		model.addAttribute("front", front);
		model.addAttribute("end", end);
		return "/project/log";
	}
	
	/**
	 * 
	 * 로그 메일 센더 메소드 (프로젝트 참여 회원 모두에게 전송)
	 * 
	 * @Method Name : mailSender
	 * @param projectListNo
	 * @param id
	 * @param userNo
	 * @param request
	 * @param rttr
	 * @param model
	 * @return
	 * @throws AddressException
	 * @throws MessagingException
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value = "/sendMail/{projectListNo}/{id}/{userNo}") 
    public String mailSender(@PathVariable int projectListNo, @PathVariable String id, @PathVariable int userNo,HttpServletRequest request, RedirectAttributes rttr, Model model) throws AddressException, MessagingException, UnsupportedEncodingException { 
	  
		  String host = "smtp.gmail.com"; 
	      final String username = "kosta146146@gmail.com"; 
	      final String password = "kosta146"; 
	      int port=465;
	      String str = "";
	      List<String> list = logService.logListAll(projectListNo, userNo);
	      ProjectList projectList = lobbyService.getProjectList(projectListNo);
	      for (String logContent : list) {
				StringTokenizer st = new StringTokenizer(logContent, "##");
				str += st.nextToken() + "　";
				str += st.nextToken() + "<br>";
		  }
	      String subject = "["+projectList.getProjectName()+"] 프로젝트의 수정사항 메일입니다."; 
	      String content = "<html>"+
	    	        "<head><title></title></head>"+
	    	        "<body>"+ str +
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
	      
	      /** 참여 멤버 받아오고 메일 다 보내줌 */
	      List<Map<String, Object>> joinListMap = lobbyService.memberId(projectListNo);
			for (Map<String, Object> row : joinListMap) {
				String recipient = (String) row.get("id");
				Message mimeMessage = new MimeMessage(session); 
		        mimeMessage.setFrom(new InternetAddress("kosta146146@gmail.com")); 
		        mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); 
		        mimeMessage.setSubject(MimeUtility.encodeText(subject, "UTF-8", "B")); 
		        mimeMessage.setContent(content, "text/html; charset=utf-8");
		        Transport.send(mimeMessage); 
		  } 
	      
		  rttr.addFlashAttribute("msg", "SUCCESS");
	      return "redirect:/project/log/"+projectListNo+"/"+userNo;

   }
	
}
