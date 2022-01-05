package dev.mvc.restaurant;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.menu.MenuProcInter;
import dev.mvc.menu.MenuVO;

@Controller
public class RestaurantCont {
	@Autowired
	@Qualifier("dev.mvc.restaurant.RestaurantProc")
	private RestaurantProcInter restaurantProc;

	@Autowired
	@Qualifier("dev.mvc.menu.MenuProc")
	private MenuProcInter menuProc = null;

	
	public RestaurantCont() {
		System.out.println("-> RestaurantCont created.");
	}

	// http://localhost:9091/cate/create.do
	/**
	 * 등록 폼
	 * 
	 * @return
	 */
	@RequestMapping(value = "/restaurant/create.do", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/restaurant/create"); // webapp/WEB-INF/views/cate/create.jsp

		return mav; // forward
	}

	// http://localhost:9091/cate/create.do
	/**
	 * 등록 처리
	 * 
	 * @param cateVO
	 * @return
	 */
	@RequestMapping(value = "/restaurant/create.do", method = RequestMethod.POST)
	public ModelAndView create(RestaurantVO restaurantVO) {

		ModelAndView mav = new ModelAndView();

		int cnt = this.restaurantProc.create(restaurantVO); // 등록 처리
		// cnt = 0; // error test

		mav.addObject("cnt", cnt);

		if (cnt == 1) {
			System.out.println("등록 성공");

			// mav.addObject("code", "create_success"); // request에 저장,
			// request.setAttribute("code", "create_success")
			// mav.setViewName("/categrp/msg"); // /WEB-INF/views/categrp/msg.jsp

			// response.sendRedirect("/categrp/list.do");
			mav.setViewName("redirect:/index.do");
		} else {
			mav.addObject("code", "create_fail"); // request에 저장, request.setAttribute("code", "create_fail")
			mav.setViewName("/restaurant/create.do"); // /WEB-INF/views/categrp/msg.jsp
		}

		return mav; // forward
	}

	/** 페이지 오픈 & 메뉴 리스트 출력 */
	/**/
	/**/
	@RequestMapping(value = "/restaurant/list.do", method = RequestMethod.GET)
	public ModelAndView getlist() {
		ModelAndView mav = new ModelAndView();

		List<RestaurantVO> list = this.restaurantProc.getlist();

		System.out.println("list -->" + list);
		mav.addObject("list", list);
		mav.setViewName("/restaurant/list"); // webapp/members/list.jsp

		return mav; // forward
	}


	
	/** 페이지 오픈 & 메뉴 리스트 출력 */
	/**/
	/**/
	@RequestMapping(value = "/restaurant/shop.do", method = RequestMethod.GET)
	public ModelAndView create_shop(int rno) {
		ModelAndView mav = new ModelAndView();

		System.out.println("rno -->" + rno);
		System.out.println();
		List<MenuVO> list = this.menuProc.testlist(rno);
		RestaurantVO restaurantVO = this.restaurantProc.create_shop(rno);
		System.out.println("restaurantVO ->" + restaurantVO.toString());
		System.out.println("list -->" + list);
		mav.addObject("list", list);
		mav.addObject("restaurantVO", restaurantVO);
		mav.addObject("rno", rno);
		mav.setViewName("/restaurant/shop"); // webapp/members/list.jsp

		return mav; // forward
	}

	
	@RequestMapping(value = "/restaurant/modification.do", method = RequestMethod.GET)
	public ModelAndView modification() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/restaurant/modification"); // webapp/WEB-INF/views/cate/create.jsp

		return mav; // forward
	}
	
	@RequestMapping(value = "/restaurant/update.do", method = RequestMethod.POST)
	public ModelAndView shop_update(RestaurantVO restaurantVO) {

		ModelAndView mav = new ModelAndView();

		int cnt = this.restaurantProc.create(restaurantVO); // 등록 처리
		// cnt = 0; // error test

		mav.addObject("cnt", cnt);


		return mav; // forward
	}


}
