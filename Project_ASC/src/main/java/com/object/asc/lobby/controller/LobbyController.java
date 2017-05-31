package com.object.asc.lobby.controller;

import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	public String registerProject(ProjectList projectList, Model model) {
		
		service.register(projectList);
		return "/lobby/selectProject";
	}
	
}
