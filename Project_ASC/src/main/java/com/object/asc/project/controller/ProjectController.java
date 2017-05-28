package com.object.asc.project.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Project Controller
 */
@Controller
@RequestMapping("/project")
public class ProjectController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);

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
	
	
}
