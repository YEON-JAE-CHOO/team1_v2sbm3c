package dev.mvc.restaurant;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.menu.MenuVO;
import dev.mvc.restaurant.RestaurantProcInter;

@Controller
public class RestaurantCont {

	@Autowired
	@Qualifier("dev.mvc.restaurant.RestaurantProc")
	private RestaurantProcInter restaurantProc = null;

	public RestaurantCont() {
		System.out.println("-> RestaurantCont created.");
	}
	
	@RequestMapping(value = "/restaurant/list.do", method = RequestMethod.GET)
	public ModelAndView testlist() {
		ModelAndView mav = new ModelAndView();
		List<RestaurantVO> list = this.restaurantProc.testlist();

		System.out.println("rest list ->" + list);
		System.out.println("rest toString ->");

		for (int i = 1; i <= list.size(); i++) {
			System.out.println("restVo toString ->" + list.toString());

		}

		mav.setViewName("/resttest"); // webapp/members/list.jsp

		return mav; // forward
	}

}
