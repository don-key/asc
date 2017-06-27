package com.object.asc.project.domain;
/**
 * 
 * 스크럼 관련 객체 선언 및 getter(), setter() 메소드 정의
 * 
 * @패키지 : com.object.asc.project.domain
 * @파일명 : Scrum.java
 * @작성자 : 이종윤
 * @작성일 : 2017. 6. 01.
 *
 */
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
