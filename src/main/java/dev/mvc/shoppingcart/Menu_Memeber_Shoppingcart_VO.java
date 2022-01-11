package dev.mvc.shoppingcart;

import org.springframework.web.multipart.MultipartFile;

import dev.mvc.members.MembersVO;
import dev.mvc.menu.MenuVO;

public class Menu_Memeber_Shoppingcart_VO {
	
	private int menuno;
	/** 식당 번호 */
	private int rno;
	/** 음식점 타입 */
	private String menutype = "";

	/** 메뉴 명 */
	private String title = "";
	/** 설명 */
	private String explanation = "";
	/** 매운 정도--> 매움1 /매울2 등등등 */
	private String spiciness = "";

	/** 가격 **/
	private int price;

	/** 메인 이미지 */
	private String file1 = "";
	/** 실제 저장된 메인 이미지 */
	private String file1saved = "";
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


	private String size1_label;
	private int mno;
	/** 아이디 */
	private String id = "";
	/** 패스워드 */
	private String pw = "";
	/** 회원 성명 */
	private String name = "";
	/** 닉네임 */
	private String nickname = "";
	/** 전화 번호 */
	private String phone = "";
	/** 우편 번호 */
	private String housecode = "";
	/** 주소 1 */
	private String address1 = "";
	/** 주소 2 */
	private String address2 = "";
	/** 가입일 */
	private String rdate = "";
	/** 등급 */
	private int reco;
	private int scno;
	private int count;
	public int getMenuno() {
		return menuno;
	}
	public void setMenuno(int menuno) {
		this.menuno = menuno;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getMenutype() {
		return menutype;
	}
	public void setMenutype(String menutype) {
		this.menutype = menutype;
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getFile1() {
		return file1;
	}
	public void setFile1(String file1) {
		this.file1 = file1;
	}
	public String getFile1saved() {
		return file1saved;
	}
	public void setFile1saved(String file1saved) {
		this.file1saved = file1saved;
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
	public String getSize1_label() {
		return size1_label;
	}
	public void setSize1_label(String size1_label) {
		this.size1_label = size1_label;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getHousecode() {
		return housecode;
	}
	public void setHousecode(String housecode) {
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
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public int getReco() {
		return reco;
	}
	public void setReco(int reco) {
		this.reco = reco;
	}
	public int getScno() {
		return scno;
	}
	public void setScno(int scno) {
		this.scno = scno;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	


}
