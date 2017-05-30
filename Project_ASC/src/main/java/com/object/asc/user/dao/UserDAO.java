package com.object.asc.user.dao;

import com.object.asc.user.domain.User;

public interface UserDAO {
	
	/** 회원 가입 */
	public void register(User user);
}
