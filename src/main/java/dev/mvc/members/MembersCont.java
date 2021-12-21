package dev.mvc.members;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.members.MembersProcInter;

@Controller
public class MembersCont {

	@Autowired
	@Qualifier("dev.mvc.members.MembersProc")
	private MembersProcInter membersProc = null;

	public MembersCont() {
		System.out.println("-> MembersCont created.");
	}

	// http://localhost:9091/member/create.do
	/**
	 * 등록 폼
	 * 
	 * @return
	 */
	@RequestMapping(value = "/members/create.do", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/create"); // webapp/members/create.jsp

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

}
