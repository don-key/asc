package com.object.asc.gantt.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.object.asc.gantt.dao.GanttDao;
import com.object.asc.gantt.domain.ActionChartList;
import com.object.asc.gantt.domain.GanttChartList;

@Service
public class GanttServiceImpl implements GanttService {
	
	@Inject
	private GanttDao dao;

	@Override
	public List<GanttChartList> ganttList(int projectListNo) {
		return dao.ganttList(projectListNo);
	}

	@Override
	public void register(int projectListNo, int userNo, String title, String worker, Date startDate, Date endDate, String color) {
		dao.register(projectListNo, userNo, title, worker, startDate, endDate, color);
		
	}

	@Override
	public void modify(GanttChartList gcl) {
		dao.modify(gcl);
	}

	@Override
	public void delete(int ganttListNo) {
		dao.deleteAction(ganttListNo);
		dao.delete(ganttListNo);
	}

	@Override
	public List<String> todayList(int ganttNo) {
		return dao.todayList(ganttNo);
	}

	@Override
	public void actionRegister(int projectListNo, ActionChartList actionChartList) {
		dao.actionRegister(projectListNo, actionChartList);
	}

	@Override
	public List<HashMap<String, Object>> actionList(int projectListNo) {
		return dao.actionList(projectListNo);
	}

	@Override
	public List<String> todayCheck(int projectListNo) {
		return dao.todayCheck(projectListNo);
	}

		

}
