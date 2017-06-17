package com.object.asc.gantt.domain;

import java.sql.Date;

public class Sprint {
	
	private int sprintNo;
	private int scrumNo;
	private Date startDate;
	private Date endDate;
	
	public Sprint() {
		super();
	}

	public Sprint(int sprintNo, int scrumNo, Date startDate, Date endDate) {
		super();
		this.sprintNo = sprintNo;
		this.scrumNo = scrumNo;
		this.startDate = startDate;
		this.endDate = endDate;
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

	@Override
	public String toString() {
		return "Sprint [sprintNo=" + sprintNo + ", scrumNo=" + scrumNo + ", startDate=" + startDate + ", endDate="
				+ endDate + "]";
	}
	
	
	

}
