package dev.mvc.restaurant;

import java.util.HashMap;
import java.util.List;

public interface RestaurantProcInter {
    
    public int create(RestaurantVO restaurantVO);

	public List<RestaurantVO> getlist();
	
	public RestaurantVO create_shop(int rno);
	
    public int update_recom(int rno);
    
    public int create_reco(RecommendationVO recommendationVO);
    
    public int read_reco(HashMap<String, Object> hashMap);
}
