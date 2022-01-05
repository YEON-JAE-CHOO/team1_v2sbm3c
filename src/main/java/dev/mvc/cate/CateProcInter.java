package dev.mvc.cate;

import java.util.List;

public interface CateProcInter {
    
    public int create(CateVO cateVO);
    
    public List<CateVO> list_cateno_asc();
    
    public CateVO read(int cateno);
    
    public int update_text(CateVO cateVO);
    
    public int update_file(CateVO cateVO);
    
    public int delete(int contentsno);
}
