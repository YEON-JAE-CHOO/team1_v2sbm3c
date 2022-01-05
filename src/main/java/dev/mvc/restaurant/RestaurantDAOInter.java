package dev.mvc.restaurant;

import java.util.List;

public interface RestaurantDAOInter {

    
    public int create(RestaurantVO restaurantVO);
    
    public List<RestaurantVO> getlist();
    
    public RestaurantVO create_shop(int rno);
}
