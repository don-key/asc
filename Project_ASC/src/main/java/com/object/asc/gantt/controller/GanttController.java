package com.object.asc.gantt.controller;


import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.object.asc.gantt.domain.GanttChartList;
import com.object.asc.gantt.service.GanttService;

/**
 * GanttChart Controller
 */
@Controller
@RequestMapping("/gantt")
public class GanttController {
	
	private static final Logger logger = LoggerFactory.getLogger(GanttController.class);
	
	@Inject
	private GanttService service;
	
	
	@RequestMapping(value = "/ganttChart", method = RequestMethod.GET)
	public String ganttChart(Model model) {
		logger.info("간트 페이지 테스트");
		/** test */
		List<GanttChartList> list = new ArrayList<GanttChartList>();
		list = service.ganttList(1);
		for (GanttChartList ganttChartList : list) {
			logger.info(ganttChartList.toString());
		}
		model.addAttribute("ganttList", service.ganttList(1));
		
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
