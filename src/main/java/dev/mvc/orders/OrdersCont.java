package dev.mvc.orders;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.cate.CateProcInter;
import dev.mvc.cate.CateVO;
import dev.mvc.members.MembersProcInter;
import dev.mvc.members.MembersVO;
import dev.mvc.menu.MenuProcInter;
import dev.mvc.restaurant.RestaurantProcInter;
import dev.mvc.restaurant.RestaurantVO;
import dev.mvc.shoppingcart.Menu_Memeber_Shoppingcart_VO;
import dev.mvc.shoppingcart.ShoppingcartProcInter;
import dev.mvc.shoppingcart.ShoppingcartVO;

@Controller
public class OrdersCont {
	@Autowired
	@Qualifier("dev.mvc.members.MembersProc")
	private MembersProcInter membersProc = null;

	@Autowired
	@Qualifier("dev.mvc.shoppingcart.ShoppingcartProc")
	private ShoppingcartProcInter shoppingcartProc = null;

	@Autowired
	@Qualifier("dev.mvc.restaurant.RestaurantProc")
	private RestaurantProcInter restaurantProc;

	@Autowired
	@Qualifier("dev.mvc.menu.MenuProc")
	private MenuProcInter menuProc = null;

	@Autowired
	@Qualifier("dev.mvc.cate.CateProc")
	private CateProcInter cateProc;

	@Autowired
	@Qualifier("dev.mvc.orders.OrdersProc")
	private OrdersProcInter ordersProc;

	public OrdersCont() {
		System.out.println("--> OrdersCont created.");
	}

	// http://localhost:9091/order/openorder.do?mid=dudqls1
	/**
	 * 등록 폼
	 * 
	 * @return
	 */
	@RequestMapping(value = "/order/openorder.do", method = RequestMethod.GET)
	public ModelAndView create(String mid) {
		ModelAndView mav = new ModelAndView();
		int mno = this.membersProc.select_mno(mid);
		System.out.println("mid->" + mid + "    mno->" + mno);
		List<Menu_Memeber_Shoppingcart_VO> list = this.shoppingcartProc.show_cart(mno);

		if (list.size() >= 1) {
			int cart_cnt = this.shoppingcartProc.cart_count(mno);
			RestaurantVO restaurantvo = this.restaurantProc.read_restaurant(12);
			int cart_sum = this.shoppingcartProc.cart_sum(mno);

			mav.addObject("list", list);
			mav.addObject("leastprcie", restaurantvo.getLeastprice());
			mav.addObject("deliverytip", restaurantvo.getDeliverytip());
			mav.addObject("cart_sum", cart_sum);
		} else {
			System.out.println("카테고리 없어서 이동 못 함");
		}

		mav.setViewName("/order/order"); // webapp/WEB-INF/views/cate/create.jsp

		return mav; // forward
	}

	/** 쇼핑카트 등록 */
	/**/
	/**/
	@RequestMapping(value = "/order/members_address.do", method = RequestMethod.POST)
	@ResponseBody
	public String cart_add(HttpSession session, String mid) {
		ShoppingcartVO shoppingcartVO = new ShoppingcartVO();

		int mno = this.membersProc.select_mno(mid);
		System.out.println("selected mno -> " + mno);

		MembersVO membersvo = this.membersProc.read(mno);
		System.out.println("membersvo--->" + membersvo.toString());

		JSONObject json = new JSONObject();
		json.put("mno", mno);
		json.put("membersvo", membersvo);
		json.put("mname", membersvo.getName());
		json.put("mphone", membersvo.getPhone());
		json.put("mhousecode", membersvo.getHousecode());
		json.put("maddress1", membersvo.getAddress1());
		json.put("maddress2", membersvo.getAddress2());

		return json.toString();
	}

	// http://localhost:9091/order/create.do
	/**
	 * 주문 결재 등록 처리
	 * 
	 * @param OrdersVO
	 * @return
	 */
	@RequestMapping(value = "/order/create.do", method = RequestMethod.POST)
	public ModelAndView create(HttpSession session, OrdersVO ordersVO) { // order_payVO 자동 생성, Form -> VO
		ModelAndView mav = new ModelAndView();

		System.out.println("/order/create.do 메서드 탐");
//		String mid = (String) session.getAttribute("mid");

		System.out.println("orderVo-> " + ordersVO.toString());
		ordersVO.setState(0);

		MembersVO membersVO = this.membersProc.read(ordersVO.getMno());
		String mid = membersVO.getId();
		int cnt = this.ordersProc.create(ordersVO);

		System.out.println("mid - >" + mid);
		if (cnt == 1) {
			System.out.println("등록 성공했습니다.");
			mav.setViewName("/order/shop_sales");
		} else {
			System.out.println("등록 실패 cnt ->" + cnt);
			mav.setViewName("redirect:/order/openorder.do?mid=" + mid);
		}

		return mav;
	}
}
