package dev.mvc.menu;

import java.util.List;

import dev.mvc.cate.CateVO;

public interface MenuDAOInter {

	public List<MenuVO> testlist(int rno);

	/**
	 * 등록
	 * 
	 * @param MenuVO
	 * @return
	 */
	public int insert(MenuVO menuvo);
	
    public MenuVO read(int menuno);

	/**
	 * 등록
	 * 
	 * @param int menuno
	 * @return
	 */
	public int delete(int menuno);

}
