package dev.mvc.restaurant;

public class RecommendationVO {
	
	private int recono;
	private int mno;
	private int rno;
	private String rdate;
	
	public int getRecono() {
		return recono;
	}
	public void setRecono(int recono) {
		this.recono = recono;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	@Override
	public String toString() {
		return "Recommendation [recono=" + recono + ", mno=" + mno + ", rno=" + rno + ", rdate=" + rdate + "]";
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

}
