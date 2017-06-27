package com.object.asc.project.domain;

import java.util.Date;
/**
 * 
 * 자료 내역 관련 객체 선언 및 getter(), setter() 메소드 정의
 * 
 * @패키지 : com.object.asc.project.domain
 * @파일명 : LibraryList.java
 * @작성자 : 이종윤
 * @작성일 : 2017. 6. 01.
 *
 */
public class LibraryList {
	private int libraryListNo;
	private int libraryNo;
	private int userNo;
	private String title;
	private String fileName;
	private String uuidName;
	private String displayName;
	private Date regdate;

	public LibraryList() {	}

	public LibraryList(int libraryListNo, int libraryNo, int userNo, String title, String fileName, String uuidName,
			String displayName, Date regdate) {
		this.libraryListNo = libraryListNo;
		this.libraryNo = libraryNo;
		this.userNo = userNo;
		this.title = title;
		this.fileName = fileName;
		this.uuidName = uuidName;
		this.displayName = displayName;
		this.regdate = regdate;
	}

	public int getLibraryListNo() {
		return libraryListNo;
	}

	public void setLibraryListNo(int libraryListNo) {
		this.libraryListNo = libraryListNo;
	}

	public int getLibraryNo() {
		return libraryNo;
	}

	public void setLibraryNo(int libraryNo) {
		this.libraryNo = libraryNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getUuidName() {
		return uuidName;
	}

	public void setUuidName(String uuidName) {
		this.uuidName = uuidName;
	}

	public String getDisplayName() {
		return displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "LibraryList [libraryListNo=" + libraryListNo + ", libraryNo=" + libraryNo + ", userNo=" + userNo
				+ ", title=" + title + ", fileName=" + fileName + ", uuidName=" + uuidName + ", displayName="
				+ displayName + ", regdate=" + regdate + "]";
	}
}
