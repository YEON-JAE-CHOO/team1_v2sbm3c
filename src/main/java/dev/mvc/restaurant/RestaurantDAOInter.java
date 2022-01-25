package dev.mvc.restaurant;

import java.util.HashMap;
import java.util.List;

public interface RestaurantDAOInter {

	public int create(RestaurantVO restaurantVO);

	public List<RestaurantVO> getlist();

	public RestaurantVO create_shop(int rno);

	public List<RestaurantVO> list_by_cateno(int cateno);

	public RestaurantVO read_restaurant(int rno);

	public int update_recom(int rno);

	public int update(RestaurantVO restaurantVO);

	public List<RestaurantVO> cate_list(int cateno);

	public int create_reco(RecommendationVO recommendationVO);

	public int read_reco(HashMap<String, Object> hashMap);

	public List<RestaurantVO> list_recommend(String recommend);
}
