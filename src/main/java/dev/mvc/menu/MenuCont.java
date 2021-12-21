package dev.mvc.menu;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import dev.mvc.members.MembersProcInter;

@Controller
public class MenuCont {

	@Autowired
	@Qualifier("dev.mvc.menu.MenuProc")
	private MenuProcInter menuProc = null;

	public MenuCont() {
		System.out.println("-> MenuCont created.");
	}

}
