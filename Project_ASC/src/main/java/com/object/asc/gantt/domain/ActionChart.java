package com.object.asc.gantt.domain;

public class ActionChart {
	
	private int actionNo;
	private int projectListNo;
	
	public ActionChart() {
	}
	
	public ActionChart(int actionNo, int projectListNo) {
		super();
		this.actionNo = actionNo;
		this.projectListNo = projectListNo;
	}

	public int getActionNo() {
		return actionNo;
	}

	public void setActionNo(int actionNo) {
		this.actionNo = actionNo;
	}

	public int getProjectListNo() {
		return projectListNo;
	}

	public void setProjectListNo(int projectListNo) {
		this.projectListNo = projectListNo;
	}

	@Override
	public String toString() {
		return "ActionChart [actionNo=" + actionNo + ", projectListNo=" + projectListNo + "]";
	}
	
	
	

}
