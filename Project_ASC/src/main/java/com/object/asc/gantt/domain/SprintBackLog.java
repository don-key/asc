package com.object.asc.gantt.domain;

import java.sql.Date;

/**
 * 
 * 스프린트 백로그 관련 객체 선언 및 getter(), setter() 메소드 정의
 * 
 * @패키지 : com.object.asc.gantt.domain
 * @파일명 : SprintBackLog.java
 * @작성자 : 이지수
 * @작성일 : 2017. 6. 01.
 *
 */
public class SprintBackLog {
	
	private int sprintBackLog;
	private int sprintNo;
	private int userStoryNo;
	private int userNo;
	private String content;
	private int status;
	private Date doneDate;
	
	public SprintBackLog() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public SprintBackLog(int sprintBackLog, int sprintNo, int userStoryNo, int userNo, String content, int status,
			Date doneDate) {
		super();
		this.sprintBackLog = sprintBackLog;
		this.sprintNo = sprintNo;
		this.userStoryNo = userStoryNo;
		this.userNo = userNo;
		this.content = content;
		this.status = status;
		this.doneDate = doneDate;
	}
	
	public int getSprintBackLog() {
		return sprintBackLog;
	}
	public void setSprintBackLog(int sprintBackLog) {
		this.sprintBackLog = sprintBackLog;
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
	public Date getDoneDate() {
		return doneDate;
	}
	public void setDoneDate(Date doneDate) {
		this.doneDate = doneDate;
	}
	
	@Override
	public String toString() {
		return "SprintBackLog [sprintBackLog=" + sprintBackLog + ", sprintNo=" + sprintNo + ", userStoryNo="
				+ userStoryNo + ", userNo=" + userNo + ", content=" + content + ", status=" + status + ", doneDate="
				+ doneDate + "]";
	}
	
	

}
