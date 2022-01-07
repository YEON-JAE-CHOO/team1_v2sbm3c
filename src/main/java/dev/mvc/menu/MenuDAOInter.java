package dev.mvc.menu;

import java.util.List;

public interface MenuDAOInter {

	public List<MenuVO> testlist(int rno);

	/**
	 * 등록
	 * 
	 * @param MenuVO
	 * @return
	 */
	public int insert(MenuVO menuvo);

	/**
	 * 삭제
	 * 
	 * @param int menuno
	 * @return
	 */
	public int delete(int menuno);

	/**
	 * 수정
	 * 
	 * @param int menuno
	 * @return
	 */
	public int update(int menuno);

	/**
	 * menuVO 읽기
	 * 
	 * @param int menuno
	 * @return
	 */
	public MenuVO read(int menuno);

}
