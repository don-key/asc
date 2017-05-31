package com.object.asc.gantt;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.object.asc.gantt.dao.GanttDao;
import com.object.asc.lobby.domain.ProjectList;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class GanttDaoTest {
	
	@Inject
	private GanttDao dao;
	
	Logger logger = Logger.getLogger(GanttDaoTest.class);
	
	@Test
	public void testRegister(){
		
	}
	
}
