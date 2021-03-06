package com.object.asc.gantt.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
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

import com.object.asc.gantt.domain.ActionChartList;
import com.object.asc.gantt.domain.GanttChartList;
import com.object.asc.gantt.service.GanttService;
import com.object.asc.lobby.domain.ProjectList;
import com.object.asc.lobby.service.LobbyService;

/**
 * 
 * 간트차트/진행차트 컨트롤러 
 * @RequestMapping("/gantt") URI 매칭
 * 
 * @패키지 : com.object.asc.gantt.controller
 * @파일명 : GanttController.java
 * @작성자 : 이지수
 * @작성일 : 2017. 06. 01. 
 * 
 */
@Controller
@RequestMapping("/gantt")
public class GanttController {

	private static final Logger logger = LoggerFactory.getLogger(GanttController.class);

	@Inject
	private GanttService ganttService;

	@Inject
	private LobbyService lobbyService;
	
	/**
	 * 
	 * 차트 페이지 @PathVariable type 변수를 활용하여 페이지 매칭
	 * 
	 * @Method Name : ganttChart
	 * @param type
	 * @param projectListNo
	 * @param userNo
	 * @param go
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"/{type}/{projectListNo}/{userNo}","/{type}/{projectListNo}/{userNo}/{go}"}, method = RequestMethod.GET)
	public String ganttChart(@PathVariable String type, @PathVariable int projectListNo, @PathVariable int userNo, @PathVariable(required=false) String go, Model model) {
		
		ProjectList projList = lobbyService.projectDate(projectListNo);
		String[] pStartDate = projList.getStartDate().toString().split("-");
		String[] pEndDate = projList.getEndDate().toString().split("-");
		List<HashMap<String, Object>> funcList = ganttService.ganttList(projectListNo);
		
		int year = Integer.parseInt(pEndDate[0]) - Integer.parseInt(pStartDate[0]);
		
		int count = 0;
		
		/** 기능들 시작일 몇번째인지 */
		int[] startCount = new int[funcList.size()];
		for (HashMap<String, Object> func : funcList) {
			String[] fStartDate = func.get("startDate").toString().split("-");
			startCount[count] = calDays(fStartDate) - calDays(pStartDate) + 365*year;
				count++;
		}
		
		int count2 = 0;
		
		
		/** 기능들 몇일동안인지 */
		int[] duration = new int[funcList.size()];
		for (HashMap<String, Object> func2 : funcList) {
			String[] fStartDate = func2.get("startDate").toString().split("-");
			String[] fEndDate = func2.get("endDate").toString().split("-");
			duration[count2] = calDays(fEndDate) - calDays(fStartDate) + 365*year +1;
			count2++;
		}
		
		int days = 0;
		
		
		if (year >0) {
			days = calDays(pEndDate) - calDays(pStartDate) + year*365 +1;
		} else{
			days = calDays(pEndDate) - calDays(pStartDate) +1;
		}
		System.out.println(55);
		
		/** 간트 기능 추가 모달에 들어갈 참여 멤버 이름 조회 */
		List<String> member = lobbyService.memberName(projectListNo);
		
		/** Today 표현을 위한 오늘 날짜 받아오기 */
		Date today = date(0);
		
        String[] todaySplit = today.toString().split("-");
        int todayDays=0;
        if (calDays(pStartDate) <= calDays(todaySplit)) {
			todayDays = calDays(todaySplit) - calDays(pStartDate);
		} else{
			todayDays = -1;
		}
        
        
        /** action */
        int count3=0;
        /** action chart */
        List<HashMap<String, Object>> actionList = ganttService.actionList(projectListNo);
        
		/** 실행일 (몇번째인지) */
		int[] theDay = new int[actionList.size()];
		for (HashMap<String, Object> hashMap : actionList) {
			String[] fDate = hashMap.get("actionDate").toString().split("-");
			theDay[count3] = calDays(fDate) - calDays(pStartDate) + 365*year;
			count3++;
		}
        
		/** 오늘 기능 체크상태 확인 */
		List<String> todayCheck = ganttService.todayCheck(projectListNo);

		
		// 기간
		model.addAttribute("days", days);
		// 프젝 시작일
		model.addAttribute("pStartDate", pStartDate);
		// 프젝 마감일
		model.addAttribute("pEndDate", pEndDate);
		// 기능
		model.addAttribute("ganttList", ganttService.ganttList(projectListNo));
		// 프젝
		model.addAttribute("projectDate", lobbyService.projectDate(projectListNo));
		// 기능 시작일 (계산한값)
		model.addAttribute("startCount", startCount);
		// 기능 유지일 (계산한값)
		model.addAttribute("duration", duration);
		
		// 멤버 조회
		model.addAttribute("member", member);
		
		
		//오늘 동적으로 받아오기
		model.addAttribute("todayDays", todayDays);
		
		// 리스트 넘버
		model.addAttribute("projectListNo", projectListNo);
		model.addAttribute("userNo", userNo);
		
		/** action */
		// 실행일 (계산한값)
		model.addAttribute("theDay", theDay);
		
		// 실행리스트
		model.addAttribute("actionList", actionList);
		
		// 오늘 기능 체크 확인
		model.addAttribute("todayCheck", todayCheck);
		
		if(go != null){
			model.addAttribute("goDashBoard", go);
		}
		
		
		/** 간트차트인지 진행차트인지 구분해서 페이지 리턴 */
		if (type.equals("ganttChart")) {
			return "/gantt/ganttChart";
		} else if(type.equals("actionChart")) {
			return "/gantt/actionChart";
		}
		
		return "redirect:/index";
	}

	/**
	 * 
	 * 간트차트 등록 메소드
	 * 
	 * @Method Name : register
	 * @param projectListNo
	 * @param userNo
	 * @param title
	 * @param worker
	 * @param startDate
	 * @param endDate
	 * @param color
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String register(int projectListNo, int userNo, String title, String worker, Date startDate, Date endDate, String color, Model model){
		
		ganttService.register(projectListNo, userNo, title, worker, startDate, endDate, color);
		
		return "redirect:/gantt/ganttChart/"+projectListNo+"/"+userNo;
	}
	
	/**
	 * 
	 * 간트차트 수정 메소드
	 * 
	 * @Method Name : modify
	 * @param projectListNo
	 * @param userNo
	 * @param modifyListNo
	 * @param modifyTitle
	 * @param modifyWorker
	 * @param modifyStartDate
	 * @param modifyEndDate
	 * @param modifyColor
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modify(int projectListNo, int userNo, int modifyListNo, String modifyTitle, String modifyWorker, Date modifyStartDate, Date modifyEndDate, String modifyColor, Model model){
		GanttChartList gcl = new GanttChartList();
		gcl.setGanttListNo(modifyListNo);
		gcl.setTitle(modifyTitle);
		gcl.setWorker(modifyWorker);
		gcl.setStartDate(modifyStartDate);
		gcl.setEndDate(modifyEndDate);
		gcl.setColor(modifyColor);
		gcl.setUserNo(userNo);
		
		ganttService.modify(gcl);
		
		return "redirect:/gantt/ganttChart/"+projectListNo+"/"+userNo;
	}
	
	/**
	 * 
	 * 간트차트 삭제 메소드
	 * 
	 * @Method Name : delete
	 * @param projectListNo
	 * @param userNo
	 * @param ganttListNo
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/delete/{ganttListNo}/{projectListNo}/{userNo}", method=RequestMethod.GET)
	public String delete(@PathVariable int projectListNo, @PathVariable int userNo, @PathVariable int ganttListNo, Model model){
		ganttService.delete(ganttListNo);
		
		return "redirect:/gantt/ganttChart/"+projectListNo+"/"+userNo;
	}
	
	
	/**
	 * 
	 * 진행차트 등록 메소드
	 * 
	 * @Method Name : actionRegister
	 * @param projectListNo
	 * @param userNo
	 * @param ganttListNo
	 * @param status
	 * @param tOrY
	 * @return
	 */
	@RequestMapping(value="/actionRegister", method=RequestMethod.POST)
	public String actionRegister(int projectListNo, int userNo, int ganttListNo, int status, int tOrY){
		Date actionDate = date(tOrY);
		
		ActionChartList actionChartList = new ActionChartList();
		actionChartList.setActionDate(actionDate);
		actionChartList.setGanttListNo(ganttListNo);
		actionChartList.setStatus(status);
		actionChartList.setUserNo(userNo);
		
		ganttService.actionRegister(projectListNo, actionChartList);
		
		return "/gantt/ganttChart";
		
	}
	
	/**
	 * 
	 * 진행차트 현실퍼센트 업데이트 메소드
	 * 
	 * @Method Name : actionRegister
	 * @param projectListNo
	 * @param percent
	 * @return
	 */
	@RequestMapping(value="/percentUpdate", method=RequestMethod.POST)
	public String actionRegister(int projectListNo, String percent){
		
		ganttService.percentUpdate(projectListNo, percent);
		
		return "/gantt/actionChart";
		
	}

	
	/**
	 * 
	 * 날짜 계산 메소드
	 * 
	 * @Method Name : calDays
	 * @param date
	 * @return
	 */
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
	
	/**
	 * 
	 * 날짜 받아오는 메소드 (오늘인지 며칠전인지 구분해서 날짜 반환)
	 * 
	 * @Method Name : date
	 * @param tOrY
	 * @return
	 */
	public Date date (int tOrY){

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
	    cal.setTime(new java.util.Date());
		cal.add(Calendar.DATE, -tOrY);
		String sdfSql = sdf.format(cal.getTime());
        java.sql.Date date = java.sql.Date.valueOf(sdfSql);
        return date;
	}

}
