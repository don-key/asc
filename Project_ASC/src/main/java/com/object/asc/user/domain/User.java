package com.object.asc.user.domain;

public class User {
	private int userNo;
	private String id;
	private String password;
	private String name;
	private String phone;
	private String photo;
	private int status;
	private boolean useCookie;
	
	public User() {}

	public User(int userNo, String id, String password, String name, String phone, String photo, int status,
			boolean useCookie) {
		this.userNo = userNo;
		this.id = id;
		this.password = password;
		this.name = name;
		this.phone = phone;
		this.photo = photo;
		this.status = status;
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

	public boolean isUseCookie() {
		return useCookie;
	}

	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}

	@Override
	public String toString() {
		return "User [userNo=" + userNo + ", id=" + id + ", password=" + password + ", name=" + name + ", phone="
				+ phone + ", photo=" + photo + ", status=" + status + ", useCookie=" + useCookie + "]";
	}
	
}
