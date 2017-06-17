package com.object.asc.gantt.domain;

public class Scrum {
	
	private int scrumNo;
	private int projectListNo;
	
	public Scrum() {
		super();
	}

	public Scrum(int scrumNo, int projectListNo) {
		super();
		this.scrumNo = scrumNo;
		this.projectListNo = projectListNo;
	}

	public int getScrumNo() {
		return scrumNo;
	}

	public void setScrumNo(int scrumNo) {
		this.scrumNo = scrumNo;
	}

	public int getProjectListNo() {
		return projectListNo;
	}

	public void setProjectListNo(int projectListNo) {
		this.projectListNo = projectListNo;
	}

	@Override
	public String toString() {
		return "Scrum [scrumNo=" + scrumNo + ", projectListNo=" + projectListNo + "]";
	}

	
	

}
