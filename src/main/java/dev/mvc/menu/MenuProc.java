package dev.mvc.menu;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.members.MembersDAOInter;

@Component("dev.mvc.menu.MenuProc")
public class MenuProc implements MenuProcInter {

	@Autowired
	private MenuDAOInter menuDAO;

	public MenuProc() {
		System.out.println("-> MenuProc created.");
	}

	@Override
	public int insert(MenuVO menuvo) {
		int cnt = this.menuDAO.insert(menuvo);
		return cnt;
	}

	@Override
	public List<MenuVO> testlist(int rno) {
		List<MenuVO> list = this.menuDAO.testlist(rno);
		return list;

	}

	@Override
	public int delete(int menuno) {
		int cnt = this.menuDAO.delete(menuno);
		return cnt;
	}

	@Override
	public int update(MenuVO menuvo) {
		int cnt = this.menuDAO.update(menuvo);
		
		return cnt;
	}

	@Override
	public MenuVO read(int menuno) {

		MenuVO menuvo = this.menuDAO.read(menuno);
		return menuvo;
	}
}
