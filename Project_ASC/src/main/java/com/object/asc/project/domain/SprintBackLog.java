package com.object.asc.project.domain;
/**
 * 
 * 테스크보드 관련 객체 선언 및 getter(), setter() 메소드 정의
 * 
 * @패키지 : com.object.asc.project.domain
 * @파일명 : SprintBackLog.java
 * @작성자 : 이종윤
 * @작성일 : 2017. 6. 01.
 *
 */
public class SprintBackLog {
	private int sprintBackLogNo;
	private int sprintNo;
	private int userStoryNo;
	private int userNo;
	private String content;
	private int status;

	public SprintBackLog() { }

	public SprintBackLog(int sprintBackLogNo, int sprintNo, int userStoryNo, int userNo, String content, int status) {
		this.sprintBackLogNo = sprintBackLogNo;
		this.sprintNo = sprintNo;
		this.userStoryNo = userStoryNo;
		this.userNo = userNo;
		this.content = content;
		this.status = status;
	}

	public int getSprintBackLogNo() {
		return sprintBackLogNo;
	}

	public void setSprintBackLogNo(int sprintBackLogNo) {
		this.sprintBackLogNo = sprintBackLogNo;
	}

	public int getSprintNo() {
		return sprintNo;
	}

	public void setSprintNo(int sprintNo) {
		this.sprintNo = sprintNo;
	}

	public int getUserStoryNo() {
		return userStoryNo;
	}

	public void setUserStoryNo(int userStoryNo) {
		this.userStoryNo = userStoryNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "SprintBackLog [sprintBackLogNo=" + sprintBackLogNo + ", sprintNo=" + sprintNo + ", userStoryNo="
				+ userStoryNo + ", userNo=" + userNo + ", content=" + content + ", status=" + status + "]";
	}

}
