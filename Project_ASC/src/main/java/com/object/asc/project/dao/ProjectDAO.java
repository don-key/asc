package com.object.asc.project.dao;

import java.util.List;

import com.object.asc.project.domain.LibraryList;

public interface ProjectDAO {
	
	/** 자료 내역 신규 등록 */
	public void libraryListRegister (LibraryList libraryList);
	
	/** 자료 내역 삭제 */
	public void libraryListDelete (int libraryListNo);
	
	/** 자료 내역 목록 뿌려주기 */
	public List<LibraryList> libraryListListAll();
}