package dev.mvc.restaurant;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("dev.mvc.restaurant.RestaurantProc")
public class RestaurantProc implements RestaurantProcInter {

    @Autowired
    private RestaurantDAOInter restaurantDAO;

    public RestaurantProc() {
        System.out.println("-> restaurantProc created.");
    }

	@Override
	public int create(RestaurantVO restaurantVO) {

		int cnt = this.restaurantDAO.create(restaurantVO);
		return cnt;
	}

    @Override
    public RestaurantVO create_shop(int rno) {

        RestaurantVO restaurantVO = this.restaurantDAO.create_shop(rno);

        return restaurantVO;
    }
    
    @Override
    public List<RestaurantVO> list_by_cateno(int cateno) {
        List<RestaurantVO> list = this.restaurantDAO.list_by_cateno(cateno);
        return list;
    }


	@Override
	public List<RestaurantVO> getlist() {
		List<RestaurantVO> list = this.restaurantDAO.getlist();
		return list;
	}

	@Override
	public RestaurantVO read_restaurant(int rno) {

		RestaurantVO restaurantVO = this.restaurantDAO.read_restaurant(rno);

		return restaurantVO;
	}

	@Override
	public int update(RestaurantVO restaurantVO) {

		int cnt = this.restaurantDAO.update(restaurantVO);

		return cnt;
	}

	@Override
	public int update_recom(int rno) {
		int cnt = this.restaurantDAO.update_recom(rno);

		return cnt;
	}

	@Override
	public List<RestaurantVO> cate_list(int cateno) {
		List<RestaurantVO> list = this.restaurantDAO.cate_list(cateno);
		return list;
	}

	@Override
	public int create_reco(RecommendationVO recommendationVO) {
		int cnt = this.restaurantDAO.create_reco(recommendationVO);
		return cnt;
	}

	@Override
	public int read_reco(HashMap<String, Object> hashMap) {
		int cnt = this.restaurantDAO.read_reco(hashMap);

		return cnt;
	}



}
