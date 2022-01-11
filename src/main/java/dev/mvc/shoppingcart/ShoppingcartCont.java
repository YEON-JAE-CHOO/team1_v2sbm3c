package dev.mvc.shoppingcart;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.menu.MenuProcInter;
import dev.mvc.menu.MenuVO;
import dev.mvc.restaurant.RestaurantProcInter;
import dev.mvc.restaurant.RestaurantVO;

@Controller
public class ShoppingcartCont {

	@Autowired
	@Qualifier("dev.mvc.shoppingcart.ShoppingcartProc")
	private ShoppingcartProcInter shoppingcartProc = null;

	@Autowired
	@Qualifier("dev.mvc.restaurant.RestaurantProc")
	private RestaurantProcInter restaurantProc = null;

	@Autowired
	@Qualifier("dev.mvc.menu.MenuProc")
	private MenuProcInter menuproc = null;

	public ShoppingcartCont() {
		System.out.println("-> ShoppingcartCont created.");
	}

	/** 장바구니 페이지 오픈 */
	// http://localhost:9091/shoppingcart/openshoppingcart.do
	@RequestMapping(value = "/shoppingcart/openshoppingcart.do", method = RequestMethod.GET)
	public ModelAndView openshoppingcart() {
		ModelAndView mav = new ModelAndView();

		int mno = 10;

		List<Menu_Memeber_Shoppingcart_VO> list = this.shoppingcartProc.show_cart(mno);
		int cart_cnt = this.shoppingcartProc.cart_count(mno);
		RestaurantVO restaurantvo = this.restaurantProc.create_shop(12);
		int cart_sum = this.shoppingcartProc.cart_sum(mno);

		System.out.println("list--->"+list);
		System.out.println("cart_cnt -> " + cart_cnt);
		System.out.println("cart_list size -> " + list.size());
		System.out.println("restaurantvo 12 -> " + restaurantvo.toString());
		System.out.println("cart_sum -> " + cart_sum);

		mav.addObject("list", list);
		mav.addObject("leastprcie", restaurantvo.getLeastprice());
		mav.addObject("deliverytip", restaurantvo.getDeliverytip());
		mav.addObject("cart_sum", cart_sum);
		mav.setViewName("/order/shoppingcart"); // webapp/members/list.jsp

		return mav; // forward
	}
	// 목록 출력 테이블은 안 만들어놨고 만들기 전에 print로 list 출력해보려는 것입니다.

	/** 쇼핑카트 등록 */
	/**/
	/**/
	@RequestMapping(value = "/shoppingcart/add.do", method = RequestMethod.POST)
	@ResponseBody
	public String cart_add(HttpSession session, int rno, int menuno) {
		ShoppingcartVO shoppingcartVO = new ShoppingcartVO();

		System.out.println("cart_add 메서드 진행");

		/** 초기 수량 **/
		shoppingcartVO.setCount(1);
		shoppingcartVO.setMno(10);
		shoppingcartVO.setRno(rno);
		shoppingcartVO.setMenuno(menuno);

		int cnt = this.shoppingcartProc.add_cart(shoppingcartVO);// 등록 처리

		JSONObject json = new JSONObject();
		json.put("cnt", cnt);

		System.out.println("-> shoppingcartCont add: " + json.toString());

		return json.toString();
	}

	/**
	 * 상품 삭제 http://localhost:9091/cart/delete.do
	 * 
	 * @return
	 */
	@RequestMapping(value = "/shoppingcart/delete.do", method = RequestMethod.POST)
	public ModelAndView delete(HttpSession session, @RequestParam(value = "scno", defaultValue = "0") int scno) {
		ModelAndView mav = new ModelAndView();

		int cnt = this.shoppingcartProc.shoppingcart_delete(scno);
		System.out.println("삭제 성공 cnt ->>"+cnt);
		
		mav.setViewName("redirect:/shoppingcart/openshoppingcart.do");

		return mav;
	}

}
