package dev.mvc.restaurant;

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
    public List<RestaurantVO> getlist() {
        List<RestaurantVO> list = this.restaurantDAO.getlist();
        return list;
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



}
