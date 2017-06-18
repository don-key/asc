package com.object.asc.gantt.service;

import java.util.HashMap;
import java.util.List;


public interface BurnDownService {
	
	/** 스프린트넘버 조회 */
	public List<HashMap<String, Object>> getSprintNo(int projectListNo);
	
	/** 스프린트백로그 조회 */
	public List<HashMap<String, Object>> getSprintBackLog(int projectListNo);
	
	/** 스프린트백로그 개수 조회 */
	public int backLogCount (int sprintNo);
	
	/** 스프린트백로그 끝난날 조회 */
	public List<String> doneDate (int sprintNo);
	
}
