package com.object.asc.project.domain;

public class Library {
	private int libraryNo;
	private int projectListNo;
	
	public Library() {}
	
	public Library(int libraryNo, int projectListNo) {
		this.libraryNo = libraryNo;
		this.projectListNo = projectListNo;
	}
	
	public int getLibraryNo() {
		return libraryNo;
	}
	
	public void setLibraryNo(int libraryNo) {
		this.libraryNo = libraryNo;
	}
	
	public int getProjectListNo() {
		return projectListNo;
	}
	
	public void setProjectListNo(int projectListNo) {
		this.projectListNo = projectListNo;
	}
	
	@Override
	public String toString() {
		return "Library [libraryNo=" + libraryNo + ", projectListNo=" + projectListNo + "]";
	}
}