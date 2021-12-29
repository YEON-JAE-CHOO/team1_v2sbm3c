package dev.mvc.members;

import java.util.List;

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

}
