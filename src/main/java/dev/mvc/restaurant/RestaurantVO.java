package dev.mvc.restaurant;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
     CREATE TABLE cate(
        cateno INTEGER NOT NULL PRIMARY KEY,
        name VARCHAR(20) DEFAULT 한식 NOT NULL,
        seq INTEGER
  */
@Getter @Setter @ToString
public class RestaurantVO {
	private int rno;
	private int rono;
	private String name = "";
	private int code;
	private String address1 = "";
	private String address2 = "";
	private String explanation = "";
	private String type = "";
	private int leastprice; 
	private int deliverytip;
	private String call = "";
	private int score;
	private int reviewcount;
	private int recocnt;
	private int ordercnt;
	private int cateno;
	
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getRono() {
		return rono;
	}
	public void setRono(int rono) {
		this.rono = rono;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
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
	public String getExplanation() {
		return explanation;
	}
	public void setExplanation(String explanation) {
		this.explanation = explanation;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getLeastprice() {
		return leastprice;
	}
	public void setLeastprice(int leastprice) {
		this.leastprice = leastprice;
	}
	public int getDeliverytip() {
		return deliverytip;
	}
	public void setDeliverytip(int deliverytip) {
		this.deliverytip = deliverytip;
	}
	public String getCall() {
		return call;
	}
	public void setCall(String call) {
		this.call = call;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getReviewcount() {
		return reviewcount;
	}
	public void setReviewcount(int reviewcount) {
		this.reviewcount = reviewcount;
	}
	public int getRecocnt() {
		return recocnt;
	}
	public void setRecocnt(int recocnt) {
		this.recocnt = recocnt;
	}
	public int getOrdercnt() {
		return ordercnt;
	}
	public void setOrdercnt(int ordercnt) {
		this.ordercnt = ordercnt;
	}
	public int getCateno() {
		return cateno;
	}
	public void setCateno(int cateno) {
		this.cateno = cateno;
	}
	
	@Override
	public String toString() {
		return "RestaurantVO [rno=" + rno + ", rono=" + rono + ", name=" + name + ", code=" + code + ", address1="
				+ address1 + ", address2=" + address2 + ", explanation=" + explanation + ", type=" + type
				+ ", leastprice=" + leastprice + ", deliverytip=" + deliverytip + ", call=" + call + ", score=" + score
				+ ", reviewcount=" + reviewcount + ", recocnt=" + recocnt + ", ordercnt=" + ordercnt + ", cateno="
				+ cateno + "]";
	}

	
}
