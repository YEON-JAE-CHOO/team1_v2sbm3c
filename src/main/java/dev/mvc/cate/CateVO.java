package dev.mvc.cate;

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
public class CateVO {
    public int getCateno() {
		return cateno;
	}

	public void setCateno(int cateno) {
		this.cateno = cateno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
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

	private int cateno;
    
    private String name;
    
    private int seq;
    
    /** 메인 이미지 */
    private String file1 = "";
    /** 실제 저장된 메인 이미지 */
    private String file1saved = "";  
    /** 메인 이미지 preview */
    private String thumb1 = "";
    /** 메인 이미지 크기 */
    private long size1;
    
    /** 
    이미지 MultipartFile 
    <input type='file' class="form-control" name='file1MF' id='file1MF' 
                     value='' placeholder="파일 선택">
    */
    private MultipartFile file1MF;

    /**
     * 파일 크기 단위 출력
     */
    private String size1_label;

 
    
}
