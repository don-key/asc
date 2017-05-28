package com.object.asc.user.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * User Controller
 */
@Controller
@RequestMapping("/user")
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	 
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String release(Locale locale, Model model) {
		logger.info("릴리즈카테고리 테스트");
		
		return "/index";
	}
	 

	

	
}
