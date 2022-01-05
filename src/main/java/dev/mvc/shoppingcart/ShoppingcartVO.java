package dev.mvc.shoppingcart;

public class ShoppingcartVO {

	@Override
	public String toString() {
		return "ShoppingcartVO [scno=" + scno + ", rno=" + rno + ", mno=" + mno + ", menuno=" + menuno + ", count="
				+ count + ", rdate=" + rdate + "]";
	}
	public int getScno() {
		return scno;
	}
	public void setScno(int scno) {
		this.scno = scno;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getMenuno() {
		return menuno;
	}
	public void setMenuno(int menuno) {
		this.menuno = menuno;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	private int scno;
	private int rno;
	private int mno;
	private int menuno;
	private int count;
	private String rdate;

}
