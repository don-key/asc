package com.object.asc;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class IndexController {
	
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "main/index";
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Locale locale, Model model) {
		logger.info("메인 페이지 테스트");
		
		return "main";
	}

	@RequestMapping(value = "/scrum/taskBoard", method = RequestMethod.GET)
	public String taskBoard(Locale locale, Model model) {
		logger.info("태스크보드 테스트");
		
		return "scrum/taskBoard";
	}
	
	@RequestMapping(value = "/scrum/releasePlanning", method = RequestMethod.GET)
	public String release(Locale locale, Model model) {
		logger.info("릴리즈카테고리 테스트");
		
		return "scrum/releasePlanning";
	}
	
	@RequestMapping(value = "/main/gant", method = RequestMethod.GET)
	public String gant(Locale locale, Model model) {
		logger.info("간트 테스트 페이지");
		
		return "main/gant";
	}
	
	@RequestMapping(value = "/chat", method = RequestMethod.GET)
	public String chat(Locale locale, Model model) {
		logger.info("채팅 테스트");
		
		return "chat";
	}
	
	@RequestMapping(value = "/library/library", method = RequestMethod.GET)
	public String library(Locale locale, Model model) {
		logger.info("자료실 테스트");
		
		return "/library/library";
	}

	
}
