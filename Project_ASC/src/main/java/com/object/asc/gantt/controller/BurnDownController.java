package com.object.asc.gantt.controller;

import java.sql.Date;
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


/**
 * GanttChart Controller
 */
@Controller
@RequestMapping("/burnDown")
public class BurnDownController {

	private static final Logger logger = LoggerFactory.getLogger(BurnDownController.class);

	@Inject
	private BurnDownService burnDownService;
	

	@RequestMapping(value = {"/{projectListNo}/{userNo}"}, method = RequestMethod.GET)
	public String ganttChart(@PathVariable int projectListNo, @PathVariable int userNo, Model model) {
		logger.info("번다운차트 페이지 테스트");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
	    cal.setTime(new java.util.Date());
		String sdfSql = sdf.format(cal.getTime());
        java.sql.Date date = java.sql.Date.valueOf(sdfSql);
		
		
		List<HashMap<String, Object>> sprintNoList = burnDownService.getSprintNo(projectListNo);
		// 며칠동안인지
		int[] duration = new int[sprintNoList.size()];
		for (int i : duration) {
			
		}
		int count = 0;
		for (HashMap<String, Object> hashMap : sprintNoList) {
			String[] endDate;
			if (hashMap.get("endDate") == null) {
				endDate = date.toString().split("-");
			} else {
				endDate = hashMap.get("endDate").toString().split("-");
			}
			String[] startDate = hashMap.get("startDate").toString().split("-");
			int year = Integer.parseInt(endDate[0]) - Integer.parseInt(startDate[0]);
			duration[count] = calDays(endDate) - calDays(startDate) + 365*year +1;
			count++;
			System.out.println("스프린트리스트 : " + hashMap.toString());
		}
		
		List<HashMap<String, Object>> sprintBLogList = burnDownService.getSprintBackLog(projectListNo);
		for (HashMap<String, Object> hashMap : sprintBLogList) {
			System.out.println("스프린트백로그리스트 : " + hashMap.toString());
		}
		
		
		/** 그래프 그리기 */
		/** 날짜 만들기 */
		List<String[]> graphDate = new ArrayList<String[]>();
		int count1 = 0;
		for (int i : duration) {
			String[] xDate = new String[i];
			String startDate = sprintNoList.get(count1).get("startDate").toString();
			String[] startSplit = startDate.split("-");
			for (int j = 0; j < i; j++) {
				int[] returnDate = addDay(Integer.parseInt(startSplit[1]), Integer.parseInt(startSplit[2]));
				xDate[j] = returnDate[0]+"/"+returnDate[1];
				startSplit[1] = String.valueOf(returnDate[0]);
				startSplit[2] = String.valueOf(returnDate[1]);
			}
			graphDate.add(xDate);
			count1++;
		}
		
		// 스프린트넘버
		model.addAttribute("sprint", sprintNoList);
		
		// 스프린트 백로그 넘버
		model.addAttribute("sprintBLog", sprintBLogList);
		
		// 스프린트당 며칠동안인지
		model.addAttribute("duration", duration);
		
		// 날짜 만들기
		model.addAttribute("graphDate", graphDate);
		
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
	
	/** 날짜 올려주는 메소드 */
	public int[] addDay(int month, int day){
		int[] value = new int[2];
	    switch (month) {
	    case 1:
	    case 3:
	    case 5:
	    case 7:
	    case 8:
	    case 10:
	    case 12: if (day == 31) {
	      month += 1;
	      day = 1;
	    } else {
	      day += 1;
	    } 
	      break;
	    case 4:
	    case 6:
	    case 9:
	    case 11: if (day == 30) {
	      month += 1;
	      day = 1;
	    } else {
	      day += 1;
	    } 
	      break;
	    case 2: if (day == 28) {
	      month += 1;
	      day = 1;
	    } else {
	      day += 1;
	    } 
	      break;
	    }
	    value[0] = month;
	    value[1] = day;
	   
	    return value;
		
	}
	


}
