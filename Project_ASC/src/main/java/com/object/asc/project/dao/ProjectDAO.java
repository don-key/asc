package com.object.asc.project.dao;

import java.util.List;

import com.object.asc.gantt.domain.ActionChart;
import com.object.asc.gantt.domain.GanttChart;
import com.object.asc.project.domain.DashBoard;
import com.object.asc.project.domain.Library;
import com.object.asc.project.domain.LibraryList;
import com.object.asc.project.domain.ProjectRelease;
import com.object.asc.project.domain.Scrum;
import com.object.asc.project.domain.Sprint;

public interface ProjectDAO {
	
	/** 자료 내역 신규 등록 */
	public void libraryListRegister (LibraryList libraryList);
	
	/** 자료 내역 삭제 */
	public void libraryListDelete (int libraryListNo);
	
	/** 자료 내역 목록 뿌려주기 */
	public List<LibraryList> libraryListListAll();
	
	/** 1-4. 대쉬보드 생성(회원 전부) */
	public void dashBoardRegister(DashBoard dashBoard);
	/** 1-5. 릴리즈 생성 */
	public void projectReleaseRegister(ProjectRelease projectRelease);
	/** 1-6. 자료실 생성 */
	public void libraryRegister(Library library);
	/** 1-7. 간트차트 생성 */
	public void ganttChartRegister(GanttChart ganttChart);
	/** 1-8. 계획 실행 차트 생성*/
	public void actionChartRegister(ActionChart actionChart);
    /** 1-9. 스크럼 생성 */
	public void scrumRegister(Scrum scrum);
	/** 1-10. 스프린트 생성*/
	public void sprintRegister(Sprint sprint);
	
	/** 채팅방 이름 조회 */
	public String chatName(int projectListNo);
	
	/** 대시보드 번호 조회 */
	public int findDashBoard (int projectListNo, int userNo);
	
	/** 메모 업데이트 */
	public void memoUpdate (int dashBoardNo, String memo);
}
