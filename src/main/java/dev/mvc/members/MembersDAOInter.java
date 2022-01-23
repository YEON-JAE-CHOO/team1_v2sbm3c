package dev.mvc.members;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dev.mvc.members.MembersVO;
import dev.mvc.members.MembersVO;
import dev.mvc.members.MembersVO;

public interface MembersDAOInter {
   
    /**
     * 회원 가입
     * @param membersVO
     * @return
     */
	public int create(MembersVO membersVO);
	 /**
	   * 중복 아이디 검사
	   * @param id
	   * @return 중복 아이디 갯수
	   */
	  public int checkID(String id);
	  
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
	   * @param membersVO
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
	   * SELECT MNO
	   */
	  public int select_mno(String id);
	  
	  public int update_recommend(HashMap<Object, Object> map);

}
