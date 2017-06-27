package com.object.asc.log.dao;

import java.util.List;

import com.object.asc.log.domain.Log;

/**
 * 
 * 로그 관련 DB에서 데이터를 가져와 모델 생성
 * 
 * @패키지 : com.object.asc.log.dao
 * @파일명 : LogDAO.java
 * @작성자 : 최신영
 * @작성일 : 2017. 6. 01. 
 *
 */
public interface LogDAO {
	
	/** 로그기록 */
	public void writeLog(Log log);
	
	/** 로그 리스트 조회 */
	public List<String> logListAll(int projectListNo, int userNo);
	
	
}
