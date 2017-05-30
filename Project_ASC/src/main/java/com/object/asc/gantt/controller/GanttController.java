package com.object.asc.gantt.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * GanttChart Controller
 */
@Controller
@RequestMapping("/gantt")
public class GanttController {
	
	private static final Logger logger = LoggerFactory.getLogger(GanttController.class);
	
	@RequestMapping(value = "/ganttChart", method = RequestMethod.GET)
	public String ganttChart(Model model) {
		logger.info("간트 페이지 테스트");
		return "/gantt/ganttChart";
	}
	
	@RequestMapping(value = "/currentChart", method = RequestMethod.GET)
	public String currentChart(Model model) {
		logger.info("간트 페이지 테스트");
		return "/gantt/currentChart";
	}
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test(Model model) {
		logger.info("간트 테스트 페이지");
		return "/gantt/ganttTest";
	}
	
	 
	 

	

	
}
