package dev.mvc.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.notice.NoticeVO;

@Controller
public class NoticeCont {
    @Autowired
    @Qualifier("dev.mvc.notice.NoticeProc")
    private NoticeProcInter NoticeProc;

    public NoticeCont() {
        System.out.println("-> NoticeCont created.");
    }

    // http://localhost:9091/notice/create.do
    /**
     * 등록 폼
     * 
     * @return
     */
    @RequestMapping(value = "/notice/create.do", method = RequestMethod.GET)
    public ModelAndView create() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/notice/create"); // webapp/WEB-INF/views/categrp/create.jsp

        return mav; // forward
    }

    // http://localhost:9091/notice/create.do
    /**
     * 등록 처리
     * 
     * @param categrpVO
     * @return
     */
    @RequestMapping(value = "/notice/create.do", method = RequestMethod.POST)
    public ModelAndView create(NoticeVO noticeVO) { 

        ModelAndView mav = new ModelAndView();

        int cnt = this.NoticeProc.create(noticeVO); // 등록 처리
        // cnt = 0; // error test
        
        mav.addObject("cnt", cnt);
       
        if (cnt == 1) {
            System.out.println("등록 성공");

            mav.setViewName("redirect:/notice/list.do");
        } else {
            mav.addObject("code", "create_fail"); 
            mav.setViewName("/notice/msg");
        }

        return mav; 
    }
    
    // http://localhost:9091/notice/list.do  리스트 보기
    @RequestMapping(value="/notice/list.do", method=RequestMethod.GET )
    public ModelAndView list() {
      ModelAndView mav = new ModelAndView();
      
      List<NoticeVO> list = this.NoticeProc.list_noticeno_asc();
      mav.addObject("list", list); // request.setAttribute("list", list);

      mav.setViewName("/notice/list"); // /webapp/WEB-INF/views/notice/list.jsp
      return mav;
    }
    
    // http://localhost:9091/notice/read_update.do?noticeno=1
    /**
     * content 조회 
     */
    @RequestMapping(value="/notice/read_content.do", method=RequestMethod.GET )
    public ModelAndView read_content(int noticeno) {
      
      ModelAndView mav = new ModelAndView();
      
      NoticeVO noticeVO = this.NoticeProc.read(noticeno);
      mav.addObject("noticeVO", noticeVO);  // request 객체에 저장
      
      List<NoticeVO> list = this.NoticeProc.list_noticeno_asc();
      mav.addObject("list", list);  // request 객체에 저장

      mav.setViewName("/notice/read_content"); // /WEB-INF/views/categrp/read_update.jsp 
      return mav; // forward
    }
    
    /**
     * 수정 폼
     * http://localhost:9091/contents/update_text.do?contentsno=1
     * 
     * @return
     */
    @RequestMapping(value = "/notice/read_update.do", method = RequestMethod.GET)
    public ModelAndView read_update(int noticeno) {
      ModelAndView mav = new ModelAndView();
      
      NoticeVO noticeVO = this.NoticeProc.read(noticeno);
      mav.addObject("noticeVO", noticeVO);  

      
      mav.setViewName("/notice/read_update");
      return mav; // forward
    }
    
    // http://localhost:9091/notice/update.do
    /**
     * 수정 처리
     * @return
     */
    @RequestMapping(value="/notice/update_read.do", method=RequestMethod.POST )
    public ModelAndView update(NoticeVO noticeVO) {
      // CategrpVO categrpVO <FORM> 태그의 값으로 자동 생성됨.
      // request.setAttribute("categrpVO", categrpVO); 자동 실행
      
      ModelAndView mav = new ModelAndView();
      
      int cnt = this.NoticeProc.update(noticeVO);
      mav.addObject("cnt", cnt); // request에 저장
      
      List<NoticeVO> list = this.NoticeProc.list_noticeno_asc();
      mav.addObject("list", list); // request.setAttribute("list", list);
     
      // cnt = 0; // error test
      if (cnt == 1) {
          // System.out.println("수정 성공");
          // response.sendRedirect("/categrp/list.do");
          mav.setViewName("redirect:/notice/list.do");
      } else {
          mav.addObject("code", "update"); // request에 저장, request.setAttribute("code", "update")
          mav.setViewName("/notice/msg"); // /WEB-INF/views/categrp/msg.jsp
      }
      return mav;
    }
    
    // http://localhost:9091/notice/read_delete.do
    /**
     * 조회 + 삭제폼
     * @return
     */
    @RequestMapping(value="/notice/read_delete.do", method=RequestMethod.GET )
    public ModelAndView read_delete(int noticeno) {
      ModelAndView mav = new ModelAndView();
      
      NoticeVO noticeVO = this.NoticeProc.read(noticeno);
      mav.addObject("noticeVO", noticeVO);  
      
      List<NoticeVO> list = this.NoticeProc.list_noticeno_asc();
      mav.addObject("list", list);  

      mav.setViewName("/notice/read_delete"); 
      return mav;
    }
    
    // http://localhost:9091/notice/delete.do
    /**
     * 삭제
     */
    @RequestMapping(value="/notice/delete.do", method=RequestMethod.POST )
    public ModelAndView delete(int noticeno) {
      ModelAndView mav = new ModelAndView();
      
      NoticeVO noticeVO = this.NoticeProc.read(noticeno); // 삭제 정보
      mav.addObject("noticeVO", noticeVO);  // request 객체에 저장
      
      mav.addObject("code","delete_success");
      
      int cnt = this.NoticeProc.delete(noticeno); 
      mav.addObject("cnt", cnt); 
      
      mav.setViewName("/notice/msg");

      return mav;
    }
    
    // http://localhost:9091/categrp/update_seqno_up.do?categrpno=1
    // http://localhost:9091/categrp/update_seqno_up.do?categrpno=1000
    /**
     * 우선순위 상향 up 10 ▷ 1
     * @param categrpno 카테고리 번호
     * @return
     */
    @RequestMapping(value="/notice/update_seqno_up.do", 
                                method=RequestMethod.GET )
    public ModelAndView update_seqno_up(int noticeno) {
      ModelAndView mav = new ModelAndView();
      
      int cnt = this.NoticeProc.update_seqno_up(noticeno);  // 우선 순위 상향 처리
      mav.addObject("cnt", cnt);  // request 객체에 저장

      mav.setViewName("redirect:/notice/list.do"); 
      return mav;
    }  
    
    // http://localhost:9091/categrp/update_seqno_down.do?categrpno=1
    // http://localhost:9091/categrp/update_seqno_down.do?categrpno=1000
    /**
     * 우선순위 하향 up 1 ▷ 10
     * @param categrpno 카테고리 번호
     * @return
     */
    @RequestMapping(value="/notice/update_seqno_down.do", 
                                method=RequestMethod.GET )
    public ModelAndView update_seqno_down(int noticeno) {
      ModelAndView mav = new ModelAndView();
      
      int cnt = this.NoticeProc.update_seqno_down(noticeno);
      mav.addObject("cnt", cnt);  // request 객체에 저장

      mav.setViewName("redirect:/notice/list.do");

      return mav;
    }  
    /**
     * 출력 모드의 변경
     * @param categrpVO
     * @return
     */
    @RequestMapping(value="/notice/update_visible.do", 
        method=RequestMethod.GET )
    public ModelAndView update_visible(NoticeVO noticeVO) {
      ModelAndView mav = new ModelAndView();
      
      int cnt = this.NoticeProc.update_visible(noticeVO);
      
      mav.setViewName("redirect:/notice/list.do"); // request 객체 전달 안됨. 
      
      return mav;
    }  
    
    
    
    
    
}