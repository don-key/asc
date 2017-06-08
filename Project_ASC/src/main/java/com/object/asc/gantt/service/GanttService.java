package com.object.asc.gantt.service;

import java.sql.Date;
import java.util.List;

import com.object.asc.gantt.domain.GanttChartList;

public interface GanttService {
	
	/** 간트 차트 기능 조회 */
	public List<GanttChartList> ganttList(int projectListNo);

	/** 기능 추가 */
	public void register(int projectListNo, int userNo, String title, String worker, Date startDate, Date endDate, String color);
	
	/** 기능 수정 */
	public void modify(GanttChartList gcl);
	
	/** 기능 삭제 */
	public void delete(int ganttListNo);
	
	/** 오늘 할 일(간트) */
	public List<String> todayList (int ganttNo);
}
