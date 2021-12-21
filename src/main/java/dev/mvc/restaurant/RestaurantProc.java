package dev.mvc.restaurant;

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

}
