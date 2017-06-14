package com.object.asc.log.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.object.asc.log.dao.LogDAO;
import com.object.asc.log.domain.Log;

@Service
public class LogServiceImpl implements LogService {

	
	@Inject
	private LogDAO logDao;
	
	
	@Override
	public List<String> logListAll(int projectListNo, int userNo) {
		return logDao.logListAll(projectListNo, userNo);
	}

}
