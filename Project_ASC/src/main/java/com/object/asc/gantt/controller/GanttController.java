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

import com.object.asc.gantt.domain.GanttChartList;
import com.object.asc.gantt.service.GanttService;
import com.object.asc.lobby.domain.ProjectList;
import com.object.asc.lobby.service.LobbyService;

/**
 * GanttChart Controller
 */
@Controller
@RequestMapping("/gantt")
public class GanttController {

	private static final Logger logger = LoggerFactory.getLogger(GanttController.class);

	@Inject
	private GanttService ganttService;

	@Inject
	private LobbyService lobbyService;

	@RequestMapping(value = "/ganttChart", method = RequestMethod.GET)
	public String ganttChart(Model model) {
		logger.info("간트 페이지 테스트");
		/** test */
		List<GanttChartList> list = new ArrayList<GanttChartList>();
		list = ganttService.ganttList(1);
		for (GanttChartList ganttChartList : list) {
			logger.info(ganttChartList.toString());
		}

		ProjectList pList = lobbyService.projectDate(1);
		String[] startDate = pList.getStartDate().toString().split("-");
		String[] endDate = pList.getEndDate().toString().split("-");
		int year = Integer.parseInt(endDate[0]) - Integer.parseInt(startDate[0]);
		int days = 0;
		
		if (year >0) {
			days = calDays(endDate) - calDays(startDate) + year*365 +1;
		} else{
			days = calDays(endDate) - calDays(startDate) +1;
		}
		
		System.out.println("days : " + days);
		
		model.addAttribute("days", days);
		model.addAttribute("ganttList", ganttService.ganttList(1));
		model.addAttribute("projectDate", lobbyService.projectDate(1));

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
	
	
	public int calDays (String[] date){
		int days = Integer.parseInt(date[2]);
		switch (Integer.parseInt(date[1])) {
		case 12: days += 30;	
		case 11: days += 31;
		case 10: days += 30;
		case 9: days += 31;
		case 8: days += 31;
		case 7: days += 30;
		case 6: days += 31;
		case 5: days += 30;
		case 4: days += 31;
		case 3: days += 28;
		case 2: days += 31;
		case 1: break;
		}
		return days;
	}

}
