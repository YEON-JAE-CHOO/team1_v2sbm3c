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
    
}
