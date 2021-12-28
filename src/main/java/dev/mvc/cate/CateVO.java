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
    
}
