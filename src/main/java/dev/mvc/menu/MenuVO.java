package dev.mvc.menu;

import org.springframework.web.multipart.MultipartFile;

public class MenuVO {

	@Override
	public String toString() {
		return "MenuVO [menuno=" + menuno + ", rno=" + rno + ", type=" + type + ", title=" + title + ", explanation="
				+ explanation + ", spiciness=" + spiciness + ", file1=" + file1 + ", file1saved=" + file1saved
				+ ", thumb=" + thumb + ", imagesize=" + imagesize + "]";
	}

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

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
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

	/** 메뉴 번호 */
	private int menuno;
	/** 식당 번호 */
	private int rno;
	/** 음식점 타입 */
	private int type;
	/** 메뉴 명 */
	private String title = "";
	/** 설명 */
	private String explanation = "";
	/** 매운 정도--> 매움1 /매울2 등등등 */
	private String spiciness = "";

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

	/**
	 * 파일 크기 단위 출력
	 */
	private String size1_label;

}
