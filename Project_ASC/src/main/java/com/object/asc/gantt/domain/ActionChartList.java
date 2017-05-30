package com.object.asc.gantt.domain;

public class ActionChartList {
	private int actionListNo;
	private int actionNo;
	private int ganttListNo;
	private int userNo;
	private String ganttDate;
	private int status;
	
	public ActionChartList() {
	}

	public ActionChartList(int actionListNo, int actionNo, int ganttListNo, int userNo, String ganttDate, int status) {
		super();
		this.actionListNo = actionListNo;
		this.actionNo = actionNo;
		this.ganttListNo = ganttListNo;
		this.userNo = userNo;
		this.ganttDate = ganttDate;
		this.status = status;
	}

	public int getActionListNo() {
		return actionListNo;
	}

	public void setActionListNo(int actionListNo) {
		this.actionListNo = actionListNo;
	}

	public int getActionNo() {
		return actionNo;
	}

	public void setActionNo(int actionNo) {
		this.actionNo = actionNo;
	}

	public int getGanttListNo() {
		return ganttListNo;
	}

	public void setGanttListNo(int ganttListNo) {
		this.ganttListNo = ganttListNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getGanttDate() {
		return ganttDate;
	}

	public void setGanttDate(String ganttDate) {
		this.ganttDate = ganttDate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "ActionChartList [actionListNo=" + actionListNo + ", actionNo=" + actionNo + ", ganttListNo="
				+ ganttListNo + ", userNo=" + userNo + ", ganttDate=" + ganttDate + ", status=" + status + "]";
	}
	
	

}
