package com.object.asc.project.domain;

/**
 * 
 * 카테고리 관련 객체 선언 및 getter(), setter() 메소드 정의
 * 
 * @패키지 : com.object.asc.project.domain
 * @파일명 : Category.java
 * @작성자 : 이종윤
 * @작성일 : 2017. 6. 01. 
 *
 */
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
