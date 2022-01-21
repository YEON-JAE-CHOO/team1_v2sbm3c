package dev.mvc.orders;

public class OrdersVO {
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

	public int getOno() {
		return ono;
	}

	public void setOno(int ono) {
		this.ono = ono;
	}

	public String getRtime() {
		return rtime;
	}

	public void setRtime(String rtime) {
		this.rtime = rtime;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}

	public int getHousecode() {
		return housecode;
	}

	public void setHousecode(int housecode) {
		this.housecode = housecode;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public String getRequest() {
		return request;
	}

	public void setRequest(String request) {
		this.request = request;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getOname() {
		return oname;
	}

	public void setOname(String oname) {
		this.oname = oname;
	}

	private int scno;
	private int rno;
	private int mno;
	private int count;
	private String rdate;
	private int ono;
	private String rtime;
	private int price;
	private int totalprice;
	private int housecode;
	private String address1;
	private String address2;
	private String phone;
	private String oname;
	private String method;
	private String request;
	private int state = 0;

	@Override
	public String toString() {
		return "OrdersVO [scno=" + scno + ", rno=" + rno + ", mno=" + mno + ", count=" + count + ", rdate=" + rdate
				+ ", ono=" + ono + ", rtime=" + rtime + ", price=" + price + ", totalprice=" + totalprice
				+ ", housecode=" + housecode + ", address1=" + address1 + ", address2=" + address2 + ", phone=" + phone
				+ ", oname=" + oname + ", method=" + method + ", request=" + request + ", state=" + state + "]";
	}

}
