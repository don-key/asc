package com.object.asc.project.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.object.asc.project.dao.ProjectDAO;

@Service
public class ProjectServiceImpl implements ProjectService {
	
	@Inject
	private ProjectDAO dao;
	


}
