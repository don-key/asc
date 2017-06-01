package com.object.asc.project;

import java.util.ArrayList;
import java.util.List;

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
	      libraryList.setTitle("오늘의 테스트");
	      libraryList.setFileName("1234.png");
	      
	      dao.libraryListRegister(libraryList);
	      logger.info("자료실 내역 신규 등록 완료");
	   }
	
	   @Test
	   public void testDelete(){
	      
	      dao.libraryListDelete(4);
	      
	      logger.info("자료실 내역 삭제 완료");
	   }
	   
	   @Test
	   public void testListAll(){
	      
		   List<LibraryList> list = new ArrayList<LibraryList>();
		   
	      list = dao.libraryListListAll();
	      
	      for (LibraryList libraryList : list) {
			logger.info("리스트 올ㅋ : "+libraryList);
		}
	   }
}
