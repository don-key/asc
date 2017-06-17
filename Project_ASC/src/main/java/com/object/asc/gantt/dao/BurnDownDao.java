package com.object.asc.gantt.dao;

import java.util.HashMap;
import java.util.List;


public interface BurnDownDao {
	
	/** 스프린트넘버 조회 */
	public List<HashMap<String, Object>> getSprintNo(int projectListNo);
	
	/** 스프린트백로그 조회 */
	public List<HashMap<String, Object>> getSprintBackLog(int projectListNo);
	

}
