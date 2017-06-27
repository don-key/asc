package com.object.asc.project.domain;
/**
 * 
 * 자료실 관련 객체 선언 및 getter(), setter() 메소드 정의
 * 
 * @패키지 : com.object.asc.project.domain
 * @파일명 : Library.java
 * @작성자 : 이종윤
 * @작성일 : 2017. 6. 01.
 *
 */
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