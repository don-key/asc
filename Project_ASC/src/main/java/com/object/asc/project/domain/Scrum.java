package com.object.asc.project.domain;

public class Scrum {
	private int scrumNo;
	private int projectListNo;

	public Scrum() { }

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
