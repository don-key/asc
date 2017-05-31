package com.object.asc.project;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.object.asc.project.dao.ProjectDAO;
import com.object.asc.project.domain.LibraryList;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class ProjectDaoTest {
	
	@Inject
	   private ProjectDAO dao;
	   
	   Logger logger = Logger.getLogger(ProjectDaoTest.class);
	   
	   @Test
	   public void testRegister(){
	      
	      LibraryList libraryList = new LibraryList();
	      libraryList.setLibraryNo(1);
	      libraryList.setUserNo(1);
	      libraryList.setTitle("테스트 제목");
	      libraryList.setFileName("1234.png");
	      
	      dao.libraryListRegister(libraryList);
	      logger.info("자료실 내역 신규 등록 완료");
	   }
	
}
