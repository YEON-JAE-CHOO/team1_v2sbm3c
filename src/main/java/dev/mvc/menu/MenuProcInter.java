package dev.mvc.menu;

import java.util.List;

public interface MenuProcInter {
	/**
	 * 조회
	 * 
	 * @param 없음
	 * @return
	 */
	public List<MenuVO> testlist();

	/**
	 * 등록
	 * 
	 * @param MenuVO
	 * @return
	 */
	public int insert(MenuVO menuvo);

}
