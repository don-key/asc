package com.object.asc.lobby.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.object.asc.gantt.domain.ActionChart;
import com.object.asc.gantt.domain.GanttChart;
import com.object.asc.lobby.dao.LobbyDAO;
import com.object.asc.lobby.domain.ProjectJoin;
import com.object.asc.lobby.domain.ProjectJoinList;
import com.object.asc.lobby.domain.ProjectList;
import com.object.asc.project.dao.ProjectDAO;
import com.object.asc.project.domain.DashBoard;
import com.object.asc.project.domain.Library;
import com.object.asc.project.domain.ProjectRelease;
import com.object.asc.project.domain.Scrum;
import com.object.asc.project.domain.Sprint;
import com.object.asc.user.dao.UserDAO;
import com.object.asc.user.service.UserService;
import com.object.asc.util.UploadFileUtils;

@Service
public class LobbyServiceImpl implements LobbyService {

	@Inject
	private UserDAO userDao;

	@Inject
	private LobbyDAO lobbyDao;

	@Inject
	private ProjectDAO projectDao;

	@Resource(name = "uploadPath")
	private String uploadPath;

	/**
	 * 파라미터로 받아야 할것 1. ProjectList 2. MultipartFile 3. 프로젝트 참여 인원
	 */
	@Transactional
	@Override
	public void projectRegister(ProjectList projectList, MultipartFile file, String[] invitationList) {
		String savePath = "";
		try {
			savePath = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
		} catch (Exception e) {
			e.printStackTrace();
		}
		/** 프로젝트 생성 시 */
		/** 1-1. 참여 생성 */
		lobbyDao.projectJoinRegister();
		/** 1-2. 참여 번호 조회 */
		ProjectJoin projectJoin = lobbyDao.getProjectJoinNo();
		int projectJoinNo = projectJoin.getProjectJoinNo();
		/** 1-3. 프로젝트 내역 생성 */
		UUID uuid = UUID.randomUUID();
		projectList.setProjectJoinNo(projectJoinNo);
		projectList.setProjectPhoto(file.getOriginalFilename());
		projectList.setChatName(projectJoinNo + "_" + uuid.toString());
		projectList.setChatContent(projectJoinNo + "_" + uuid.toString()+".txt");
		projectList.setProjectPhoto(savePath);
		lobbyDao.projectListRegister(projectList);
		/**
		 * 1-4. 참여 내역 생성 (초대) status : 1 -> 스크럼마스터 status : 0 -> 팀원
		 */
		int invitationIndex = 0;
		for (String invitation : invitationList) {
			if (invitationIndex == 0) { // 스크럼
				ProjectJoinList projectJoinList = new ProjectJoinList();
				projectJoinList.setProjectJoinNo(projectJoinNo);
				projectJoinList.setUserNo(userDao.userIdFind(invitation));
				projectJoinList.setStatus(1); // 스크럼
				lobbyDao.projectJoinListRegister(projectJoinList);
				invitationIndex++;
			} else {
				ProjectJoinList projectJoinList = new ProjectJoinList();
				projectJoinList.setProjectJoinNo(projectJoinNo);
				projectJoinList.setUserNo(userDao.userIdFind(invitation));
				projectJoinList.setStatus(0); // 팀원
				lobbyDao.projectJoinListRegister(projectJoinList);
			}
		}

		/** 1-5. 대쉬보드 생성(회원 전부) */

		for (String invitation : invitationList) {
			DashBoard dashBoard = new DashBoard();
			dashBoard.setProjectListNo(projectJoinNo);
			dashBoard.setUserNo(userDao.userIdFind(invitation));
			dashBoard.setMemo("자유롭게 작성하세용 :)");
			projectDao.dashBoardRegister(dashBoard);
		}
		/**
		 * 1-5. 릴리즈 생성, 자료실 생성 간트차트 생성, 계획 실행 차트 생성, 스크럼 생성
		 */
		ProjectRelease projectRelease = new ProjectRelease();
		projectRelease.setProjectListNo(projectJoinNo);
		projectDao.projectReleaseRegister(projectRelease);
		GanttChart ganttChart = new GanttChart();
		ganttChart.setProjectListNo(projectJoinNo);
		projectDao.ganttChartRegister(ganttChart);
		ActionChart actionChart = new ActionChart();
		actionChart.setProjectListNo(projectJoinNo);
		projectDao.actionChartRegister(actionChart);
		Scrum scrum = new Scrum();
		scrum.setProjectListNo(projectJoinNo);
		projectDao.scrumRegister(scrum);
		/**
		 * 1-6. 스프린트 생성 1. start_date에는 프로젝트 시작날짜 들어감 2. end_date는 null
		 */
		Sprint sprint = new Sprint();
		sprint.setScrumNo(projectJoinNo);
		sprint.setStartDate(projectList.getStartDate());
		projectDao.sprintRegister(sprint);

		/** 1-7. 자료실 생성 */
		Library library = new Library();
		library.setProjectListNo(projectJoinNo);
		projectDao.libraryRegister(library);

	}

	@Override
	public ProjectList projectDate(int projectListNo) {
		return lobbyDao.projectDate(projectListNo);
	}

	@Override
	public List<ProjectList> projectListAll(int userNo) {
		return lobbyDao.projectListAll(userNo);
	}

	@Override
	public int memberCount(int projectJoinNo) {
		return lobbyDao.memberCount(projectJoinNo);
	}

	@Override
	public List<String> memberName(int projectListNo) {
		return lobbyDao.memberName(projectListNo);
	}

	@Override
	public ProjectList getProjectList(int projectListNo) {
		return lobbyDao.getProjectList(projectListNo);
	}

	@Override
	public List<Map<String, Object>> memberId(int projectListNo) {
		return lobbyDao.memberId(projectListNo);
	}
	@Transactional
	@Override
	public void projectUpdate(ProjectList projectList, MultipartFile file, String[] invitationList) {
		String savePath = "";
		
		/** 파일 미수정 시 */
		if(file.getOriginalFilename().length() == 0){
			projectList.setProjectPhoto(null);
		}else{
			/** 파일 수정 시 */
			try {
				savePath = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
				projectList.setProjectPhoto(savePath);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		/** 이전 내역과 현재 내역 비교해서 중복값 제거 후 결과 리스트 추가 */
		List<Map<String, Object>> previousMap = null;
		List<String> previousList = new ArrayList<String>();
		List<String> currentList = new ArrayList<String>();
		List<String> deleteList = new ArrayList<String>();
		List<String> registList = new ArrayList<String>();
		previousMap = lobbyDao.memberId(projectList.getProjectListNo());
		for (Map<String, Object> row : previousMap) {
			String id = (String) row.get("id");
			previousList.add(id);
		}
		// 현재 참여 내역 검색
		for (String invitation : invitationList) {
			currentList.add(invitation);
		}
		// 이전 내역과 현재 내역 비교해서 중복값 제거 후 결과 리스트 추가 (탈퇴)
		for (String list : previousList) {
			if(!currentList.contains(list)){
				deleteList.add(list);
			}
		}
		
		// 이전 내역과 현재 내역 비교해서 중복값 제거 후 결과 리스트 추가 (추가)
		for (String list : currentList) {
			if(!previousList.contains(list)){
				registList.add(list);
			}
		}
		
	    /** 참여 내역 생성, 대쉬보드 추가 */
		for (String regist : registList) {
			ProjectJoinList projectJoinList = new ProjectJoinList();
			projectJoinList.setProjectJoinNo(projectList.getProjectListNo());
			projectJoinList.setUserNo(userDao.userIdFind(regist));
			projectJoinList.setStatus(0); // 팀원
			lobbyDao.projectJoinListRegister(projectJoinList);
			DashBoard dashBoard = new DashBoard();
			dashBoard.setProjectListNo(projectList.getProjectListNo());
			dashBoard.setUserNo(userDao.userIdFind(regist));
			dashBoard.setMemo("자유롭게 작성하세용 :)");
			projectDao.dashBoardRegister(dashBoard);
		} 
		
		/** 참여 내역 삭제, 대쉬보드 삭제 */
		for (String delete : deleteList) {
			ProjectJoinList projectJoinList = new ProjectJoinList();
			projectJoinList.setProjectJoinNo(projectList.getProjectListNo());
			projectJoinList.setUserNo(userDao.userIdFind(delete));
			lobbyDao.projectJoinListDelete(projectJoinList);
			DashBoard dashBoard = new DashBoard();
			dashBoard.setProjectListNo(projectList.getProjectListNo());
			dashBoard.setUserNo(userDao.userIdFind(delete));
			lobbyDao.dashBoardDelete(dashBoard);
		}
		lobbyDao.projectListUpdate(projectList);
	}

	@Override
	public void projectListDelete(int projectListNo) {
		lobbyDao.projectListDelete(projectListNo);
	}
	
	
}
