package com.object.asc.log.service;

import java.util.List;

import com.object.asc.log.domain.Log;

public interface LogService {
	/** 로그 리스트 조회 */
	public List<String> logListAll(int projectListNo, int userNo); 
}
