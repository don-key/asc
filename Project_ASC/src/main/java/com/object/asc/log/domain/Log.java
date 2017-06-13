package com.object.asc.log.domain;

public class Log {
	private int logListNo;
	private int projectListNo;
	private int userNo;
	private String content; 
	
	public Log(){}

	public Log(int logListNo, int projectListNo, int userNo, String content) {
		super();
		this.logListNo = logListNo;
		this.projectListNo = projectListNo;
		this.userNo = userNo;
		this.content = content;
	}

	public int getLogListNo() {
		return logListNo;
	}

	public void setLogListNo(int logListNo) {
		this.logListNo = logListNo;
	}

	public int getProjectListNo() {
		return projectListNo;
	}

	public void setProjectListNo(int projectListNo) {
		this.projectListNo = projectListNo;
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

	@Override
	public String toString() {
		return "Log [logListNo=" + logListNo + ", projectListNo=" + projectListNo + ", userNo=" + userNo + ", content="
				+ content + "]";
	}
	
}
