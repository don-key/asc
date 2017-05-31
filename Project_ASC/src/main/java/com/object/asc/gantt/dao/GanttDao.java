package com.object.asc.gantt.dao;

import java.util.List;

import com.object.asc.gantt.domain.GanttChartList;

public interface GanttDao {
	
	/** 간트 차트 기능 조회 */
	public List<GanttChartList> ganttList(int ganttNo);
	
	

}
