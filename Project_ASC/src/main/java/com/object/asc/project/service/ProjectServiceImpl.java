package com.object.asc.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.object.asc.gantt.domain.ActionChart;
import com.object.asc.gantt.domain.GanttChart;
import com.object.asc.lobby.dao.LobbyDAO;
import com.object.asc.lobby.domain.ProjectList;
import com.object.asc.log.dao.LogDAO;
import com.object.asc.log.domain.Log;
import com.object.asc.project.dao.ProjectDAO;
import com.object.asc.project.domain.DashBoard;
import com.object.asc.project.domain.Library;
import com.object.asc.project.domain.LibraryList;
import com.object.asc.project.domain.ProjectRelease;
import com.object.asc.project.domain.Scrum;
import com.object.asc.project.domain.Sprint;
import com.object.asc.user.dao.UserDAO;
import com.object.asc.user.domain.User;

/**
 * 
 * 프로젝트 인터페이스 구현 클래스
 * 
 * @패키지 : com.object.asc.project.service
 * @파일명 : ProjectServiceImpl.java
 * @작성자 : 이종윤 
 * @작성일 : 2017. 6. 01.
 *
 */
@Service
public class ProjectServiceImpl implements ProjectService {
	
	@Inject
	private ProjectDAO dao;
	
	@Inject
	private LogDAO logDao;
	
	@Inject
	private UserDAO userDao;
	
	@Inject
	private LobbyDAO lobbyDao;

	@Override
	public void libraryListRegister(LibraryList libraryList) {
		dao.libraryListRegister(libraryList);
		
		/** 로그 생성 */
		int userNo = libraryList.getUserNo();
		User user = userDao.get(userNo);
		String userName = user.getName();
		ProjectList projectList = lobbyDao.getProjectList(libraryList.getLibraryNo());
		
		Log log = new Log();
		log.setProjectListNo(libraryList.getLibraryNo());
		log.setUserNo(userNo);
		String content = "["+projectList.getProjectName()+"] "+ userName +" : 자료실에 " + libraryList.getFileName() +" 을(를) 등록했습니다.";
		log.setContent(content);
		logDao.writeLog(log);
	}

	@Override
	public void libraryListDelete(int libraryListNo, int libraryNo) {
		/** 로그 생성 */
		ProjectList projectList = lobbyDao.getProjectList(libraryNo);
		LibraryList libraryList = dao.getInfoLibrary(libraryListNo);
		User user = userDao.get(libraryList.getUserNo());
		String userName = user.getName();
		
		Log log = new Log();
		log.setProjectListNo(libraryNo);
		log.setUserNo(libraryList.getUserNo());
		String content = "["+projectList.getProjectName()+"] "+ userName +" : 자료실에 " + libraryList.getFileName() +" 을(를) 삭제했습니다.";
		log.setContent(content);
		logDao.writeLog(log);
		
		dao.libraryListDelete(libraryListNo, libraryNo);
		
	}

	@Override
	public List<LibraryList> libraryListListAll(int libraryNo) {
		return dao.libraryListListAll(libraryNo);
	}
	
	@Override
	public void dashBoardRegister(DashBoard dashBoard) {
		dao.dashBoardRegister(dashBoard);
	}

	@Override
	public void projectReleaseRegister(ProjectRelease projectRelease) {
		dao.projectReleaseRegister(projectRelease);
	}

	@Override
	public void libraryRegister(Library library) {
		dao.libraryRegister(library);
	}

	@Override
	public void ganttChartRegister(GanttChart ganttChart) {
		dao.ganttChartRegister(ganttChart);
	}

	@Override
	public void actionChartRegister(ActionChart actionChart) {
		dao.actionChartRegister(actionChart);
	}

	@Override
	public void scrumRegister(Scrum scrum) {
		dao.scrumRegister(scrum);
	}

	@Override
	public void sprintRegister(Sprint sprint) {
		dao.sprintRegister(sprint);
	}

	@Override
	public String chatName(int projectListNo) {
		return dao.chatName(projectListNo);
	}

	@Override
	public int findDashBoard(int projectListNo, int userNo) {
		return dao.findDashBoard(projectListNo, userNo);
	}

	@Override
	public void memoUpdate(int dashBoardNo, String memo) {
		dao.memoUpdate(dashBoardNo, memo);
	}

	@Override
	public String getMemo(int dashBoardNo) {
		return dao.getMemo(dashBoardNo);
	}

	@Override
	public List<String> todayListDashboard(int projectListNo, String worker) {
		return dao.todayListDashboard(projectListNo, worker);
	}

	@Override
	public int getSprintNo(int scrumNo) {
		return dao.getSprintNo(scrumNo);
	}

	@Override
	public String getActionPercent(int projectListNo) {
		return dao.getActionPercent(projectListNo);
	}

}
