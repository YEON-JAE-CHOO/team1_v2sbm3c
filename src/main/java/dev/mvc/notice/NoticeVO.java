package dev.mvc.notice;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NoticeVO {

	/*
	 * noticeno NUMERIC(10) NOT NULL PRIMARY KEY, title VARCHAR2(50) NOT NULL, seqno
	 * NUMERIC(10) NOT NULL, visible CHAR(1) DEFAULT 'Y' NOT NULL , rdate DATE NOT
	 * NULL, content char(300) NULL, file1 VARCHAR(100) NULL, file1saved
	 * VARCHAR(100) NULL, thumb1 VARCHAR(100) NULL, size1 NUMBER(10) DEFAULT 0 NULL,
	 * word VARCHAR2(300) NULL
	 */

	/** 공지사항 번호 */
	private int noticeno;
	/** 카테고리 이름 */
	private String title;
	/** 출력 순서 */
	private int seqno;
	/** 출력 모드 */
	private String visible;
	/** 등록일 */
	private String rdate;

	public int getNoticeno() {
		return noticeno;
	}

	public void setNoticeno(int noticeno) {
		this.noticeno = noticeno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getSeqno() {
		return seqno;
	}

	public void setSeqno(int seqno) {
		this.seqno = seqno;
	}

	public String getVisible() {
		return visible;
	}

	public void setVisible(String visible) {
		this.visible = visible;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
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

	public String getThumb1() {
		return thumb1;
	}

	public void setThumb1(String thumb1) {
		this.thumb1 = thumb1;
	}

	public long getSize1() {
		return size1;
	}

	public void setSize1(long size1) {
		this.size1 = size1;
	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}

	private String content = "";

	private String passwd;

	private String file1 = "";
	private String file1saved = "";
	private String thumb1 = "";
	private long size1 = 0;
	private String word = "";

}
