package dev.mvc.notice;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NoticeVO {
    
    /*   
    noticeno NUMERIC(10) NOT NULL PRIMARY KEY,
    title VARCHAR2(50) NOT NULL,
    seqno NUMERIC(10) NOT NULL,
    visible CHAR(1) DEFAULT 'Y' NOT NULL ,
    rdate DATE NOT NULL,
    content char(300) NULL,
    file1  VARCHAR(100) NULL,
    file1saved VARCHAR(100) NULL,
    thumb1 VARCHAR(100) NULL,
    size1 NUMBER(10) DEFAULT 0 NULL,  
    word VARCHAR2(300) NULL
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
    
    private String content="";
    
    private String passwd;
    
    private String file1="";
    private String file1saved="";
    private String thumb1="";
    private long size1=0;
    private String word="";

}
