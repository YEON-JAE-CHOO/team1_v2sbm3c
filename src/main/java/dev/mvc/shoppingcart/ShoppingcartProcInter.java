package dev.mvc.shoppingcart;

import java.util.HashMap;
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

	/** 장바구니로 식당 번호 출력 **/
	public int select_rno(HashMap<String, Object> hashMap);

	/** 장바구니 식당 카운트 **/
	public int distinct_count_rno(int mno);

	/** 장바구니로 식당 번호 출력 **/
	public int select_rno_by_mno(int mno);

}
