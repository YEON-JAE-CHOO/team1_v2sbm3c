package dev.mvc.members;


public class MembersVO {

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

}
