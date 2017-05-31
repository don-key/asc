package com.object.asc.lobby;

import java.sql.Date;
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

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class LobbyDaoTest {
	
	@Inject
	private LobbyDAO dao;
	
	Logger logger = Logger.getLogger(LobbyDaoTest.class);
	
	
	/** 참여 테스트 */
	@Test
	public void projectJoin(){
		dao.projectJoinRegister();
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
		dao.projectListRegister(projectList);
		logger.info("프로젝트 내역 생성");
	}
	/** 참여 내역 테스트 */
	@Test
	public void projectJoinList(){
		ProjectJoinList projectJoinList = new ProjectJoinList();
		projectJoinList.setProjectJoinNo(1);
		projectJoinList.setUserNo(1);
		projectJoinList.setStatus(1);
		dao.projectJoinListRegister(projectJoinList);
		logger.info("참여 내역 생성");
	}
	

	
}
