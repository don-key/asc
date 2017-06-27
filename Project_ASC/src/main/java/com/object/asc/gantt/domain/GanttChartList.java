package com.object.asc.gantt.domain;

import java.sql.Date;

/**
 *
 * 간트차트 내역 관련 객체 선언 및 getter(), setter() 메소드 정의
 * 
 * @패키지 : com.object.asc.gantt.domain
 * @파일명 : GanttChartList.java
 * @작성자 : 이지수
 * @작성일 : 2017. 6. 01.
 *
 */
public class GanttChartList {
	
	private int ganttListNo;
	private int ganttNo;
	private int userNo;
	private String title;
	private String worker;
	private Date startDate;
	private Date endDate;
	private String color;
	
	public GanttChartList() {
	}

	public GanttChartList(int ganttListNo, int ganttNo, int userNo, String title, String worker, Date startDate,
			Date endDate, String color) {
		super();
		this.ganttListNo = ganttListNo;
		this.ganttNo = ganttNo;
		this.userNo = userNo;
		this.title = title;
		this.worker = worker;
		this.startDate = startDate;
		this.endDate = endDate;
		this.color = color;
	}

	public int getGanttListNo() {
		return ganttListNo;
	}

	public void setGanttListNo(int ganttListNo) {
		this.ganttListNo = ganttListNo;
	}

	public int getGanttNo() {
		return ganttNo;
	}

	public void setGanttNo(int ganttNo) {
		this.ganttNo = ganttNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWorker() {
		return worker;
	}

	public void setWorker(String worker) {
		this.worker = worker;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	@Override
	public String toString() {
		return "GanttChartList [ganttListNo=" + ganttListNo + ", ganttNo=" + ganttNo + ", userNo=" + userNo + ", title="
				+ title + ", worker=" + worker + ", startDate=" + startDate + ", endDate=" + endDate + ", color="
				+ color + "]";
	}
	
	
	

}
