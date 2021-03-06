package dev.mvc.shoppingcart;

import java.util.HashMap;
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

	@Override
	public Integer cart_count(int mno) {
		Integer cnt = this.shoppingcartDAO.cart_count(mno);
		return cnt;
	}

	@Override
	public Integer cart_sum(int mno) {
		Integer sum = this.shoppingcartDAO.cart_sum(mno);
		return sum;
	}

	@Override
	public int shoppingcart_delete(int scno) {
		int cnt = this.shoppingcartDAO.shoppingcart_delete(scno);
		return cnt;
	}

	@Override
	public int delete_all(int mno) {
		int cnt = this.shoppingcartDAO.delete_all(mno);
		return cnt;
	}

	@Override
	public int distinct_count_rno(int mno) {
		int cnt = this.shoppingcartDAO.distinct_count_rno(mno);
		return cnt;
	}

	@Override
	public int select_rno(HashMap<String, Object> hashMap) {
		int rno = this.shoppingcartDAO.select_rno(hashMap);
		return rno;
	}

	@Override
	public Integer select_rno_by_mno(int mno) {
		Integer rno = this.shoppingcartDAO.select_rno_by_mno(mno);
		return rno;
	}

}
