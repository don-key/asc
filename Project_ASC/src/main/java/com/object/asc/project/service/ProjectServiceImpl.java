package com.object.asc.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.object.asc.lobby.domain.ProjectList;
import com.object.asc.project.dao.ProjectDAO;
import com.object.asc.project.domain.LibraryList;

@Service
public class ProjectServiceImpl implements ProjectService {
	
	@Inject
	private ProjectDAO dao;

	@Override
	public void libraryListRegister(LibraryList libraryList) {
		dao.libraryListRegister(libraryList);
	}

	@Override
	public void libraryListDelete(int libraryListNo) {
		dao.libraryListDelete(libraryListNo);
	}

	@Override
	public List<LibraryList> libraryListListAll() {
		return dao.libraryListListAll();
	}


	
	


}
