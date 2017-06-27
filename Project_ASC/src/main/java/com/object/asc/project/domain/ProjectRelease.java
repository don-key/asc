package com.object.asc.project.domain;
/**
 * 
 * 릴리즈 관련 객체 선언 및 getter(), setter() 메소드 정의
 * 
 * @패키지 : com.object.asc.project.domain
 * @파일명 : ProjectRelease.java
 * @작성자 : 이종윤
 * @작성일 : 2017. 6. 01.
 *
 */
public class ProjectRelease {
	private int projectReleaseNo;
	private int projectListNo;
	public ProjectRelease() { }
	public ProjectRelease(int projectReleaseNo, int projectListNo) {
		this.projectReleaseNo = projectReleaseNo;
		this.projectListNo = projectListNo;
	}
	public int getProjectReleaseNo() {
		return projectReleaseNo;
	}
	public void setProjectReleaseNo(int projectReleaseNo) {
		this.projectReleaseNo = projectReleaseNo;
	}
	public int getProjectListNo() {
		return projectListNo;
	}
	public void setProjectListNo(int projectListNo) {
		this.projectListNo = projectListNo;
	}
	@Override
	public String toString() {
		return "ProjectRelease [projectReleaseNo=" + projectReleaseNo + ", projectListNo=" + projectListNo + "]";
	}
}
