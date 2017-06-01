package com.object.asc.user.service;

import com.object.asc.user.domain.User;

public interface UserService {
	
	/** 회원 가입 */
	public void register(User user);
	
	/** 회원 정보 수정 */
	public void modify(User user);
	
	/** 로그인 */
	public User login(User user);
}
