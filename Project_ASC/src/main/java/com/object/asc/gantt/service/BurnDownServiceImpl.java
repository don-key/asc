package com.object.asc.gantt.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.object.asc.gantt.dao.BurnDownDao;

/**
 * 
 * 번다운 인터페이스 구현 클래스
 * 
 * @패키지 : com.object.asc.gantt.service
 * @파일명 : BurnDownServiceImpl.java
 * @작성자 : 이지수 
 * @작성일 : 2017. 6. 01. 
 *
 */
@Service
public class BurnDownServiceImpl implements BurnDownService {
	
	@Inject
	private BurnDownDao dao;

	@Override
	public List<HashMap<String, Object>> getSprintNo(int projectListNo) {
		return dao.getSprintNo(projectListNo);
	}

	@Override
	public List<HashMap<String, Object>> getSprintBackLog(int projectListNo) {
		return dao.getSprintBackLog(projectListNo);
	}

	@Override
	public int backLogCount(int sprintNo) {
		return dao.backLogCount(sprintNo);
	}

	@Override
	public List<String> doneDate(int sprintNo) {
		return dao.doneDate(sprintNo);
	}

}
