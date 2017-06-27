package com.object.asc.lobby.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
 
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.object.asc.lobby.domain.ProjectList;
import com.object.asc.lobby.service.LobbyService;
import com.object.asc.user.service.UserService;


/**
 *
 * 로비 컨트롤러 
 * @RequestMapping("/lobby") URI 매칭
 * 
 * @패키지 : com.object.asc.lobby.controller
 * @파일명 : LobbyController.java
 * @작성자 : 김동현
 * @작성일 : 2017. 6. 01.
 *
 */
@Controller
@RequestMapping("/lobby")
public class LobbyController {
	
	private static final Logger logger = LoggerFactory.getLogger(LobbyController.class);
	
	@Inject
	private LobbyService lobbyService;
	
	@Inject
	private UserService userService;
	
	/**
	 * 
	 * 로비 페이지 이동 메소드
	 * 
	 * @Method Name : selectProject
	 * @param userIdCookie
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/selectProject", method = RequestMethod.GET)
	public String selectProject(@CookieValue(value="userIdCookie") String userIdCookie,Model model) {
		int userNo = userService.userIdFind(userIdCookie);
		List<ProjectList> list = lobbyService.projectListAll(userNo);
		List<Integer> memberCount = new ArrayList<Integer>();
		List<Map<String, Object>> invitationListMap = null;
		List<String> sId = new ArrayList<String>();
		List<String> sName = new ArrayList<String>();
		
		
		for (ProjectList projectList : list) {
			memberCount.add(lobbyService.memberCount(projectList.getProjectJoinNo()));
			invitationListMap = lobbyService.memberId(projectList.getProjectJoinNo());
			sId.add((String) invitationListMap.get(0).get("id"));
			sName.add((String) invitationListMap.get(0).get("name"));
		}
		
		model.addAttribute("list", list);
		model.addAttribute("count", memberCount);
		model.addAttribute("id", sId);
		model.addAttribute("name", sName);
		return "/lobby/selectProject";
	}
	
	/**
	 * 
	 * 프로젝트 등록 메소드
	 * 
	 * @Method Name : registerProject
	 * @param file
	 * @param invitationList
	 * @param projectList
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/selectProject", method = RequestMethod.POST)
	public String registerProject(@RequestParam("fileUpload")MultipartFile file, String[] invitationList, ProjectList projectList, Model model) {
		lobbyService.projectRegister(projectList, file, invitationList);
		return "redirect:/lobby/selectProject";
	}
	
	/**
	 * 
	 * 프로젝트 수정 메소드
	 * 
	 * @Method Name : updateProject
	 * @param file
	 * @param invitationList
	 * @param projectList
	 * @param listNo
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/updateProject", method = RequestMethod.POST)
	public String updateProject(@RequestParam("fileUpload")MultipartFile file, String[] invitationList, ProjectList projectList, int listNo,Model model){
		projectList.setProjectListNo(listNo);
		lobbyService.projectUpdate(projectList, file, invitationList);
		return "redirect:/lobby/selectProject";
	}
	
	/**
	 * 
	 * 프로젝트 삭제 메소드
	 * 
	 * @Method Name : deleteProject
	 * @param projectListNo
	 * @return
	 */
	@RequestMapping(value= "/deleteProject", method = RequestMethod.GET)
	public String deleteProject(int projectListNo){
		lobbyService.projectListDelete(projectListNo);
		return "redirect:/lobby/selectProject";
	}
	
	/**
	 * 
	 * 프로젝트 참여 멤버 조회 메소드
	 * 
	 * @Method Name : memberList
	 * @param id
	 * @return
	 */
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
	
	/**
	 * 
	 * 프로젝트 수정 메소드
	 * 
	 * @Method Name : modifyProject
	 * @param projectListNo
	 * @return
	 */
	@RequestMapping("/modifyProject")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> modifyProject(int projectListNo){
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> map = new HashMap<String, Object>();
		ProjectList projectList = null;
		List<Map<String, Object>> invitationListMap = null;
		List<String> invitationList = new ArrayList<String>();
		
		
		try {
			projectList = lobbyService.getProjectList(projectListNo);
			invitationListMap = lobbyService.memberId(projectListNo);
			int conut = 0;
			for (Map<String, Object> row : invitationListMap) {
				String id = (String) row.get("id");
				if(conut>0){
					invitationList.add(id);
				}
				conut++;
			}
			map.put("projectList", projectList);
			map.put("invitationList", invitationList);
			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity; 
	}
	
	/**
	 * 
	 * 프로젝트 입장 메소드
	 * 
	 * @Method Name : enterProject
	 * @param listNo
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/project", method=RequestMethod.GET)
	public String enterProject(@RequestParam("listNo") int listNo, Model model){
		
		return "redirect:/project/dashBoard?projectListNo="+listNo;
	}
	
	/**
	 * 
	 * 도움말 페이지 이동 메소드
	 * 
	 * @Method Name : help
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/help", method=RequestMethod.GET)
	public String help(Model model){
		
		return "/lobby/help";
	}
}
