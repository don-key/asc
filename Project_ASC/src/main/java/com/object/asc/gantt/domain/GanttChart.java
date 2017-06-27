package com.object.asc.gantt.domain;

/**
 *
 * 간트차트 관련 객체 선언 및 getter(), setter() 메소드 정의
 * 
 * @패키지 : com.object.asc.gantt.domain
 * @파일명 : GanttChart.java
 * @작성자 : 이지수
 * @작성일 : 2017. 6. 01. 
 *
 */
public class GanttChart {
	
	private int ganttNo;
	private int projectListNo;
	
	public GanttChart() {
	}
	
	public GanttChart(int ganttNo, int projectListNo) {
		super();
		this.ganttNo = ganttNo;
		this.projectListNo = projectListNo;
	}

	public int getGanttNo() {
		return ganttNo;
	}

	public void setGanttNo(int ganttNo) {
		this.ganttNo = ganttNo;
	}

	public int getProjectListNo() {
		return projectListNo;
	}

	public void setProjectListNo(int projectListNo) {
		this.projectListNo = projectListNo;
	}

	@Override
	public String toString() {
		return "GanttChart [ganttNo=" + ganttNo + ", projectListNo=" + projectListNo + "]";
	}
	
	
	

}
