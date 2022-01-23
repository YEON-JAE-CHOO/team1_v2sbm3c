package dev.mvc.orders;

public class OrdersListVO {
	private int mno;
	private int menuno;
	private String rdate;
	private int ono;
	private String rtime;
	private int price;
	private int totalprice;
	private String phone;
	private String oname;

	private String method;
	private String title = "";
	private String explanation;
	private String spiciness;
	private String file1;
	private String thumb;

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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getOname() {
		return oname;
	}

	public void setOname(String oname) {
		this.oname = oname;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getExplanation() {
		return explanation;
	}

	public void setExplanation(String explanation) {
		this.explanation = explanation;
	}

	public String getSpiciness() {
		return spiciness;
	}

	public void setSpiciness(String spiciness) {
		this.spiciness = spiciness;
	}

	public String getFile1() {
		return file1;
	}

	public void setFile1(String file1) {
		this.file1 = file1;
	}

	public String getThumb() {
		return thumb;
	}

	public void setThumb(String thumb) {
		this.thumb = thumb;
	}

	@Override
	public String toString() {
		return "OrdersListVO [mno=" + mno + ", menuno=" + menuno + ", rdate=" + rdate + ", ono=" + ono + ", rtime="
				+ rtime + ", price=" + price + ", totalprice=" + totalprice + ", phone=" + phone + ", oname=" + oname
				+ ", method=" + method + ", title=" + title + ", explanation=" + explanation + ", spiciness="
				+ spiciness + ", file1=" + file1 + ", thumb=" + thumb + "]";
	}

}
