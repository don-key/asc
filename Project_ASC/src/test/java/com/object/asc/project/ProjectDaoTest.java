package com.object.asc.project;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.object.asc.gantt.domain.ActionChart;
import com.object.asc.gantt.domain.GanttChart;
import com.object.asc.project.dao.ProjectDAO;
import com.object.asc.project.domain.DashBoard;
import com.object.asc.project.domain.LibraryList;
import com.object.asc.project.domain.ProjectRelease;
import com.object.asc.project.domain.Scrum;
import com.object.asc.project.domain.Sprint;

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
	      
//	      dao.libraryListRegister(libraryList);
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
			dao.dashBoardRegister(dashBoard);
			logger.info("대쉬보드 생성");
		}
		

		/** 릴리즈, 자료실, 간트차트, 계획 실행 차트, 스크럼 생성
		 * 	projectListNo 동일하게 넣으면 됨
		 * */
		@Test
		public void lobbyTest(){
			ProjectRelease projectRelease = new ProjectRelease();
			projectRelease.setProjectListNo(1);
			dao.projectReleaseRegister(projectRelease);
			GanttChart ganttChart = new GanttChart();
			ganttChart.setProjectListNo(1);
			dao.ganttChartRegister(ganttChart);
			ActionChart actionChart = new ActionChart();
			actionChart.setProjectListNo(1);
			dao.actionChartRegister(actionChart);
			Scrum scrum = new Scrum();
			scrum.setProjectListNo(1);
			dao.scrumRegister(scrum);
		}
		
		/** 스프린트 생성 
		 *  projectListNo 동일하게 넣으면 됨
		 *  */
		@Test
		public void sprintRegister(){
			Sprint sprint = new Sprint();
			sprint.setScrumNo(1);
//			sprint.setStartDate(java.sql.Date.valueOf("2017-06-02"));
			sprint.setEndDate(null);
			dao.sprintRegister(sprint);
		}

		
}
