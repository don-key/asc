package com.object.asc.project.domain;

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
