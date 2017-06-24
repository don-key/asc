package com.object.asc.scrum.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Scrum Controller
 */
@Controller
@RequestMapping("/scrum")
public class ScrumController {
	
	private static final Logger logger = LoggerFactory.getLogger(ScrumController.class);

	@RequestMapping(value = "/taskBoard", method = RequestMethod.GET)
	public String taskBoard(Locale locale, Model model) {
		
		return "/scrum/taskBoard";
	}
	
	@RequestMapping(value = "/releasePlanning", method = RequestMethod.GET)
	public String release(Locale locale, Model model) {
		
		return "/scrum/releasePlanning";
	}
	
	
}
