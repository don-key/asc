package com.object.asc.user.dao;

import java.sql.Date;

import com.object.asc.user.domain.User;

public interface UserDAO {
	
	/** 회원 가입 */
	public void register(User user);
	
	/** 회원 정보수정 */
	public void modify(User user);
	
	/** 로그인 */
	public User login(User user);
	
	/** 로그인사용자의 세션키와 세션리밋 업뎃*/
	public void keepLogin(String id, String sessionId, Date sessionLimit);
	
	/** 로그인쿠키로 사용자 조회 */
	public User checkUserWithSessionKey(String cookieValue);
}
