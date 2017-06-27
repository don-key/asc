package com.object.asc.user.domain;

import java.sql.Date;

/**
 * 
 * 유저 관련 객체 선언 및 getter(), setter() 메소드 정의
 * 
 * @패키지 : com.object.asc.user.domain
 * @파일명 : User.java
 * @작성자 : 이현명
 * @작성일 : 2017. 6. 01. 
 *
 */
public class User {
	private int userNo;
	private String id;
	private String password;
	private String name;
	private String phone;
	private String photo;
	private int status;
	private Date recentLogin;
	private String sessionKey;
	private Date sessionLimit;
	private boolean useCookie;
	
	public User() {}

	public User(int userNo, String id, String password, String name, String phone, String photo, int status,
			Date recentLogin, String sessionKey, Date sessionLimit, boolean useCookie) {
		this.userNo = userNo;
		this.id = id;
		this.password = password;
		this.name = name;
		this.phone = phone;
		this.photo = photo;
		this.status = status;
		this.recentLogin = recentLogin;
		this.sessionKey = sessionKey;
		this.sessionLimit = sessionLimit;
		this.useCookie = useCookie;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Date getRecentLogin() {
		return recentLogin;
	}

	public void setRecentLogin(Date recentLogin) {
		this.recentLogin = recentLogin;
	}

	public String getSessionKey() {
		return sessionKey;
	}

	public void setSessionKey(String sessionKey) {
		this.sessionKey = sessionKey;
	}

	public Date getSessionLimit() {
		return sessionLimit;
	}

	public void setSessionLimit(Date sessionLimit) {
		this.sessionLimit = sessionLimit;
	}

	public boolean isUseCookie() {
		return useCookie;
	}

	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}

	@Override
	public String toString() {
		return "User [userNo=" + userNo + ", id=" + id + ", password=" + password + ", name=" + name + ", phone="
				+ phone + ", photo=" + photo + ", status=" + status + ", recentLogin=" + recentLogin + ", sessionKey="
				+ sessionKey + ", sessionLimit=" + sessionLimit + ", useCookie=" + useCookie + "]";
	}
	
	
	

}
