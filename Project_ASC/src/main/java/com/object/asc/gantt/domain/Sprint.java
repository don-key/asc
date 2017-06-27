package com.object.asc.gantt.domain;

import java.sql.Date;

/**
 * 
 * 스프린트 관련 객체 선언 및 getter(), setter() 메소드 정의
 * 
 * @패키지 : com.object.asc.gantt.domain
 * @파일명 : Sprint.java
 * @작성자 : 이지수
 * @작성일 : 2017. 6. 01.
 *
 */
public class Sprint {
	
	private int sprintNo;
	private int scrumNo;
	private Date startDate;
	private Date endDate;
	private int doCount;
	
	public Sprint() {
		super();
	}

	public Sprint(int sprintNo, int scrumNo, Date startDate, Date endDate, int doCount) {
		super();
		this.sprintNo = sprintNo;
		this.scrumNo = scrumNo;
		this.startDate = startDate;
		this.endDate = endDate;
		this.doCount = doCount;
	}

	public int getSprintNo() {
		return sprintNo;
	}

	public void setSprintNo(int sprintNo) {
		this.sprintNo = sprintNo;
	}

	public int getScrumNo() {
		return scrumNo;
	}

	public void setScrumNo(int scrumNo) {
		this.scrumNo = scrumNo;
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

	public int getDoCount() {
		return doCount;
	}

	public void setDoCount(int doCount) {
		this.doCount = doCount;
	}

	@Override
	public String toString() {
		return "Sprint [sprintNo=" + sprintNo + ", scrumNo=" + scrumNo + ", startDate=" + startDate + ", endDate="
				+ endDate + ", doCount=" + doCount + "]";
	}
	

	
	
	

}
