package com.object.asc.project.domain;

public class UserStory {
	private int userStoryNo;
	private int projectReleaseNo;
	private int categoryNo;
	private String title;
	private String asA;
	private String iWant;
	private String soThat;
	private String priority;
	private int workingTime;

	public UserStory() { }

	public UserStory(int userStoryNo, int projectReleaseNo, int categoryNo, String title, String asA, String iWant,
			String soThat, String priority, int workingTime) {
		this.userStoryNo = userStoryNo;
		this.projectReleaseNo = projectReleaseNo;
		this.categoryNo = categoryNo;
		this.title = title;
		this.asA = asA;
		this.iWant = iWant;
		this.soThat = soThat;
		this.priority = priority;
		this.workingTime = workingTime;
	}

	public int getUserStoryNo() {
		return userStoryNo;
	}

	public void setUserStoryNo(int userStoryNo) {
		this.userStoryNo = userStoryNo;
	}

	public int getProjectReleaseNo() {
		return projectReleaseNo;
	}

	public void setProjectReleaseNo(int projectReleaseNo) {
		this.projectReleaseNo = projectReleaseNo;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAsA() {
		return asA;
	}

	public void setAsA(String asA) {
		this.asA = asA;
	}

	public String getiWant() {
		return iWant;
	}

	public void setiWant(String iWant) {
		this.iWant = iWant;
	}

	public String getSoThat() {
		return soThat;
	}

	public void setSoThat(String soThat) {
		this.soThat = soThat;
	}

	public String getPriority() {
		return priority;
	}

	public void setPriority(String priority) {
		this.priority = priority;
	}

	public int getWorkingTime() {
		return workingTime;
	}

	public void setWorkingTime(int workingTime) {
		this.workingTime = workingTime;
	}

	@Override
	public String toString() {
		return "UserStory [userStoryNo=" + userStoryNo + ", projectReleaseNo=" + projectReleaseNo + ", categoryNo="
				+ categoryNo + ", title=" + title + ", asA=" + asA + ", iWant=" + iWant + ", soThat=" + soThat
				+ ", priority=" + priority + ", workingTime=" + workingTime + "]";
	}

}
