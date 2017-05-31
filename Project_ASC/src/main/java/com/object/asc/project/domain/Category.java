package com.object.asc.project.domain;

public class Category {
	private int categoryNo;
	private int projectReleaseNo;
	private int scrumNo;
	private String title;

	public Category() {}

	public Category(int categoryNo, int projectReleaseNo, int scrumNo, String title) {
		this.categoryNo = categoryNo;
		this.projectReleaseNo = projectReleaseNo;
		this.scrumNo = scrumNo;
		this.title = title;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public int getProjectReleaseNo() {
		return projectReleaseNo;
	}

	public void setProjectReleaseNo(int projectReleaseNo) {
		this.projectReleaseNo = projectReleaseNo;
	}

	public int getScrumNo() {
		return scrumNo;
	}

	public void setScrumNo(int scrumNo) {
		this.scrumNo = scrumNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Override
	public String toString() {
		return "Category [categoryNo=" + categoryNo + ", projectReleaseNo=" + projectReleaseNo + ", scrumNo=" + scrumNo
				+ ", title=" + title + "]";
	}

}
