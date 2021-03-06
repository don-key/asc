package com.object.asc.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.object.asc.gantt.domain.ActionChart;
import com.object.asc.gantt.domain.GanttChart;
import com.object.asc.project.domain.DashBoard;
import com.object.asc.project.domain.Library;
import com.object.asc.project.domain.LibraryList;
import com.object.asc.project.domain.ProjectRelease;
import com.object.asc.project.domain.Scrum;
import com.object.asc.project.domain.Sprint;

/**
 * 
 * ProjectDAO 인터페이스를 구현하는 클래스
 * 
 * @패키지 : com.object.asc.project.dao
 * @파일명 : ProjectDAOImpl.java
 * @작성자 : 이종윤
 * @작성일 : 2017. 6. 01. 
 *
 */
@Repository
public class ProjectDAOImpl implements ProjectDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static String namespace="com.object.asc.mapper.ProjectMapper";

	@Override
	public void libraryListRegister(LibraryList libraryList) {

		sqlSession.insert(namespace+".libraryListRegister", libraryList);
	}

	@Override
	public void libraryListDelete(int libraryListNo, int libraryNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("libraryListNo", libraryListNo);
		map.put("libraryNo", libraryNo);
		
		sqlSession.delete(namespace+".libraryListDelete", map);
	}

	@Override
	public List<LibraryList> libraryListListAll(int libraryNo) {
		return sqlSession.selectList(namespace+".libraryListListAll", libraryNo);
	}
	
	@Override
	public void dashBoardRegister(DashBoard dashBoard) {
		sqlSession.insert(namespace+".dashBoardRegister", dashBoard);
	}

	@Override
	public void projectReleaseRegister(ProjectRelease projectRelease) {
		sqlSession.insert(namespace+".projectReleaseRegister", projectRelease);
	}

	@Override
	public void libraryRegister(Library library) {
		sqlSession.insert(namespace+".libraryRegister", library);
	}

	@Override
	public void ganttChartRegister(GanttChart ganttChart) {
		sqlSession.insert(namespace+".ganttChartRegister", ganttChart);
	}

	@Override
	public void actionChartRegister(ActionChart actionChart) {
		sqlSession.insert(namespace+".actionChartRegister", actionChart);
	}

	@Override
	public void scrumRegister(Scrum scrum) {
		sqlSession.insert(namespace+".scrumRegister", scrum);
	}

	@Override
	public void sprintRegister(Sprint sprint) {
		sqlSession.insert(namespace+".sprintRegister", sprint);
	}

	@Override
	public String chatName(int projectListNo) {
		return sqlSession.selectOne(namespace+".chatName",projectListNo);
	}

	@Override
	public int findDashBoard(int projectListNo, int userNo) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("projectListNo", projectListNo);
		map.put("userNo", userNo);
		
		return sqlSession.selectOne(namespace+".findDashBoard", map);
	}

	@Override
	public void memoUpdate(int dashBoardNo, String memo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dashBoardNo", dashBoardNo);
		map.put("memo", memo);
		
		sqlSession.update(namespace+".memoUpdate", map);
	}

	@Override
	public String getMemo(int dashBoardNo) {
		return sqlSession.selectOne(namespace + ".getMemo", dashBoardNo);
	}

	@Override
	public List<String> todayListDashboard(int projectListNo, String worker) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("projectListNo", projectListNo);
		map.put("worker", worker);
		
		return sqlSession.selectList(namespace+".todayListDashboard", map);
	}

	@Override
	public int getSprintNo(int scrumNo) {
		return sqlSession.selectOne(namespace + ".getSprintNo", scrumNo);
	}

	@Override
	public String getActionPercent(int projectListNo) {
		return sqlSession.selectOne(namespace+".getActionPercent", projectListNo);
	}

	@Override
	public LibraryList getInfoLibrary (int libraryListNo) {
		return sqlSession.selectOne(namespace + ".getInfoLibrary",libraryListNo);
	}

}
