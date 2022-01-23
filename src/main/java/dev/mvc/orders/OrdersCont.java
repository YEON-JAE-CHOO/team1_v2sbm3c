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
		ordersVO.setState(0);

		MembersVO membersVO = this.membersProc.read(ordersVO.getMno());
		List<OrdersListVO> ol = null;
		int cnt = this.ordersProc.create(ordersVO);

		if (cnt == 1) {
			System.out.println("등록 성공했습니다.");

			List<Menu_Memeber_Shoppingcart_VO> list = this.shoppingcartProc.show_cart(ordersVO.getMno());
			OrdersVO ordersvo = this.ordersProc.read_recent(ordersVO.getMno());
			System.out.println("ordersvo =>" + ordersvo.getOno());

			System.out.println(list.toString());

			for (Menu_Memeber_Shoppingcart_VO vo : list) {
				Orders_DetailVO odvo = new Orders_DetailVO();
				odvo.setMenuno(vo.getMenuno());
				odvo.setOno(ordersvo.getOno());
				int od_create_cnt = this.ordersProc.create_detail(odvo);
				System.out.println("주문 디테일 등록 성공");
			}
			int ono = this.ordersProc.recent_order_no(ordersVO.getMno());
			ol = this.ordersProc.recent_order_detail(ono);
			System.out.println("olList" + ol.toString());

			RestaurantVO rvo = this.restaurantProc.read_restaurant(ordersVO.getRno());
			int delete_cnt = this.shoppingcartProc.delete_all(ordersvo.getMno());
			mav.addObject("leastprice", rvo.getLeastprice());
			mav.addObject("deliverytip", rvo.getDeliverytip());
			mav.addObject("ol", ol);
			mav.addObject("ordersvo", ordersvo);
			mav.setViewName("/order/check_order");
		} else {
			System.out.println("등록 실패 cnt ->" + cnt);
			mav.setViewName("redirect:/order/openorder.do?mid=" + membersVO.getId());
		}

		return mav;
	}

	// http://localhost:9091/order/create.do
	/**
	 * 최근 주문 내역
	 * 
	 * @param OrdersVO
	 * @return
	 */
	@RequestMapping(value = "/order/recent_order.do", method = RequestMethod.GET)
	public ModelAndView recent_order(HttpSession session, String mid) { // order_payVO 자동 생성, Form -> VO
		ModelAndView mav = new ModelAndView();

		System.out.println("/order/recent_order.do 메서드 탐");

		int mno = this.membersProc.select_mno(mid);
		System.out.println("mno-->" + mno);
		MembersVO membersVO = this.membersProc.read(mno);
		System.out.println("membersVO-->" + membersVO);
		List<OrdersListVO> ol = null;

		int ono = this.ordersProc.recent_order_no(mno);
		System.out.println("ono-->" + ono);
		OrdersVO ordersVO = this.ordersProc.read_recent_by_ono(ono);
		System.out.println("ordersVO-->" + ordersVO.toString());
		ol = this.ordersProc.recent_order_detail(ono);
		System.out.println("olList" + ol.toString());

		RestaurantVO rvo = this.restaurantProc.read_restaurant(ordersVO.getRno());
		int delete_cnt = this.shoppingcartProc.delete_all(mno);
		mav.addObject("leastprice", rvo.getLeastprice());
		mav.addObject("deliverytip", rvo.getDeliverytip());
		mav.addObject("ol", ol);
		mav.addObject("ordersvo", ordersVO);
		mav.setViewName("/order/check_order");

		return mav;
	}

	/** 주문 상태 확인 */
	/**/
	/**/
	@RequestMapping(value = "/order/check_request.do", method = RequestMethod.POST)
	@ResponseBody
	public String check_request(HttpSession session, int ono) {
		ShoppingcartVO shoppingcartVO = new ShoppingcartVO();

		System.out.println("papams ono ->" + ono);
		OrdersVO ovo = this.ordersProc.read_recent_by_ono(ono);
		int state = ovo.getState();
		System.out.println("state -->" + state);
		JSONObject json = new JSONObject();
		json.put("state", state);
		String msg = "";
		if (state == 0) {
			msg = "아직 접수되지 않았습니다";
			json.put("msg", msg);
		} else {
			msg = "접수가 완료되었습니다.";
			json.put("msg", msg);

		}

		return json.toString();
	}

	/** 주문 접수 */
	/**/
	/**/
	@RequestMapping(value = "/order/ajax_receipt.do", method = RequestMethod.POST)
	@ResponseBody
	public String ajax_receipt(HttpSession session, int ono) {
		System.out.println("ono---?" + ono);
		OrdersVO ovo = this.ordersProc.read_recent_by_ono(ono);
		System.out.println("ovo" + ovo.toString());
		int cnt = 0;
		JSONObject json = new JSONObject();

		if (ovo.getState() == 0) {
			System.out.println("업데이트 이전 state -> 0");
			cnt = this.ordersProc.update_state_by_ono(ono);
			System.out.println("업데이트 성공 여부==>" + cnt);
			System.out.println("1.cnt-->" + cnt);
		} else {
			System.out.println("업데이트 이전 state -> 1");
			System.out.println("2.cnt-->" + cnt);
		}
		System.out.println("3.cnt-->" + cnt);
		json.put("cnt", cnt);

		return json.toString();
	}

	// http://localhost:9091/restaurant/order_request.do?rno=25
	@RequestMapping(value = "/restaurant/order_request.do", method = RequestMethod.GET)
	public ModelAndView order_request(int rno) {
		ModelAndView mav = new ModelAndView();
		System.out.println("rno =" + rno);
		List<OrdersVO> list = this.ordersProc.List_order_by_rno(rno);
		RestaurantVO restaurantVO = this.restaurantProc.read_restaurant(rno);

		mav.addObject("list", list);
		mav.addObject("restaurantVO", restaurantVO);

		mav.setViewName("/restaurant/sales");

		return mav;

	}
	

}
