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
		String content = "["+projectList.getProjectName()+"] "+ userName +" : 간트차트에 기능 " + title +" 을 추가했습니다.";
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
		String content = "["+projectList.getProjectName()+"] "+ userName +" : 간트차트에 기능 " + gcl.getTitle() +" 을 수정했습니다.";
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
		String content = "["+projectList.getProjectName()+"] "+ userName +" : 간트차트에 기능 " + ganttChartList.getTitle() +" 을 삭제했습니다.";
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
