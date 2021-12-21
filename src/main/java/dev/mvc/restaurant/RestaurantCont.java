package dev.mvc.restaurant;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import dev.mvc.restaurant.RestaurantProcInter;

@Controller
public class RestaurantCont {

	@Autowired
	@Qualifier("dev.mvc.restaurant.RestaurantProc")
	private RestaurantProcInter restaurantProc = null;

	public RestaurantCont() {
		System.out.println("-> RestaurantCont created.");
	}

}
