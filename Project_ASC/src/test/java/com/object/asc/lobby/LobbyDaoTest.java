package com.object.asc.lobby;

import java.util.UUID;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.object.asc.lobby.dao.LobbyDAO;
import com.object.asc.lobby.domain.ProjectJoinList;
import com.object.asc.lobby.domain.ProjectList;
import com.object.asc.project.domain.DashBoard;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class LobbyDaoTest {
	
	@Inject
	private LobbyDAO lobbyDao;
	
	Logger logger = Logger.getLogger(LobbyDaoTest.class);
	
	
	/** 참여 테스트 */
	@Test
	public void projectJoin(){
		lobbyDao.projectJoinRegister();
		logger.info("참여 생성");
	}
	
	/** 프로젝트 내역 테스트 */
	@Test
	public void projectListRegister(){
		UUID uuid = UUID.randomUUID();
		ProjectList projectList = new ProjectList();
		projectList.setProjectJoinNo(1);
		projectList.setProjectName("프로젝트만들어여");
		projectList.setProjectPhoto("noimage.png");
		projectList.setChatName(projectList.getProjectJoinNo() + "_" + uuid.toString());
		projectList.setChatContent("chat.txt");
		projectList.setStartDate(java.sql.Date.valueOf("2017-05-31"));
		projectList.setEndDate(java.sql.Date.valueOf("2017-06-12"));
		projectList.setContent("하이요");
		lobbyDao.projectListRegister(projectList);
		logger.info("프로젝트 내역 생성");
	}
	/** 참여 내역 테스트 */
	@Test
	public void projectJoinList(){
		ProjectJoinList projectJoinList = new ProjectJoinList();
		projectJoinList.setProjectJoinNo(1);
		projectJoinList.setUserNo(1);
		projectJoinList.setStatus(1);
		lobbyDao.projectJoinListRegister(projectJoinList);
		logger.info("참여 내역 생성");
	}
	
	/** 대쉬보드 테스트 (참여 회원 전부) 
	 *  projectListNo 동일하게 넣으면 됨
	 *  참여 회원 받아 와야함. (projectJoinList 조회)
	 * */
	@Test
	public void dashBoardRegister(){
		DashBoard dashBoard = new DashBoard();
		dashBoard.setProjectListNo(1);
		dashBoard.setUserNo(1);
		dashBoard.setMemo("memo");
		logger.info("대쉬보드 생성");
	}
	
	/** 릴리즈, 자료실, 간트차트, 계획 실행 차트, 스크럼 생성
	 * 	projectListNo 동일하게 넣으면 됨
	 * */
	@Test
	public void lobbyTest(){
		
	}
	
	/** 스프린트 생성 
	 *  스크럼 번호 받아서 넣어야 함
	 *  projectListNo 동일하게 넣으면 됨
	 *  */
	@Test
	public void sprintRegister(){
		
	}

	
}
