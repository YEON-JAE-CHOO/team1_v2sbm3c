package dev.mvc.shoppingcart;

import java.util.List;

public interface ShoppingcartProcInter {

	/** 장바구니 등록 **/
	public int add_cart(ShoppingcartVO shoppingcartvo);

	/** 장바구니 출력**/
	public List<Menu_Memeber_Shoppingcart_VO> show_cart(int mno);

}
