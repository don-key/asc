package com.object.asc.gantt.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.object.asc.gantt.domain.GanttChartList;

@Repository
public class GanttDaoImpl implements GanttDao {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.object.asc.mapper.GanttMapper";

	@Override
	public List<GanttChartList> ganttList(int ganttNo) {
		return session.selectList(namespace+".ganttList", ganttNo);
	}

}
