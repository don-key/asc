package com.object.asc.project.domain;
/**
 * 
 * 포커 관련 객체 선언 및 getter(), setter() 메소드 정의
 * 
 * @패키지 : com.object.asc.project.domain
 * @파일명 : Poker.java
 * @작성자 : 이종윤
 * @작성일 : 2017. 6. 01.
 *
 */
public class Poker {
	private int pokerNo;
	private int userStoryNo;
	private int userNo;
	private int score;

	public Poker() { }

	public Poker(int pokerNo, int userStoryNo, int userNo, int score) {
		this.pokerNo = pokerNo;
		this.userStoryNo = userStoryNo;
		this.userNo = userNo;
		this.score = score;
	}

	public int getPokerNo() {
		return pokerNo;
	}

	public void setPokerNo(int pokerNo) {
		this.pokerNo = pokerNo;
	}

	public int getUserStoryNo() {
		return userStoryNo;
	}

	public void setUserStoryNo(int userStoryNo) {
		this.userStoryNo = userStoryNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	@Override
	public String toString() {
		return "Poker [pokerNo=" + pokerNo + ", userStoryNo=" + userStoryNo + ", userNo=" + userNo + ", score=" + score
				+ "]";
	}

}
