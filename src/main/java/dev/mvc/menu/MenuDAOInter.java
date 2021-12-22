package dev.mvc.menu;

import java.util.List;

public interface MenuDAOInter {

	public List<MenuVO> testlist();

	/**
	 * 등록
	 * 
	 * @param MenuVO
	 * @return
	 */
	public int insert(MenuVO menuvo);

}
