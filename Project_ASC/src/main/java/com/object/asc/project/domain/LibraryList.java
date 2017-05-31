package com.object.asc.project.domain;

import java.util.Date;

public class LibraryList {
	private int libraryListNo;
	private int libraryNo;
	private int userNo;
	private String title;
	private String fileName;
	private Date regdate;

	public LibraryList() {}

	public LibraryList(int libraryListNo, int libraryNo, int userNo, String title, String fileName, Date regdate) {
		this.libraryListNo = libraryListNo;
		this.libraryNo = libraryNo;
		this.userNo = userNo;
		this.title = title;
		this.fileName = fileName;
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

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "LibraryList [libraryListNo=" + libraryListNo + ", libraryNo=" + libraryNo + ", userNo=" + userNo
				+ ", title=" + title + ", fileName=" + fileName + ", regdate=" + regdate + "]";
	}

}
