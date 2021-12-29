package dev.mvc.members;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import dev.mvc.members.MembersVO;
import dev.mvc.members.MembersVO;
import dev.mvc.members.MembersVO;

public interface MembersProcInter {
    
    /**
     * 회원 가입
     * @param memberVO
     * @return
     */

	public int create(MembersVO membersvo);
	
	 /**
	   * 회원 전체 목록
	   * @return
	   */
	public List<MembersVO> list();
	
	 /**
	   * mno로 회원 정보 조회
	   * @param mno
	   * @return
	   */
	  public MembersVO read(int mno);

	  /**
	   * id로 회원 정보 조회
	   * @param id
	   * @return
	   */
	  public MembersVO readById(String id);

	  /**
	   * 수정 처리
	   * @param memberVO
	   * @return
	   */
	  public int update(MembersVO membersVO);

	  /**
	   * 회원 삭제 처리
	   * @param mno
	   * @return
	   */
	  public int delete(int mno);

	  /**
	   * 현재 패스워드 검사
	   * @param map
	   * @return 0: 일치하지 않음, 1: 일치함
	   */
	  public int pw_check(HashMap<Object, Object> map);
	  
	  /**
	   * 패스워드 변경
	   * @param map
	   * @return 변경된 패스워드 갯수
	   */
	  public int pw_update(HashMap<Object, Object> map);
	  

	  /**
	   * 로그인 처리
	   */
	  public int login(Map<String, Object> map);
	  
	  /**
	   * 로그인된 회원 계정인지 검사합니다.
	   * @param session
	   * @return true: 관리자
	   */
	  public boolean isMembers(HttpSession session);   

	  /**
	   * 로그인된 관리자인지 검사합니다.
	   * @param session
	   * @return true: 관리자
	   */
	  public boolean isAdmin(HttpSession session);   
	  
}
