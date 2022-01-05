package dev.mvc.cate;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.members.MembersDAOInter;


@Component("dev.mvc.cate.CateProc")
public class CateProc implements CateProcInter {

    
    @Autowired
    private CateDAOInter cateDAOInter;
    
    public CateProc() {
        System.out.println("-> CateProc created.");
    }
    
    @Override
    public int create(CateVO cateVO) {

        int cnt = this.cateDAOInter.create(cateVO);
        return cnt;
    }
    
    @Override
    public List<CateVO> list_cateno_asc() {
      List<CateVO> list = null;
      list = this.cateDAOInter.list_cateno_asc();
      return list;
    }
    
    @Override
    public CateVO read(int cateno) {
        CateVO cateVO = this.cateDAOInter.read(cateno);
      
      return cateVO;
    }
    
    @Override
    public int update_text(CateVO cateVO) {
      int cnt = this.cateDAOInter.update_text(cateVO);
      
      return cnt;
    }
    
    @Override
    public int update_file(CateVO cateVO) {
      int cnt = this.cateDAOInter.update_file(cateVO);
      
      return cnt;
    }
    
    @Override
    public int delete(int cateno) {
      int cnt = this.cateDAOInter.delete(cateno);
      return cnt;
    }
    
}
