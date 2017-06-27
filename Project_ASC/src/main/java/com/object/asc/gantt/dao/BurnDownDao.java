package com.object.asc.gantt.dao;

import java.util.HashMap;
import java.util.List;

/**
 * 
 * 번다운차트 관련 DB에서 데이터를 가져와 모델 생성
 * 
 * @패키지 : com.object.asc.gantt.dao
 * @파일명 : BurnDownDao.java
 * @작성자 : 이지수
 * @작성일 : 2017. 6. 01. 
 *
 */
public interface BurnDownDao {
	
	/** 스프린트넘버 조회 */
	public List<HashMap<String, Object>> getSprintNo(int projectListNo);
	
	/** 스프린트백로그 조회 */
	public List<HashMap<String, Object>> getSprintBackLog(int projectListNo);
	
	/** 스프린트백로그 개수 조회 */
	public int backLogCount (int sprintNo);
	
	/** 스프린트백로그 끝난날 조회 */
	public List<String> doneDate (int sprintNo);
	

}
