package com.object.asc.log.dao;

import com.object.asc.log.domain.Log;

public interface LogDAO {
	
	/** 프로젝트 생성 (로그기록)*/
	public void logProjectListRegisterr(Log log);
	
	/** 프로젝트 수정 (로그기록)*/
	public void logProjectUpdate(Log log);
	
	/** 프로젝트 내역 삭제 (로그기록)*/
	public void projectListDelete(Log log);
	
}
