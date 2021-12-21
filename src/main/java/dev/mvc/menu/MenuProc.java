package dev.mvc.menu;

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

}
