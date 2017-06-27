package com.object.asc.gantt.domain;

/**
 * 
 * 진행차트 관련 객체 선언 및 getter(), setter() 메소드 정의
 * 
 * @패키지 : com.object.asc.gantt.domain
 * @파일명 : ActionChart.java
 * @작성자 : 이지수 
 * @작성일 : 2017. 6. 01.
 *
 */
public class ActionChart {
	
	private int actionNo;
	private int projectListNo;
	private String actionPercent;
	
	public ActionChart() {
	}

	public ActionChart(int actionNo, int projectListNo, String actionPercent) {
		super();
		this.actionNo = actionNo;
		this.projectListNo = projectListNo;
		this.actionPercent = actionPercent;
	}

	public int getActionNo() {
		return actionNo;
	}

	public void setActionNo(int actionNo) {
		this.actionNo = actionNo;
	}

	public int getProjectListNo() {
		return projectListNo;
	}

	public void setProjectListNo(int projectListNo) {
		this.projectListNo = projectListNo;
	}

	public String getActionPercent() {
		return actionPercent;
	}

	public void setActionPercent(String actionPercent) {
		this.actionPercent = actionPercent;
	}

	@Override
	public String toString() {
		return "ActionChart [actionNo=" + actionNo + ", projectListNo=" + projectListNo + ", actionPercent="
				+ actionPercent + "]";
	}
	
	
	
	

}
