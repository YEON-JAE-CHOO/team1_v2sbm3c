package dev.mvc.restaurant;

import java.util.List;

public interface RestaurantProcInter {

	public List<RestaurantVO> testlist();

	/**
	 * 등록
	 * 
	 * @param MenuVO
	 * @return
	 */
	public int insert(RestaurantVO restaurantvo);
}

