package com.object.asc.user.service;

import java.sql.Date;
import java.util.List;

import com.object.asc.user.domain.User;

public interface UserService {
	
	/** 회원 가입 */
	public void register(User user);
	
	/** 회원 정보 불러오기*/
	public User get(int userNo);
	
	/** 회원 정보 수정 */
	public void modify(User user);
	
	/** 로그인 */
	public User login(User user);
	
	/** 로그인사용자의 세션키와 세션리밋 업뎃*/
	public void keepLogin(String id, String sessionId, Date sessionLimit);
	
	/** 로그인쿠키로 사용자 조회 */
	public User checkUserWithSessionKey(String cookieValue);
	
<<<<<<< HEAD
	/** 회원 탈퇴 */
	public void delete(User user);
	
=======
>>>>>>> branch 'master' of https://github.com/don-key/asc
	/** 회원 '?%'로 시작하는 아이디 검색 */
	public List<String> userFind(String id); 
	
	/** 회원 아이디로 번호 검색 */
	public int userIdFind(String id);
}
