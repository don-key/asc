package com.object.asc.lobby.controller;

import java.util.ArrayList;
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
import com.object.asc.user.service.UserService;


/**
 * Lobby Controller
 */
@Controller
@RequestMapping("/lobby")
public class LobbyController {
	
	private static final Logger logger = LoggerFactory.getLogger(LobbyController.class);
	
	@Inject
	private LobbyService lobbyService;
	
	@Inject
	private UserService userService;
	 
	@RequestMapping(value = "/selectProject", method = RequestMethod.GET)
	public String selectProject(Model model) {
		logger.info("간트 페이지 테스트");
		List<ProjectList> list = lobbyService.projectListAll();
		List<Integer> memberCount = new ArrayList<Integer>();
		for (ProjectList projectList : list) {
			memberCount.add(lobbyService.memberCount(projectList.getProjectJoinNo()));
		}
		
		model.addAttribute("list", list);
		model.addAttribute("count", memberCount);
		return "/lobby/selectProject";
	}
	
	@RequestMapping(value = "/selectProject", method = RequestMethod.POST)
	public String registerProject(@RequestParam("fileUpload")MultipartFile file, String[] invitationList, ProjectList projectList, Model model) {
		lobbyService.projectRegister(projectList, file, invitationList);
		return "redirect:/lobby/selectProject";
	}
	
	@RequestMapping("/memberList")
	@ResponseBody
	public ResponseEntity<List<String>> memberList(String id){
		ResponseEntity<List<String>> entity = null;
		
		try {
			List<String> List = userService.userFind(id);
			entity = new ResponseEntity<List<String>>(List, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<String>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/project", method=RequestMethod.GET)
	public String enterProject(@RequestParam("listNo") int listNo, Model model){
		
		/** 변수명은 나중에 url 정리하기 */
		return "redirect:/project/dashBoard?projectListNo="+listNo;
	}
}
