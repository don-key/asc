package com.object.asc.gantt.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.object.asc.gantt.dao.GanttDao;
import com.object.asc.gantt.domain.ActionChartList;
import com.object.asc.gantt.domain.GanttChart;
import com.object.asc.gantt.domain.GanttChartList;
import com.object.asc.lobby.dao.LobbyDAO;
import com.object.asc.lobby.domain.ProjectList;
import com.object.asc.log.dao.LogDAO;
import com.object.asc.log.domain.Log;
import com.object.asc.user.dao.UserDAO;
import com.object.asc.user.domain.User;

/**
 * 
 * 간트차트 인터페이스 구현 클래스
 * 
 * @패키지 : com.object.asc.gantt.service
 * @파일명 : GanttServiceImpl.java
 * @작성자 : 이지수 
 * @작성일 : 2017. 6. 01.
 *
 */
@Service
public class GanttServiceImpl implements GanttService {
	
	@Inject
	private GanttDao dao;
	
	@Inject
	private LogDAO logDao;
	
	@Inject
	private LobbyDAO lobbyDao;
	
	@Inject
	private UserDAO userDao;

	@Override
	public List<HashMap<String, Object>> ganttList(int projectListNo) {
		return dao.ganttList(projectListNo);
	}

	@Override
	public void register(int projectListNo, int userNo, String title, String worker, Date startDate, Date endDate, String color) {
		dao.register(projectListNo, userNo, title, worker, startDate, endDate, color);
		
		/** 로그 생성 */
		ProjectList projectList = lobbyDao.getProjectList(projectListNo);
		User user = userDao.get(userNo);
		String userName = user.getName();
		
		Log log = new Log();
		log.setProjectListNo(projectListNo);
		log.setUserNo(userNo);
		String content = "["+projectList.getProjectName()+"] "+ userName +" : 간트차트에 기능 " + title +" (작업자 : "+worker+") 을(를) 추가했습니다.";
		log.setContent(content);
		logDao.writeLog(log);
	}

	@Override
	public void modify(GanttChartList gcl) {
		
		dao.modify(gcl);
		
		/** 로그 생성 */
		int projectListNo = dao.getProjectNoGantt(gcl.getGanttListNo());
		ProjectList projectList = lobbyDao.getProjectList(projectListNo);
		int userNo = gcl.getUserNo();
		User user = userDao.get(userNo);
		String userName = user.getName();
		
		Log log = new Log();
		log.setProjectListNo(projectListNo);
		log.setUserNo(userNo);
		String content = "["+projectList.getProjectName()+"] "+ userName +" : 간트차트의 기능 " + gcl.getTitle() +"(작업자 : "+gcl.getWorker()+") 을(를) 수정했습니다.";
		log.setContent(content);
		logDao.writeLog(log);

	}

	@Override
	public void delete(int ganttListNo) {
		
		/** 로그 생성 */
		int projectListNo = dao.getProjectNoGantt(ganttListNo);
		ProjectList projectList = lobbyDao.getProjectList(projectListNo);
		GanttChartList ganttChartList = dao.getProjectInfoGantt(ganttListNo);
		int userNo = ganttChartList.getUserNo();
		User user = userDao.get(userNo);
		String userName = user.getName();
		
		Log log = new Log();
		log.setProjectListNo(projectListNo);
		log.setUserNo(userNo);
		String content = "["+projectList.getProjectName()+"] "+ userName +" : 간트차트의 기능 " + ganttChartList.getTitle() +"(작업자 : "+ganttChartList.getWorker()+") 을(를) 삭제했습니다.";
		log.setContent(content);
		logDao.writeLog(log);
		
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
		/** 로그 생성 */
		ProjectList projectList = lobbyDao.getProjectList(projectListNo);
		User user = userDao.get(actionChartList.getUserNo());
		String userName = user.getName();
		GanttChartList ganttChartList = dao.getProjectInfoGantt(actionChartList.getGanttListNo());
		
		Log log = new Log();
		log.setProjectListNo(projectListNo);
		log.setUserNo(actionChartList.getUserNo());
		int status = actionChartList.getStatus();
		String content = "";
		
		if(status != 1) {
			content = "["+projectList.getProjectName()+"] "+ userName +" : 간트차트의 기능 " + ganttChartList.getTitle() +"(작업자 : "+ganttChartList.getWorker()+") 을(를) 수행하지 못했습니다.";
		} else {
			content = "["+projectList.getProjectName()+"] "+ userName +" : 간트차트의 기능 " + ganttChartList.getTitle() +"(작업자 : "+ganttChartList.getWorker()+") 을(를) 수행했습니다.";
		}
		
		log.setContent(content);
		logDao.writeLog(log);
	}

	@Override
	public List<HashMap<String, Object>> actionList(int projectListNo) {
		return dao.actionList(projectListNo);
	}

	@Override
	public List<String> todayCheck(int projectListNo) {
		return dao.todayCheck(projectListNo);
	}

	@Override
	public void percentUpdate(int projectListNo, String percent) {
		dao.percentUpdate(projectListNo, percent);
		
	}

		

}
