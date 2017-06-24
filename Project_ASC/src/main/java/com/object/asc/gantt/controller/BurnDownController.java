package com.object.asc.gantt.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.object.asc.gantt.service.BurnDownService;
import com.object.asc.lobby.domain.ProjectList;
import com.object.asc.lobby.service.LobbyService;


/**
 * GanttChart Controller
 */
@Controller
@RequestMapping("/burnDown")
public class BurnDownController {

	private static final Logger logger = LoggerFactory.getLogger(BurnDownController.class);

	@Inject
	private BurnDownService burnDownService;
	
	@Inject
	private LobbyService lobbyService;
	

	@RequestMapping(value = {"/chart/{projectListNo}/{userNo}"}, method = RequestMethod.GET)
	public String ganttChart(@PathVariable int projectListNo, @PathVariable int userNo, Model model) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
	    cal.setTime(new java.util.Date());
		String sdfSql = sdf.format(cal.getTime());
        java.sql.Date date = java.sql.Date.valueOf(sdfSql);
        
        String[] today = date.toString().split("-");
        
        ProjectList projList = lobbyService.projectDate(projectListNo);
        String[] pEndDate = projList.getEndDate().toString().split("-");
		
		
		List<HashMap<String, Object>> sprintNoList = burnDownService.getSprintNo(projectListNo);
		
		// 며칠동안인지
		int[] duration = new int[sprintNoList.size()];
		
		// 끝난 날이 언제인지
		List<int[]> doneDateList = new ArrayList<>();
		
		// 스프린트 백로그 개수
		int[] backLogCount = new int[sprintNoList.size()];
		
		
		int count = 0;
		for (HashMap<String, Object> hashMap : sprintNoList) {
			
			String[] endDate;
			if (hashMap.get("endDate") == null) {
				endDate = pEndDate;
			} else {
				endDate = hashMap.get("endDate").toString().split("-");
			}
			String[] startDate = hashMap.get("startDate").toString().split("-");
			int year = Integer.parseInt(endDate[0]) - Integer.parseInt(startDate[0]);
			duration[count] = calDays(endDate) - calDays(startDate) + 365*year +1;
			
			// 스프린트 백로그 개수 DB에서 받아오기
			backLogCount[count] = burnDownService.backLogCount(Integer.parseInt(hashMap.get("sprintNo").toString()));
			
			// 배열 초기화
			int[] amount = new int[duration[count]];
			for (int i = 0; i < amount.length; i++) {
				amount[i] = 0;
			}
			
			// 그 스프린트넘버에대한 끝난 날짜 리스트
			List<String> doneDateDB = burnDownService.doneDate(Integer.parseInt(hashMap.get("sprintNo").toString()));
			
			for (String string : doneDateDB) {
				String[] doneDate = string.split("-");
				int year2 = Integer.parseInt(doneDate[0]) - Integer.parseInt(startDate[0]);
				int where = calDays(doneDate) - calDays(startDate) + 365*year2 +1;
				amount[where-1]++;
			}
			
			// 오늘보다 스프린트 끝나는 날이 뒤면 그래프 표시 X (null 처리 해주려고)
			if (calDays(endDate) - calDays(today) >0) {
				int year3 = Integer.parseInt(endDate[0]) - Integer.parseInt(today[0]);
				int where = calDays(endDate) - calDays(today) + 365*year3 +1;
				for (int i = 1; i < where ; i++) {
					amount[amount.length-i] = -1;
				}
			}
			
			
			doneDateList.add(amount);

			count++;
		}
		
		List<HashMap<String, Object>> sprintBLogList = burnDownService.getSprintBackLog(projectListNo);
		
		// 스프린트넘버
		model.addAttribute("sprint", sprintNoList);
		
		// 스프린트 백로그 넘버
		model.addAttribute("sprintBLog", sprintBLogList);
		
		// 스프린트당 며칠동안인지
		model.addAttribute("duration", duration);
		
		// 스프린트 백로그 개수
		model.addAttribute("idealBackLogCount", backLogCount);
		
		// 오늘
		model.addAttribute("today", today);
		
		// 날짜별 수량 체크
		model.addAttribute("doneDateList", doneDateList);
		
		
		return "/burnDown/burnDownChart";
	}

	/** 일수 계산해주는 메소드 */
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
