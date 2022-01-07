package dev.mvc.shoppingcart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.menu.MenuDAOInter;

@Component("dev.mvc.shoppingcart.ShoppingcartProc")
public class ShoppingcartProc implements ShoppingcartProcInter {

	@Autowired
	private ShoppingcartDAOInter shoppingcartDAO;

	public ShoppingcartProc() {
		System.out.println("-> ShoppingcartProc created.");
	}

	@Override
	public int add_cart(ShoppingcartVO shoppingcartvo) {
		int cnt = this.shoppingcartDAO.add_cart(shoppingcartvo);
		return cnt;
	}

	@Override
	public List<Menu_Memeber_Shoppingcart_VO> show_cart(int mno) {
		
		List<Menu_Memeber_Shoppingcart_VO> list = this.shoppingcartDAO.show_cart(mno);
		return list;
	}



}
