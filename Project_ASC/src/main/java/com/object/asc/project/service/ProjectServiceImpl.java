package com.object.asc.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.object.asc.gantt.domain.ActionChart;
import com.object.asc.gantt.domain.GanttChart;
import com.object.asc.lobby.domain.ProjectList;
import com.object.asc.project.dao.ProjectDAO;
import com.object.asc.project.domain.DashBoard;
import com.object.asc.project.domain.Library;
import com.object.asc.project.domain.LibraryList;
import com.object.asc.project.domain.ProjectRelease;
import com.object.asc.project.domain.Scrum;
import com.object.asc.project.domain.Sprint;

@Service
public class ProjectServiceImpl implements ProjectService {
	
	@Inject
	private ProjectDAO dao;

	@Override
	public void libraryListRegister(LibraryList libraryList) {
		dao.libraryListRegister(libraryList);
	}

	@Override
	public void libraryListDelete(int libraryListNo, int libraryNo) {
		dao.libraryListDelete(libraryListNo, libraryNo);
	}

	@Override
	public List<LibraryList> libraryListListAll() {
		return dao.libraryListListAll();
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

}
