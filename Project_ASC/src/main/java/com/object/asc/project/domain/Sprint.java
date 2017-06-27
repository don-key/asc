package com.object.asc.project.domain;

import java.util.Date;
/**
 * 
 * 스프린트 관련 객체 선언 및 getter(), setter() 메소드 정의
 * 
 * @패키지 : com.object.asc.project.domain
 * @파일명 : Sprint.java
 * @작성자 : 이종윤
 * @작성일 : 2017. 6. 01.
 *
 */
public class Sprint {
	private int sprintNo;
	private int scrumNo;
	private Date startDate;
	private Date endDate;

	public Sprint() { }

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

	@Override
	public String toString() {
		return "Sprint [sprintNo=" + sprintNo + ", scrumNo=" + scrumNo + ", startDate=" + startDate + ", endDate="
				+ endDate + "]";
	}

}
