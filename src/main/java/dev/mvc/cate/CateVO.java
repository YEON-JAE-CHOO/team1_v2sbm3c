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
