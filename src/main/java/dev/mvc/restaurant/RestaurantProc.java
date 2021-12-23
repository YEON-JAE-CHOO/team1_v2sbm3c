package dev.mvc.restaurant;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.members.MembersDAOInter;

@Component("dev.mvc.restaurant.RestaurantProc")
public class RestaurantProc implements RestaurantProcInter {

	@Autowired
	private RestaurantDAOInter restaurantDAO;

	public RestaurantProc() {
		System.out.println("-> RestaurantProc created.");
	}

	@Override
	public List<RestaurantVO> testlist() {
		List<RestaurantVO> testiList = this.restaurantDAO.testlist();

		return testiList;
	}

	@Override
	public int insert(RestaurantVO restaurantvo) {
		int cnt = this.restaurantDAO.insert(restaurantvo);
		return cnt;
	}

}
