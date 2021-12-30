package dev.mvc.cate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CateCont {
    @Autowired
    @Qualifier("dev.mvc.cate.CateProc")
    private CateProcInter cateProc;

    public CateCont() {
        System.out.println("-> CateCont created.");
    }
    
 // http://localhost:9091/cate/create.do
    /**
     * 등록 폼
     * 
     * @return
     */
    @RequestMapping(value = "/cate/create.do", method = RequestMethod.GET)
    public ModelAndView create() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/cate/create"); // webapp/WEB-INF/views/cate/create.jsp

        return mav; // forward
    }
    
    // http://localhost:9091/cate/create.do
    /**
     * 등록 처리
     * 
     * @param cateVO
     * @return
     */
    @RequestMapping(value = "/cate/create.do", method = RequestMethod.POST)
    public ModelAndView create(CateVO cateVO) { 

        ModelAndView mav = new ModelAndView();

        int cnt = this.cateProc.create(cateVO); // 등록 처리
        // cnt = 0; // error test
        
        mav.addObject("cnt", cnt);
       
        if (cnt == 1) {
            System.out.println("등록 성공");
            
            // mav.addObject("code", "create_success"); // request에 저장, request.setAttribute("code", "create_success")
            // mav.setViewName("/categrp/msg"); // /WEB-INF/views/categrp/msg.jsp
            
            // response.sendRedirect("/categrp/list.do");
            mav.setViewName("redirect:/index.do");
        } else {
            mav.addObject("code", "create_fail"); // request에 저장, request.setAttribute("code", "create_fail")
            mav.setViewName("/categrp/msg"); // /WEB-INF/views/categrp/msg.jsp
        }

        return mav; // forward
}
}
    
