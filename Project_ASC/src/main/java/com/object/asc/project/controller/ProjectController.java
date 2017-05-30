package com.object.asc.project.controller;

import java.io.File;
import java.io.IOException;
import java.util.Locale;
import java.util.UUID;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.object.asc.util.UploadFileUtils;

/**
 * Project Controller
 */
@Controller
@RequestMapping("/project")
public class ProjectController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);
	
	@Resource(name = "uploadPath")
	private String uploadPath;

	@RequestMapping(value = "/dashBoard", method = RequestMethod.GET)
	public String dashBoard(Locale locale, Model model) {
		logger.info("대쉬보드 테스트");
		
		return "/project/dashboard";
	}
	
	@RequestMapping(value = "/library", method = RequestMethod.GET)
	public String library(Locale locale, Model model) {
		logger.info("자료실 테스트");
		
		return "/project/library";
	}
	
	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public void upload() {}
	
	/**
	 * 파일 업로드 처리
	 * @param file	POST 방식으로 들어온 파일 데이터
	 * @param model	 스프링 MVC에서 제공하는 데이터 전달용 객체
	 * @throws Exception 
	 */
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public void upload(MultipartFile file, Model model) throws Exception {
		logger.info("원본 파일 : "+file.getOriginalFilename());
		logger.info("사이즈 : "+ file.getSize());
		logger.info("파일의 MIME 타입" + file.getContentType());
		
		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
		
		model.addAttribute("savedName", savedName);
	}
	
	/**
	 * 실제 파일 업로드
	 * @param originalName 	원본 파일 이름
	 * @param fileData			파일 데이터를 byte[]로 변환한 정보
	 * @return
	 * @throws Exception
	 */
	private String uploadFile (String originalName, byte[] fileData) throws Exception {
		UUID uuid = UUID.randomUUID();
		
		String savedName = uuid.toString() + "_" + originalName;
		
		File target = new File(uploadPath, savedName);
		
		FileCopyUtils.copy(fileData, target);	// 데이터가 담긴 바이트 배열을 파일에 기록
		
		return savedName;
	}
	
	/**
	 * Ajax를 사용한 파일 업로드
	 * @param file
	 * @return
	 * @throws Exception 
	 */
	@ResponseBody
	@RequestMapping(value = "/uploadAjax", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {
		logger.info("원본 파일 : "+file.getOriginalFilename());
		return new ResponseEntity<>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.CREATED);
	}
	
	@RequestMapping(value = "/member", method = RequestMethod.GET)
	public String member(Locale locale, Model model) {
		logger.info("참여 인원 테스트");
		
		return "/project/member";
	}	
}
