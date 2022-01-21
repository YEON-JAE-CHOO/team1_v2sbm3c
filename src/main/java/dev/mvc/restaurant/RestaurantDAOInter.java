package dev.mvc.restaurant;

import java.util.List;

import dev.mvc.cate.CateVO;

public interface RestaurantDAOInter {

    
    public int create(RestaurantVO restaurantVO);
    
    public List<RestaurantVO> getlist();
    
    public RestaurantVO create_shop(int rno);
    
    public List<RestaurantVO> list_by_cateno(int cateno);   
    
 
}
