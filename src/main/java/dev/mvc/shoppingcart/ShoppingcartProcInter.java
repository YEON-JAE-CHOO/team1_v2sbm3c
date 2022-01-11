package dev.mvc.shoppingcart;

import java.util.List;

public interface ShoppingcartProcInter {

	/** 장바구니 등록 **/
	public int add_cart(ShoppingcartVO shoppingcartvo);

	/** 장바구니 출력 **/
	public List<Menu_Memeber_Shoppingcart_VO> show_cart(int mno);

	/** 장바구니 개수 **/
	public int cart_count(int mno);

	/** 장바구니 금액합 **/
	public int cart_sum(int mno);

	/** 장바구니 개별 삭제 **/
	public int shoppingcart_delete(int scno);

	/** 장바구니 모두 삭제 **/
	public int delete_all(int mno);

}
