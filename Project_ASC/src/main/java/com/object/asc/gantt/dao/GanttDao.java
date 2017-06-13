package com.object.asc.gantt.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import com.object.asc.gantt.domain.ActionChartList;
import com.object.asc.gantt.domain.GanttChartList;

public interface GanttDao {
	
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
	
	/** 기능 삭제시에 action 차트애들도 지우기 */
	public void deleteAction(int ganttListNo);
	
	/** 달성률 업데이트 */
	public void percentUpdate (int projectListNo, String percent);
	
	/** 프로젝트번호 가져오기 */
	public int getProjectNoGantt (int ganttNo);
	
	/** 특정 간트차트 정보 가져오기 */
	public GanttChartList getProjectInfoGantt (int ganttListNo);

}
