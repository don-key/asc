package com.object.asc.project;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.object.asc.lobby.dao.LobbyDAO;
import com.object.asc.lobby.domain.ProjectList;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class ProjectDaoTest {
	
	@Inject
	private LobbyDAO dao;
	
	Logger logger = Logger.getLogger(ProjectDaoTest.class);
	
	@Test
	public void testRegister(){
		ProjectList projectList = new ProjectList();
		projectList.setProjectJoinNo(1);
		projectList.setProjectName("프로젝트만들어여");
	}
	
}
