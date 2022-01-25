package dev.mvc.members;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.members.MembersVO;
import dev.mvc.members.MembersVO;
import dev.mvc.members.MembersVO;

@Component("dev.mvc.members.MembersProc")
public class MembersProc implements MembersProcInter {

	@Autowired
	private MembersDAOInter membersDAO;

	public MembersProc() {
		System.out.println("-> MembersProc created.");
	}
	  
	@Override
	  public int checkID(String id) {
	    int cnt = this.membersDAO.checkID(id);
	    return cnt;
	  }
	
	@Override
	public int create(MembersVO membersvo) {
		int cnt = this.membersDAO.create(membersvo);

		return cnt;
	}

	@Override
	public List<MembersVO> list() {
		List<MembersVO> list = this.membersDAO.list();
		return list;
	}
	@Override
	  public MembersVO read(int mno) {
	    MembersVO membersVO = this.membersDAO.read(mno);
	    return membersVO;
	  }

	  @Override
	  public MembersVO readById(String id) {
	    MembersVO membersVO = this.membersDAO.readById(id);
	    return membersVO;
	  }

	  @Override
	  public int update(MembersVO membersVO) {
	    int cnt = this.membersDAO.update(membersVO);
	    return cnt;
	  }

	  @Override
	  public int delete(int mno) {
	    int cnt = this.membersDAO.delete(mno);
	    return cnt;
	  }

	  @Override
	  public int pw_check(HashMap<Object, Object> map) {
	    int cnt = this.membersDAO.pw_check(map);
	    return cnt;
	  }

	  @Override
	  public int pw_update(HashMap<Object, Object> map) {
	    int cnt = this.membersDAO.pw_update(map);
	    return cnt;
	  }

	  @Override
	  public int login(Map<String, Object> map) {
	    int cnt = this.membersDAO.login(map);
	    return cnt;
	  }
	  
	  @Override
	  public boolean isMembers(HttpSession session){
	    boolean sw = false; // 로그인하지 않은 것으로 초기화
	    int reco = 99;
	    
	    // System.out.println("-> reco: " + session.getAttribute("reco"));
	    if (session != null) {
	      String id = (String)session.getAttribute("id");
	      if (session.getAttribute("reco") != null) {
	        reco = (int)session.getAttribute("reco");
	      }
	      
	      if (id != null && reco <= 20){ // 관리자 + 회원
	        sw = true;  // 로그인 한 경우
	      }
	    }
	    
	    return sw;
	  }

	  @Override
	  public boolean isAdmin(HttpSession session) {
	    boolean sw = false; // 로그인하지 않은 것으로 초기화
	    int reco = 99;
	    
	    // System.out.println("-> grade: " + session.getAttribute("grade"));
	    if (session != null) {
	      String id = (String)session.getAttribute("id");
	      if (session.getAttribute("reco") != null) {
	        reco = (int)session.getAttribute("reco");
	      }
	      
	      if (id != null && reco <= 10){ // 관리자
	        sw = true;  // 로그인 한 경우
	      }
	    }
	    
	    return sw;
	  }

	@Override
	public int select_mno(String id) {
		int mno = this.membersDAO.select_mno(id);
		return mno;
	}
	
	@Override
	public int update_recommend(HashMap<Object, Object> map) {
		int cnt = this.membersDAO.update_recommend(map);
		return cnt;
	}  
	
	@Override
	  public MembersVO read_recommend(String id) {
	    MembersVO membersVO = this.membersDAO.read_recommend(id);
	    return membersVO;
	  }
	  
}
