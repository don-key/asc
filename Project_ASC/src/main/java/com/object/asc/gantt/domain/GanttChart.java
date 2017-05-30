package com.object.asc.gantt.domain;

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
