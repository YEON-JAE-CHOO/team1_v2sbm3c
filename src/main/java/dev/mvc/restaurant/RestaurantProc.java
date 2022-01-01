package dev.mvc.restaurant;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.members.MembersDAOInter;


@Component("dev.mvc.restaurant.RestaurantProc")
public class RestaurantProc implements RestaurantProcInter {

    
    @Autowired
    private RestaurantDAOInter restaurantDAOInter;
    
    public RestaurantProc() {
        System.out.println("-> restaurantProc created.");
    }
    
    @Override
    public int create(RestaurantVO restaurantVO) {

        int cnt = this.restaurantDAOInter.create(restaurantVO);
        return cnt;
    }
    
}
