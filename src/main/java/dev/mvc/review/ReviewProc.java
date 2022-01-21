package dev.mvc.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.cate.CateVO;


@Component("dev.mvc.review.ReviewProc")
public class ReviewProc implements ReviewProcInter {

    
    @Autowired
    private ReviewDAOInter reviewDAOInter;
    
    public ReviewProc() {
        System.out.println("-> ReviewProc created.");
    }
    @Override
    public int create(ReviewVO reviewVO) {
        int cnt = reviewDAOInter.create(reviewVO);
        return 0;
    }
    
    @Override
    public List<ReviewVO> list_mno_asc(int mno) {
       List<ReviewVO> list = this.reviewDAOInter.list_mno_asc(mno);
      return list;
    }
    
    @Override
    public List<ReviewVO> list_rno_asc(int rno) {
      List<ReviewVO> list = this.reviewDAOInter.list_rno_asc(rno);
      return list;
    }
    @Override
    public ReviewVO read(int reviewno) {
        ReviewVO reviewVO = this.reviewDAOInter.read(reviewno);
        
        return reviewVO;
    }
    
    @Override
    public int update(ReviewVO reviewVO) {
      int cnt = this.reviewDAOInter.update(reviewVO);
      
      return cnt;
    }
    
    @Override
    public int delete(int reviewno) {
      int cnt = this.reviewDAOInter.delete(reviewno);
      return cnt;
    }
    
    
    
    

}
