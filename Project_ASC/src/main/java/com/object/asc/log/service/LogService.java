package com.object.asc.log.service;

import java.util.List;

import com.object.asc.log.domain.Log;

/**
 *
 * 로그 관련 인터페이스 정의
 * 
 * @패키지 : com.object.asc.log.service
 * @파일명 : LogService.java
 * @작성자 : 최신영
 * @작성일 : 2017. 6. 01.
 *
 */
public interface LogService {
	/** 로그 리스트 조회 */
	public List<String> logListAll(int projectListNo, int userNo); 
}
