package com.object.asc.lobby.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Lobby Controller
 */
@Controller
@RequestMapping("/lobby")
public class LobbyController {
	
	private static final Logger logger = LoggerFactory.getLogger(LobbyController.class);
	
	 
	@RequestMapping(value = "/selectProject", method = RequestMethod.GET)
	public String selectProject(Model model) {
		logger.info("간트 페이지 테스트");
		return "/lobby/selectProject";
	}
	
}
