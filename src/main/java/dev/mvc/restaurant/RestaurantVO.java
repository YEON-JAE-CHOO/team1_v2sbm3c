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
@Getter
@Setter
@ToString
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

	/** 메인 이미지 */
	private String file1 = "";
	/** 실제 저장된 메인 이미지 */
	private String filesaved1 = "";
	/** 메인 이미지 preview */
	private String thumb = "";
	/** 메인 이미지 크기 */
	private long imagesize;

	/**
	 * 이미지 MultipartFile
	 * <input type='file' class="form-control" name='file1MF' id='file1MF' value=''
	 * placeholder="파일 선택">
	 */
	private MultipartFile file1MF;

	/**
	 * 파일 크기 단위 출력
	 */
	private String size1_label;

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

	public String getFile1() {
		return file1;
	}

	public void setFile1(String file1) {
		this.file1 = file1;
	}

	public String getFilesaved1() {
		return filesaved1;
	}

	public void setFilesaved1(String filesaved1) {
		this.filesaved1 = filesaved1;
	}

	public String getThumb() {
		return thumb;
	}

	public void setThumb(String thumb) {
		this.thumb = thumb;
	}

	public long getImagesize() {
		return imagesize;
	}

	public void setImagesize(long imagesize) {
		this.imagesize = imagesize;
	}

	public MultipartFile getFile1MF() {
		return file1MF;
	}

	public void setFile1MF(MultipartFile file1mf) {
		file1MF = file1mf;
	}

	@Override
	public String toString() {
		return "RestaurantVO [rno=" + rno + ", rono=" + rono + ", name=" + name + ", code=" + code + ", address1="
				+ address1 + ", address2=" + address2 + ", explanation=" + explanation + ", type=" + type
				+ ", leastprice=" + leastprice + ", deliverytip=" + deliverytip + ", call=" + call + ", score=" + score
				+ ", reviewcount=" + reviewcount + ", recocnt=" + recocnt + ", ordercnt=" + ordercnt + ", cateno="
				+ cateno + ", file1=" + file1 + ", filesaved1=" + filesaved1 + ", thumb=" + thumb + ", imagesize="
				+ imagesize + ", file1MF=" + file1MF + ", size1_label=" + size1_label + "]";
	}

	public String getSize1_label() {
		return size1_label;
	}

	public void setSize1_label(String size1_label) {
		this.size1_label = size1_label;
	}

}
