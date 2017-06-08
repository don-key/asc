package com.object.asc.project.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.object.asc.project.domain.LibraryList;
import com.object.asc.project.service.ProjectService;
import com.object.asc.user.domain.User;
import com.object.asc.user.service.UserService;
import com.object.asc.util.MediaUtils;
import com.object.asc.util.UploadFileUtils;

/**
 * Project Controller
 */
@Controller
@RequestMapping("/project")
public class ProjectController {

	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);
	
	@Inject
	private ProjectService projectService;
	
	@Inject
	private UserService userService;

	@Resource(name = "uploadPath")
	private String uploadPath;

	@RequestMapping(value = "/dashBoard", method = RequestMethod.GET)
	public String dashBoard(Locale locale, Model model) {
		logger.info("대쉬보드 테스트");
		String chatName = projectService.chatName(1);
		model.addAttribute("chatName", chatName);
		return "/project/dashboard";
	}

	@RequestMapping(value = "/library", method = RequestMethod.GET)
	public String library(Locale locale, Model model) {
		logger.info("자료실 입장~");
		
		logger.info("자료 내역 리스트 올~~~~~~~~~");
		List<LibraryList>  libraryLists= projectService.libraryListListAll();
		List<User> name = new ArrayList<User>();
		for (LibraryList libraryList : libraryLists) {
			name.add(userService.get(libraryList.getUserNo()));
		}
		model.addAttribute("list", projectService.libraryListListAll());		// 자료 내역 리스트 목록 뿌려주기
		model.addAttribute("name", name);
		return "/project/library";
	}
	
	/**
	 * 데이터베이스에 게시글 등록
	 * @param file
	 * @param uuidName
	 * @param libraryList
	 * @param rttr
	 * @return
	 */
	@RequestMapping(value = "/registLibraryList", method = RequestMethod.POST)
	public String libraryListRegist (@RequestParam("projectListNo") int projectListNo, @RequestParam("file") MultipartFile file,String uuidName, LibraryList libraryList, RedirectAttributes rttr) {
		logger.info("자료실 등록등록");
		logger.info("자료실 내역 : "+ libraryList.toString());
		 
		libraryList.setFileName(file.getOriginalFilename());
		libraryList.setUuidName(uuidName);
		
		projectService.libraryListRegister(projectListNo, libraryList);		// 매퍼를 통해 등록 메소드 호출
		
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/project/library";
	}

	/**
	 * 파일 업로드 처리
	 * 
	 * @param file
	 *            POST 방식으로 들어온 파일 데이터
	 * @param model
	 *            스프링 MVC에서 제공하는 데이터 전달용 객체
	 * @throws Exception
	 */
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public void upload(MultipartFile file, Model model) throws Exception {
		logger.info("원본 파일 : " + file.getOriginalFilename());
		logger.info("사이즈 : " + file.getSize());
		logger.info("파일의 MIME 타입" + file.getContentType());

		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());

		model.addAttribute("savedName", savedName);
	}
	
	@RequestMapping(value = "/uploadForm", method = RequestMethod.POST)
	public String uploadForm(MultipartFile file, Model model) throws Exception {
		logger.info("원본 파일 : " + file.getOriginalFilename());
		logger.info("사이즈 : " + file.getSize());
		logger.info("파일의 MIME 타입" + file.getContentType());

		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());

		model.addAttribute("savedName", savedName);
		
		return "/library";
	}

	/**
	 * 실제 파일 업로드
	 * 
	 * @param originalName
	 *            원본 파일 이름
	 * @param fileData
	 *            파일 데이터를 byte[]로 변환한 정보
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
		logger.info("원본 파일 : " + file.getOriginalFilename());
		return new ResponseEntity<>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.CREATED);
	}
	
	

	@RequestMapping(value = "/member", method = RequestMethod.GET)
	public String member(Locale locale, Model model) {
		logger.info("참여 인원 테스트");

		return "/project/member";
	}

	
	/**
	 * 특정 URI를 호출했을 때 업로드 된 파일이 제대로 보이게 처리
	 * @param fileName		브라우저에서 전송받기를 원하는 파일 이름
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;

		logger.info("파일 이름 : " + fileName);

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
	 * 파일 등록 모달에서 삭제 처리 (폴더의 사진)
	 * @param fileName		삭제할 파일 이름
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/deleteFile", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName) {
		logger.info("삭제할 파일 : " + fileName);
		
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
	
	@ResponseBody
	@RequestMapping(value = "/deleteAllFiles", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(@RequestParam("files[]") String[] files) {
		logger.info("삭제할 모든 파일 : " + files);
		
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
	 * 자료 내역 삭제
	 * @param libraryListNo 삭제할 자료 내역 번호
	 * @param rttr
	 * @return
	 */
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(@RequestParam("libraryListNo") int libraryListNo, RedirectAttributes rttr) {
		logger.info("자료 내역 "+libraryListNo+"번 글 삭제 처리 요청");
		
		projectService.libraryListDelete(libraryListNo);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/project/library";
	}
	
}
