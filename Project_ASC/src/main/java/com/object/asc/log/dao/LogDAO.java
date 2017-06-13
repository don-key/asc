package com.object.asc.log.dao;

import com.object.asc.log.domain.Log;

public interface LogDAO {
	
	/** 로그기록 */
	public void writeLog(Log log);
	
	
}
