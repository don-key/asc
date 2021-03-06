package com.object.asc.gantt.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import com.object.asc.gantt.domain.ActionChartList;
import com.object.asc.gantt.domain.GanttChartList;

/**
 *
 * 간트차트 관련 인터페이스 정의
 * 
 * @패키지 : com.object.asc.gantt.service
 * @파일명 : GanttService.java
 * @작성자 : 이지수
 * @작성일 : 2017. 6. 01.
 *
 */
public interface GanttService {
	
	/** 간트 차트 기능 조회 */
	public List<HashMap<String, Object>> ganttList(int projectListNo);

	/** 기능 추가 */
	public void register(int projectListNo, int userNo, String title, String worker, Date startDate, Date endDate, String color);
	
	/** 기능 수정 */
	public void modify(GanttChartList gcl);
	
	/** 기능 삭제 */
	public void delete(int ganttListNo);
	
	/** 오늘 할 일(간트) */
	public List<String> todayList (int ganttNo);
	
	/** 계획 실행 내역 추가 */
	public void actionRegister(int projectListNo, ActionChartList actionChartList);
	
	/** 계획 실행 차트 목록 조회 */
	public List<HashMap<String, Object>> actionList(int projectListNo);
	
	/** 오늘 기능 체크 상태 확인 */
	public List<String> todayCheck(int projectListNo);
	
	/** 달성률 업데이트 */
	public void percentUpdate (int projectListNo, String percent);
	
	
}
