package com.object.asc.gantt.controller;

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
		
		/** test 나중에 1 이거 고정으로 넣은거 잊지말고 동적으로 변경하기!!!!!!!!!! 간트리스트랑 프로젝트리스트!!!!!!!!!!!!!!!!!!!!!!*/
		
		ProjectList projList = lobbyService.projectDate(1);
		String[] pStartDate = projList.getStartDate().toString().split("-");
		String[] pEndDate = projList.getEndDate().toString().split("-");
		List<GanttChartList> funcList = ganttService.ganttList(1);
		
		System.out.println("4가 나와야겠지 : " + funcList.size());
		
		int year = Integer.parseInt(pEndDate[0]) - Integer.parseInt(pStartDate[0]);
		
		int count = 0;
		
		/** 기능들 시작일 몇번째인지 */
		int[] startCount = new int[funcList.size()];
		for (GanttChartList func : funcList) {
			String[] fStartDate = func.getStartDate().toString().split("-");
			startCount[count] = calDays(fStartDate) - calDays(pStartDate) + 365*year +1;
			System.out.println(count+1 + "번째 기능 시작일 : " + calDays(fStartDate));
			System.out.println(count+1 + "번째 프로젝트 시작일 : " + calDays(pStartDate));
				count++;
		}
		
		int count2 = 0;
		
		for (int i = 0; i < startCount.length; i++) {
			System.out.println("몇번째에서 시작인지 구해보자");
			System.out.println(startCount[i]);
		}
		
		/** 기능들 몇일동안인지 */
		int[] duration = new int[funcList.size()];
		for (GanttChartList func2 : funcList) {
			String[] fStartDate = func2.getStartDate().toString().split("-");
			String[] fEndDate = func2.getEndDate().toString().split("-");
			duration[count2] = calDays(fEndDate) - calDays(fStartDate) + 365*year +1;
			System.out.println(count2 + 1 + "번째 기능 시작일 : " + calDays(fStartDate));
			System.out.println(count2 + 1 + "번째 기능 마감일 : " + calDays(fEndDate));
			count2++;
		}
		for (int i = 0; i < duration.length; i++) {
			System.out.println("기간을 구해보자");
			System.out.println(duration[i]);
		}
		
		
		int days = 0;
		
		
		if (year >0) {
			days = calDays(pEndDate) - calDays(pStartDate) + year*365 +1;
		} else{
			days = calDays(pEndDate) - calDays(pStartDate) +1;
		}
		


		
		/** 나중에 여기 정리하기, 불필요한 addAttribute정리하기!!!! 자바스크립트로 구현해보고 결정 */
		// 기간
		model.addAttribute("days", days);
		// 프젝 시작일
		model.addAttribute("pStartDate", pStartDate);
		// 프젝 마감일
		model.addAttribute("pEndDate", pEndDate);
		// 기능
		model.addAttribute("ganttList", ganttService.ganttList(1));
		// 프젝
		model.addAttribute("projectDate", lobbyService.projectDate(1));
		// 기능 시작일 (계산한값)
		model.addAttribute("startCount", startCount);
		// 기능 유지일 (계산한값)
		model.addAttribute("duration", duration);
		// 기능 개수
		model.addAttribute("funcSize", funcList.size());

		return "/gantt/ganttChart";
	}

	
	@RequestMapping(value = "/currentChart", method = RequestMethod.GET)
	public String currentChart(Model model) {
		logger.info("간트 페이지 테스트");
		return "/gantt/currentChart";
	}

	
	/** 요일 계산해주는 메소드 */
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
