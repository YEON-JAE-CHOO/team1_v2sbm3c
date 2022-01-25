package dev.mvc.orders;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.shoppingcart.ShoppingcartDAOInter;

@Component("dev.mvc.orders.OrdersProc")
public class OrdersProc implements OrdersProcInter {

	@Autowired
	private OrdersDAOInter ordersDAOInter;

	public OrdersProc() {
		System.out.println("-> OrdersProc created.");
	}

	@Override
	public int create(OrdersVO ordersVO) {
		int cnt = this.ordersDAOInter.create(ordersVO);
		System.out.println("OrdersProc의 ordersVO--->" + ordersVO.toString());
		return cnt;
	}

	@Override
	public int create_detail(Orders_DetailVO odvo) {
		int cnt = this.ordersDAOInter.create_detail(odvo);
		return cnt;
	}

	@Override
	public OrdersVO read_recent(int mno) {
		OrdersVO ordersvo = this.ordersDAOInter.read_recent(mno);
		return ordersvo;
	}

	@Override
	public List<OrdersListVO> read_order(int mno) {
		List<OrdersListVO> ol = this.ordersDAOInter.read_order(mno);
		return ol;
	}

	@Override
	public Integer recent_order_no(int mno) {
		Integer ono = this.ordersDAOInter.recent_order_no(mno);
		return ono;
	}

	@Override
	public List<OrdersListVO> recent_order_detail(int ono) {
		List<OrdersListVO> ol = this.ordersDAOInter.recent_order_detail(ono);
		return ol;
	}

	@Override
	public OrdersVO read_recent_by_ono(int ono) {
		OrdersVO ordersvo = this.ordersDAOInter.read_recent_by_ono(ono);
		return ordersvo;
	}

	@Override
	public List<OrdersVO> List_order_by_rno(int rno) {
		List<OrdersVO> listOVO = this.ordersDAOInter.List_order_by_rno(rno);
		return listOVO;
	}

	@Override
	public int update_state_by_ono(int ono) {
		int cnt = this.ordersDAOInter.update_state_by_ono(ono);
		return cnt;
	}

	@Override
	public Integer select_totalprice_by_rno_date(HashMap<String, Object> hashMap) {
		Integer totalprice = this.ordersDAOInter.select_totalprice_by_rno_date(hashMap);
		return totalprice;
	}

	@Override
	public Integer select_totalprice_by_rno(int rno) {
		Integer totalprice = this.ordersDAOInter.select_totalprice_by_rno(rno);
		return totalprice;
	}
}
