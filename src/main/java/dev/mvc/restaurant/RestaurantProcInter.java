package dev.mvc.restaurant;

import java.util.List;

public interface RestaurantProcInter {
    
    public int create(RestaurantVO restaurantVO);

	public List<RestaurantVO> getlist();
    
}
