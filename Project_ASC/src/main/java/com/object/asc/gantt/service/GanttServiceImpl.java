package com.object.asc.gantt.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.object.asc.gantt.dao.GanttDao;
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
	public void register(int projectListNo, GanttChartList gcl) {
		dao.register(projectListNo, gcl);
		
	}

	@Override
	public void modify(GanttChartList gcl) {
		dao.modify(gcl);
	}

	@Override
	public void delete(int ganttListNo) {
		dao.delete(ganttListNo);
	}

	@Override
	public List<String> todayList(int ganttNo) {
		return dao.todayList(ganttNo);
	}

}
