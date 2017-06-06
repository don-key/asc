package com.object.asc.gantt.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.object.asc.gantt.domain.GanttChartList;

@Repository
public class GanttDaoImpl implements GanttDao {
	
	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "com.object.asc.mapper.GanttMapper";

	@Override
	public List<GanttChartList> ganttList(int ganttNo) {
		return sqlSession.selectList(namespace+".ganttList", ganttNo);
	}

	@Override
	public void register(GanttChartList gcl) {
		sqlSession.insert(namespace+".register", gcl);
		
	}

	@Override
	public void modify(GanttChartList gcl) {
		sqlSession.update(namespace +".modify", gcl);
	}

	@Override
	public void delete(int ganttListNo) {
		sqlSession.delete(namespace + ".delete", ganttListNo);
		
	}

}
