package com.object.asc.lobby.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;

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

import com.object.asc.lobby.domain.ProjectList;
import com.object.asc.lobby.service.LobbyService;


/**
 * Lobby Controller
 */
@Controller
@RequestMapping("/lobby")
public class LobbyController {
	
	private static final Logger logger = LoggerFactory.getLogger(LobbyController.class);
	
	@Inject
	private LobbyService service;
	 
	@RequestMapping(value = "/selectProject", method = RequestMethod.GET)
	public String selectProject(Model model) {
		logger.info("간트 페이지 테스트");
		return "/lobby/selectProject";
	}
	
	@RequestMapping(value = "/selectProject", method = RequestMethod.POST)
	public String registerProject(@RequestParam("fileUpload")MultipartFile file, ProjectList projectList, Model model) {
		service.projectRegister(projectList, file);
		return "/lobby/selectProject";
	}
	
	@RequestMapping("/memberList")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> memberList(){
		ResponseEntity<Map<String, Object>> entity = null;
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("list", "list");
			map.put("pageMaker", "");
			
			entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
