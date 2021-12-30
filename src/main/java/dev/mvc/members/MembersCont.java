package dev.mvc.members;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.members.MembersVO;
import dev.mvc.members.MembersVO;
import dev.mvc.members.MembersVO;
import dev.mvc.members.MembersVO;
import dev.mvc.members.MembersVO;
import dev.mvc.members.MembersVO;
import dev.mvc.members.MembersVO;
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

	  /**
	   * 새로고침 방지, EL에서 param으로 접근
	   * @return
	   */
	  @RequestMapping(value="/members/msg.do", method=RequestMethod.GET)
	  public ModelAndView msg(String url){
	    ModelAndView mav = new ModelAndView();

	    mav.setViewName(url); // forward
	    
	    return mav; // forward
	  }

	  /**
	   * 회원 조회
	   * @param mno
	   * @return
	   */
	  @RequestMapping(value="/members/read.do", method=RequestMethod.GET)
	  public ModelAndView read(int mno){
	    ModelAndView mav = new ModelAndView();
	    
	    MembersVO membersVO = this.membersProc.read(mno);
	    mav.addObject("membersVO", membersVO);
	    mav.setViewName("/members/read"); // /members/read.jsp
	    
	    return mav; // forward
	  }

	  /**
	   * Ajax 기반 회원 조회
	   * http://localhost:9091/members/read_ajax.do
	   * @param mno
	   * @return
	   */
	  @RequestMapping(value="/members/read_ajax.do", method=RequestMethod.GET)
	  @ResponseBody
	  public String read_ajax(HttpSession session){
	    int mno = (int)session.getAttribute("mno");
	    
	    MembersVO membersVO = this.membersProc.read(mno);
	    
	    JSONObject json = new JSONObject();
	    json.put("rname", membersVO.getName());
	    json.put("rphone", membersVO.getPhone());
	    json.put("rhousecode", membersVO.getHousecode());
	    json.put("raddress1", membersVO.getAddress1());
	    json.put("raddress2", membersVO.getAddress2());
	    
	    return json.toString();
	  }

	  /**
	   * 회원 정보 수정 처리
	   * @param membersVO
	   * @return
	   */
	  @RequestMapping(value="/members/update.do", method=RequestMethod.POST)
	  public ModelAndView update(MembersVO membersVO){
	    ModelAndView mav = new ModelAndView();
	    
	    // System.out.println("id: " + membersVO.getId());
	    
	    int cnt= membersProc.update(membersVO);
	    
	    if (cnt == 1) {
	      mav.addObject("code", "update_success");
	      mav.addObject("mname", membersVO.getName());  // 홍길동님(user4) 회원 정보를 변경했습니다.
	      mav.addObject("id", membersVO.getId());
	    } else {
	      mav.addObject("code", "update_fail");
	    }

	    mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)
	    mav.addObject("url", "/members/msg");  // /member/msg -> /member/msg.jsp
	    
	    mav.setViewName("redirect:/members/msg.do");
	    
	    return mav;
	  }

	  /**
	   * 회원 삭제
	   * @param mno
	   * @return
	   */
	  @RequestMapping(value="/members/delete.do", method=RequestMethod.GET)
	  public ModelAndView delete(int mno){
	    ModelAndView mav = new ModelAndView();
	    
	    MembersVO membersVO = this.membersProc.read(mno);
	    mav.addObject("membersVO", membersVO);
	    mav.setViewName("/members/delete"); // /members/delete.jsp
	    
	    return mav; // forward
	  }

	  /**
	   * 회원 삭제 처리
	   * @param membersVO
	   * @return
	   */
	  @RequestMapping(value="/members/delete.do", method=RequestMethod.POST)
	  public ModelAndView delete_proc(int mno){
	    ModelAndView mav = new ModelAndView();
	    
	    // System.out.println("id: " + membersVO.getId());
	    MembersVO membersVO = this.membersProc.read(mno);
	    
	    
	    int cnt= membersProc.delete(mno);

	    if (cnt == 1) {
	      mav.addObject("code", "delete_success");
	      mav.addObject("name", membersVO.getName());  // 홍길동님(user4) 회원 정보를 변경했습니다.
	      mav.addObject("id", membersVO.getId());
	    } else {
	      mav.addObject("code", "delete_fail");
	    }

	    mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)
	    mav.addObject("url", "/members/msg");  // /members/msg -> /members/msg.jsp
	    
	    mav.setViewName("redirect:/members/msg.do");
	    
	    return mav;
	  }

	  /**
	   * 패스워드를 변경합니다.
	   * @param mno
	   * @return
	   */
	  @RequestMapping(value="/members/pw_update.do", method=RequestMethod.GET)
	  public ModelAndView pw_update(int mno){
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("/members/pw_update"); // pw_update.jsp
	    
	    return mav;
	  }

	  /**
	   * 패스워드 변경 처리
	   * @param mno 회원 번호
	   * @param current_pw 현재 패스워드
	   * @param new_pw 새로운 패스워드
	   * @return
	   */
	  @RequestMapping(value="/members/pw_update.do", method=RequestMethod.POST)
	  public ModelAndView pw_update(int mno, String current_pw, String new_pw){
	    ModelAndView mav = new ModelAndView();
	    
	    MembersVO membersVO = this.membersProc.read(mno);
	    mav.addObject("name", membersVO.getName());  // 홍길동님(user4) 패스워드를 변경했습니다.
	    mav.addObject("id", membersVO.getId());

	    // 현재 패스워드 검사
	    HashMap<Object, Object> map = new HashMap<Object, Object>();
	    map.put("mno", mno);
	    map.put("pw", current_pw);
	    
	    int cnt = membersProc.pw_check(map);
	    int update_cnt = 0; // 변경된 패스워드 수
	    
	    if (cnt == 1) { // 현재 패스워드가 일치하는 경우
	      map.put("pw", new_pw); // 새로운 패스워드를 저장
	      update_cnt = membersProc.pw_update(map); // 패스워드 변경 처리
	      
	      if (update_cnt == 1) {
	        mav.addObject("code", "pw_update_success"); // 패스워드 변경 성공
	      } else {
	        cnt = 0;  // 패스워드는 일치했으나 변경하지는 못함.
	        mav.addObject("code", "pw_update_fail");       // 패스워드 변경 실패
	      }
	      
	      mav.addObject("update_cnt", update_cnt);  // 변경된 패스워드의 갯수    
	    } else {
	      mav.addObject("code", "pw_fail"); // 패스워드가 일치하지 않는 경우
	    }

	    mav.addObject("cnt", cnt); // 패스워드 일치 여부
	    mav.addObject("url", "/members/msg");  // /members/msg -> /members/msg.jsp
	    
	    mav.setViewName("redirect:/members/msg.do");
	    
	    return mav;
	  }

	//  /**
	//   * 로그인 폼
	//   * @return
	//   */
	//  // http://localhost:9091/members/login.do 
	//  @RequestMapping(value = "/members/login.do", 
//	                            method = RequestMethod.GET)
	//  public ModelAndView login() {
//	    ModelAndView mav = new ModelAndView();
	//  
//	    mav.setViewName("/members/login_form"); // login_form.jsp
//	    return mav;
	//  }

	//  /**
	//   * 로그인 처리
	//   * @return
	//   */
	//  // http://localhost:9091/members/login.do 
	//  @RequestMapping(value = "/members/login.do", 
//	                             method = RequestMethod.POST)
	//  public ModelAndView login_proc(HttpSession session,
//	                                                   String id, 
//	                                                   String pw) {
//	    ModelAndView mav = new ModelAndView();
//	    Map<String, Object> map = new HashMap<String, Object>();
//	    map.put("id", id);
//	    map.put("pw", pw);
	//    
//	    int count = membersProc.login(map); // id, pw 일치 여부 확인
//	    if (count == 1) { // 로그인 성공
//	      // System.out.println(id + " 로그인 성공");
//	      MembersVO membersVO = membersProc.readById(id); // 로그인한 회원의 정보 조회
//	      session.setAttribute("mno", membersVO.getMno());
//	      session.setAttribute("id", id);
//	      session.setAttribute("name", membersVO.getName());
//	      
//	      mav.setViewName("redirect:/index.do"); // 시작 페이지로 이동  
//	    } else {
//	      mav.addObject("url", "/members/login_fail_msg"); // login_fail_msg.jsp, redirect parameter 적용
//	     
//	      mav.setViewName("redirect:/members/msg.do"); // 새로고침 방지
//	    }
//	        
//	    return mav;
	//  }

	  /**
	   * 로그아웃 처리
	   * @param session
	   * @return
	   */
	  @RequestMapping(value="/members/logout.do", 
	                             method=RequestMethod.GET)
	  public ModelAndView logout(HttpSession session){
	    ModelAndView mav = new ModelAndView();
	    session.invalidate(); // 모든 session 변수 삭제
	    
	    mav.addObject("url", "/members/logout_msg"); // logout_msg.jsp, redirect parameter 적용
	    
	    mav.setViewName("redirect:/members/msg.do"); // 새로고침 방지
	    
	    return mav;
	  }

	  /**
	   * 로그인 폼
	   * @return
	   */
	  // http://localhost:9091/members/login.do 
	  @RequestMapping(value = "/members/login.do", 
	                             method = RequestMethod.GET)
	  public ModelAndView login_cookie(HttpServletRequest request,
	                                                 @RequestParam(value="return_url", defaultValue="") String return_url) {
	    ModelAndView mav = new ModelAndView();
	    
	    Cookie[] cookies = request.getCookies();
	    Cookie cookie = null;

	    String ck_id = ""; // id 저장
	    String ck_id_save = ""; // id 저장 여부를 체크
	    String ck_pw = ""; // pw 저장
	    String ck_pw_save = ""; // pw 저장 여부를 체크

	    if (cookies != null) {
	      for (int i=0; i < cookies.length; i++){
	        cookie = cookies[i]; // 쿠키 객체 추출
	        
	        if (cookie.getName().equals("ck_id")){
	          ck_id = cookie.getValue(); 
	        }else if(cookie.getName().equals("ck_id_save")){
	          ck_id_save = cookie.getValue();  // Y, N
	        }else if (cookie.getName().equals("ck_pw")){
	          ck_pw = cookie.getValue();         // 1234
	        }else if(cookie.getName().equals("ck_pw_save")){
	          ck_pw_save = cookie.getValue();  // Y, N
	        }
	      }
	    }
	    
	    mav.addObject("ck_id", ck_id); 
	    mav.addObject("ck_id_save", ck_id_save);
	    mav.addObject("ck_pw", ck_pw);
	    mav.addObject("ck_pw_save", ck_pw_save);
	    mav.addObject("return_url", return_url);
	    
	    mav.setViewName("/members/login_ck_form");
	    return mav;
	  }
	   
	  
	  /**
	   * Cookie 기반 로그인 처리
	   * @param request Cookie를 읽기위해 필요
	   * @param response Cookie를 쓰기위해 필요
	   * @param session 로그인 정보를 메모리에 기록
	   * @param id  회원 아이디
	   * @param pw 회원 패스워드
	   * @param id_save 회원 아이디 Cookie에 저장 여부
	   * @param pw_save 패스워드 Cookie에 저장 여부
	   * @return
	   */
	  // http://localhost:9091/members/login.do 
	  @RequestMapping(value = "/members/login.do", 
	                             method = RequestMethod.POST)
	  public ModelAndView login_cookie_proc(
	                             HttpServletRequest request,
	                             HttpServletResponse response,
	                             HttpSession session,
	                             String id, 
	                             String pw,
	                             @RequestParam(value="id_save", defaultValue="") String id_save,
	                             @RequestParam(value="pw_save", defaultValue="") String pw_save,
	                             @RequestParam(value="return_url", defaultValue="") String return_url) {
	    ModelAndView mav = new ModelAndView();
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("id", id);
	    map.put("pw", pw);
	    
	    int count = membersProc.login(map);
	    if (count == 1) { // 로그인 성공
	      // System.out.println(id + " 로그인 성공");
	      MembersVO membersVO = membersProc.readById(id);
	      session.setAttribute("mno", membersVO.getMno()); // 서버의 메모리에 기록
	      session.setAttribute("id", id);
	      session.setAttribute("name", membersVO.getName());
	      session.setAttribute("reco", membersVO.getReco());
	      
	      // -------------------------------------------------------------------
	      // id 관련 쿠기 저장
	      // -------------------------------------------------------------------
	      if (id_save.equals("Y")) { // id를 저장할 경우, Checkbox를 체크한 경우
	        Cookie ck_id = new Cookie("ck_id", id);
	        ck_id.setPath("/");  // root 폴더에 쿠키를 기록함으로 모든 경로에서 쿠기 접근 가능
	        ck_id.setMaxAge(60 * 60 * 24 * 30); // 30 day, 초단위
	        response.addCookie(ck_id); // id 저장
	      } else { // N, id를 저장하지 않는 경우, Checkbox를 체크 해제한 경우
	        Cookie ck_id = new Cookie("ck_id", "");
	        ck_id.setPath("/");
	        ck_id.setMaxAge(0);
	        response.addCookie(ck_id); // id 저장
	      }
	      // id를 저장할지 선택하는  CheckBox 체크 여부
	      Cookie ck_id_save = new Cookie("ck_id_save", id_save);
	      ck_id_save.setPath("/");
	      ck_id_save.setMaxAge(60 * 60 * 24 * 30); // 30 day
	      response.addCookie(ck_id_save);
	      // -------------------------------------------------------------------

	      // -------------------------------------------------------------------
	      // Password 관련 쿠기 저장
	      // -------------------------------------------------------------------
	      if (pw_save.equals("Y")) { // 패스워드 저장할 경우
	        Cookie ck_pw = new Cookie("ck_pw", pw);
	        ck_pw.setPath("/");
	        ck_pw.setMaxAge(60 * 60 * 24 * 30); // 30 day
	        response.addCookie(ck_pw);
	      } else { // N, 패스워드를 저장하지 않을 경우
	        Cookie ck_pw = new Cookie("ck_pw", "");
	        ck_pw.setPath("/");
	        ck_pw.setMaxAge(0);
	        response.addCookie(ck_pw);
	      }
	      // pw를 저장할지 선택하는  CheckBox 체크 여부
	      Cookie ck_pw_save = new Cookie("ck_pw_save", pw_save);
	      ck_pw_save.setPath("/");
	      ck_pw_save.setMaxAge(60 * 60 * 24 * 30); // 30 day
	      response.addCookie(ck_pw_save);
	      // -------------------------------------------------------------------
	      
	      System.out.println("-> return_url: " + return_url);
	      
	      if (return_url.length() > 0) { // ★
	        mav.setViewName("redirect:" + return_url);  
	      } else {
	        mav.setViewName("redirect:/index.do");
	      }
	      
	    } else {
	      mav.addObject("url", "/members/login_fail_msg");
	      mav.setViewName("redirect:/members/msg.do"); 
	    }
	        
	    return mav;
	  }
	  
}
