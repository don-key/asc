package com.object.asc.log.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.object.asc.log.dao.LogDAO;
import com.object.asc.log.domain.Log;

/**
 * 
 * 로그 인터페이스 구현 클래스
 * 
 * @패키지 : com.object.asc.log.service
 * @파일명 : LogServiceImpl.java
 * @작성자 : 최신영 
 * @작성일 : 2017. 6. 01. 
 *
 */
@Service
public class LogServiceImpl implements LogService {

	
	@Inject
	private LogDAO logDao;
	
	
	@Override
	public List<String> logListAll(int projectListNo, int userNo) {
		return logDao.logListAll(projectListNo, userNo);
	}

}
