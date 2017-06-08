package com.object.asc.gantt.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<GanttChartList> ganttList(int projectListNo) {
		return sqlSession.selectList(namespace+".ganttList", projectListNo);
	}

	@Override
	public void register(int projectListNo, GanttChartList gcl) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("projectListNo", projectListNo);
		map.put("gcl", gcl);
		sqlSession.insert(namespace+".register", map);
		
	}

	@Override
	public void modify(GanttChartList gcl) {
		sqlSession.update(namespace +".modify", gcl);
	}

	@Override
	public void delete(int ganttListNo) {
		sqlSession.delete(namespace + ".delete", ganttListNo);
		
	}

	@Override
	public List<String> todayList(int ganttNo) {
		return sqlSession.selectList(namespace+".todayList", ganttNo);
	}

}
