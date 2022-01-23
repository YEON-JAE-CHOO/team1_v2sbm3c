package dev.mvc.review;

import java.util.List;

public interface ReviewProcInter {
    public int create(ReviewVO reviewVO);
    
    public List<ReviewVO> list_mno_asc(int mno);
    
    public List<ReviewVO> list_rno_asc(int rno);
    
    public ReviewVO read(int reviewno);
    
    public int update(ReviewVO reviewVO);
    
    public int delete(int reviewno);
    
    
}
