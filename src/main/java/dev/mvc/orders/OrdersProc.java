package dev.mvc.orders;

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

}
