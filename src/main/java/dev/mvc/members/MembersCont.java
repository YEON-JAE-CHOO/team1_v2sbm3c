package dev.mvc.members;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.members.MembersVO;
import dev.mvc.members.MembersProcInter;

@Controller
public class MembersCont {

	@Autowired
	@Qualifier("dev.mvc.members.MembersProc")
	private MembersProcInter membersProc = null;

	public MembersCont() {
		System.out.println("-> MembersCont created.");
	}

	  
	// http://localhost:9091/members/create.do
	/**
	 * 등록 폼
	 * 
	 * @return
	 */
	@RequestMapping(value = "/members/create.do", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/members/create"); // webapp/members/create.jsp

		return mav; // forward
	}

	@RequestMapping(value = "/members/list.do", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		List<MembersVO> list = this.membersProc.list();
		System.out.println("members list ->" + list);

		mav.setViewName("/list"); // webapp/members/list.jsp

		return mav; // forward
	}
	 /**
	   * 등록 처리
	   * @param membersVO
	   * @return
	   */
	  @RequestMapping(value="/members/create.do", method=RequestMethod.POST)
	  public ModelAndView create(MembersVO membersVO){
	    ModelAndView mav = new ModelAndView();
	    
	    // System.out.println("id: " + membersVO.getId());
	    
	    int cnt= membersProc.create(membersVO);
	    
	    if (cnt == 1) {
	      mav.addObject("code", "create_success");
	      mav.addObject("name", membersVO.getName());  // 홍길동님(user4) 회원 가입을 축하합니다.
	      mav.addObject("id", membersVO.getId());
	    } else {
	      mav.addObject("code", "create_fail");
	    }
	    
	    mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)
	    
	    mav.addObject("url", "/members/msg");  // /member/msg -> /member/msg.jsp
	    
	    mav.setViewName("redirect:/members/msg.do");

//	    mav.addObject("code", "create_fail"); // 가입 실패 test용
//	    mav.addObject("cnt", 0);                 // 가입 실패 test용
	    
	    return mav;
	  }
}
