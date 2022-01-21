package dev.mvc.menu;

import java.util.List;

public interface MenuProcInter {
	/**
	 * 조회
	 * 
	 * @param 없음
	 * @return
	 */
	public List<MenuVO> testlist(int rno);

	
	  public MenuVO read(int menuno);
	  
	  
	/**
	 * 등록
	 * 
	 * @param MenuVO
	 * @return
	 */
	public int insert(MenuVO menuvo);

	/**
	 * 등록
	 * 
	 * @param int menuno
	 * @return
	 */
	public int delete(int menuno);

}
