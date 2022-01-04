package dev.mvc.restaurant;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.members.MembersDAOInter;
import dev.mvc.menu.MenuVO;


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
	public List<RestaurantVO> getlist() {
		List<RestaurantVO> list = this.restaurantDAO.getlist();
		return list;
	}

	@Override
	public RestaurantVO create_shop(int rno) {
		
		return null;
	}

}
