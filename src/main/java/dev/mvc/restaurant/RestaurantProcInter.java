package dev.mvc.restaurant;

import java.util.List;

public interface RestaurantProcInter {
    
    public int create(RestaurantVO restaurantVO);

	public List<RestaurantVO> getlist();
	
	public RestaurantVO create_shop(int rno);
	
    public int update_recom(int rno);
    
}
