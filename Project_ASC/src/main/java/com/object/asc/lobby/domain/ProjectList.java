package com.object.asc.lobby.domain;

import java.sql.Date;

/**
 *
 * 프로젝트 내역 관련 객체 선언 및 getter(), setter() 메소드 정의
 * 
 * @패키지 : com.object.asc.lobby.domain
 * @파일명 : ProjectList.java
 * @작성자 : 김동현
 * @작성일 : 2017. 6. 01. 
 *
 */
public class ProjectList {
	private int projectListNo;
	private int projectJoinNo;
	private String projectName;
	private String projectPhoto;
	private String chatName;
	private String chatContent;
	private Date startDate;
	private Date endDate;
	private String content;
	public ProjectList() { }
	public ProjectList(int projectListNo, int projectJoinNo, String projectName, String projectPhoto, String chatName,
			String chatContent, Date startDate, Date endDate, String content) {
		this.projectListNo = projectListNo;
		this.projectJoinNo = projectJoinNo;
		this.projectName = projectName;
		this.projectPhoto = projectPhoto;
		this.chatName = chatName;
		this.chatContent = chatContent;
		this.startDate = startDate;
		this.endDate = endDate;
		this.content = content;
	}
	public int getProjectListNo() {
		return projectListNo;
	}
	public void setProjectListNo(int projectListNo) {
		this.projectListNo = projectListNo;
	}
	public int getProjectJoinNo() {
		return projectJoinNo;
	}
	public void setProjectJoinNo(int projectJoinNo) {
		this.projectJoinNo = projectJoinNo;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getProjectPhoto() {
		return projectPhoto;
	}
	public void setProjectPhoto(String projectPhoto) {
		this.projectPhoto = projectPhoto;
	}
	public String getChatName() {
		return chatName;
	}
	public void setChatName(String chatName) {
		this.chatName = chatName;
	}
	public String getChatContent() {
		return chatContent;
	}
	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
	
}
