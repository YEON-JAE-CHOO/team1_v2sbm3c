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
	public List<MenuVO> testlist() {
		List<MenuVO> list = this.menuDAO.testlist();
		return list;
	}

	@Override
	public int insert(MenuVO menuvo) {
		int cnt = this.menuDAO.insert(menuvo);
		return cnt;
	}

}
