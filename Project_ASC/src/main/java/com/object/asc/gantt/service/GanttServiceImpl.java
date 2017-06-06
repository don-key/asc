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
	public List<GanttChartList> ganttList(int ganttNo) {
		return dao.ganttList(ganttNo);
	}

	@Override
	public void register(GanttChartList gcl) {
		dao.register(gcl);
		
	}

	@Override
	public void modify(GanttChartList gcl) {
		dao.modify(gcl);
	}

}
