package com.object.asc.project.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.object.asc.lobby.domain.ProjectList;
import com.object.asc.project.domain.LibraryList;

@Repository
public class ProjectDAOImpl implements ProjectDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static String namespace="com.object.asc.mapper.ProjectMapper";

	@Override
	public void libraryListRegister(LibraryList libraryList) {
		sqlSession.insert(namespace+".libraryListRegister", libraryList);
	}

	@Override
	public void libraryListDelete(int libraryListNo) {
		sqlSession.delete(namespace+".libraryListDelete", libraryListNo);
	}

	@Override
	public List<LibraryList> libraryListListAll() {
		return sqlSession.selectList(namespace+".libraryListListAll");
	}
	
}
