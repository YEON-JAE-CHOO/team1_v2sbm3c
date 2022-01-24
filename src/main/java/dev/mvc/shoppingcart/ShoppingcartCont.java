package dev.mvc.shoppingcart;

import java.util.HashMap;
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

import dev.mvc.members.MembersProc;
import dev.mvc.members.MembersProcInter;
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

	@Autowired
	@Qualifier("dev.mvc.members.MembersProc")
	private MembersProcInter membersproc = null;

	public ShoppingcartCont() {
		System.out.println("-> ShoppingcartCont created.");
	}

	// http://localhost:9091/shoppingcart/openshoppingcart.do
	@RequestMapping(value = "/shoppingcart/openshoppingcart.do", method = RequestMethod.GET)
	public ModelAndView openshoppingcart(String mid) {
		ModelAndView mav = new ModelAndView();

		System.out.println("mid -? " + mid);

		int mno = this.membersproc.select_mno(mid);

		Integer rno = this.shoppingcartProc.select_rno_by_mno(mno);
		System.out.println("rno -? " + rno);

		List<Menu_Memeber_Shoppingcart_VO> list = this.shoppingcartProc.show_cart(mno);

		System.out.println("list--->" + list);
		System.out.println("cart_list size -> " + list.size());

		if (list.size() >= 1) {
			int cart_cnt = this.shoppingcartProc.cart_count(mno);
			RestaurantVO restaurantvo = this.restaurantProc.read_restaurant(12);
			int cart_sum = this.shoppingcartProc.cart_sum(mno);

			System.out.println("cart_cnt -> " + cart_cnt);
			System.out.println("restaurantvo 12 -> " + restaurantvo.toString());
			System.out.println("cart_sum -> " + cart_sum);

			mav.addObject("rno", rno);
			mav.addObject("list", list);
			mav.addObject("leastprcie", restaurantvo.getLeastprice());
			mav.addObject("deliverytip", restaurantvo.getDeliverytip());
			mav.addObject("cart_sum", cart_sum);
		} else {
			System.out.println("카테고리 리스트 사이즈 오류");
		}

		mav.setViewName("/order/shoppingcart"); // webapp/members/list.jsp

		return mav; // forward
	}
	// 목록 출력 테이블은 안 만들어놨고 만들기 전에 print로 list 출력해보려는 것입니다.

	/** 쇼핑카트 등록 */
	/**/
	/**/
	@RequestMapping(value = "/shoppingcart/add.do", method = RequestMethod.POST)
	@ResponseBody
	public String cart_add(HttpSession session, int rno, int menuno, String mid) {
		ShoppingcartVO shoppingcartVO = new ShoppingcartVO();
		RestaurantVO restaurantvo = this.restaurantProc.read_restaurant(rno);
		int mno = this.membersproc.select_mno(mid);
		Integer cart_sum = this.shoppingcartProc.cart_sum(mno);

		System.out.println("주문 최소비용 :" + restaurantvo.getLeastprice());
		System.out.println("카트 총 금액 :" + cart_sum);
		System.out.println("cart_add 메서드 진행");
		System.out.println("mid -> " + mid);
		System.out.println("selected mno -> " + mno);

		/** 초기 수량 **/
		shoppingcartVO.setCount(1);
		shoppingcartVO.setMno(mno);
		shoppingcartVO.setRno(rno);
		shoppingcartVO.setMenuno(menuno);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mno", mno);

		int distinct_rno_count = this.shoppingcartProc.distinct_count_rno(mno);
		Integer selected_rno = this.shoppingcartProc.select_rno_by_mno(mno);
		JSONObject json = new JSONObject();

		if (distinct_rno_count == 0) {
			int cnt = this.shoppingcartProc.add_cart(shoppingcartVO);// 등록 처리
			json.put("cnt", cnt);
			json.put("mno", mno);
			json.put("msg", "success");
			System.out.println("-> shoppingcartCont add: " + json.toString());
		} else if (distinct_rno_count == 1) {
			if (selected_rno == rno) {
				int cnt = this.shoppingcartProc.add_cart(shoppingcartVO);// 등록 처리
				json.put("cnt", cnt);
				json.put("mno", mno);
				json.put("msg", "success");
				System.out.println("-> shoppingcartCont add: " + json.toString());
			} else {
				json.put("msg", "fail");
				System.out.println("이미 쇼핑카트에 담긴 식당이 있습니다");
			}
		}

		return json.toString();
	}

	/** 쇼핑카트 모두 지우기 */
	/**/
	/**/
	@RequestMapping(value = "/shoppingcart/cart_delete_all.do", method = RequestMethod.POST)
	@ResponseBody
	public String cart_delete_all(HttpSession session, String mid) {
		ShoppingcartVO shoppingcartVO = new ShoppingcartVO();

		int mno = this.membersproc.select_mno(mid);
		System.out.println("selected mno -> " + mno);

		System.out.println("cart_delete_all 메서드 진행  mno ->" + mno);
		int cnt = this.shoppingcartProc.delete_all(mno);
		System.out.println("delete_all    cnt->" + cnt);

		JSONObject json = new JSONObject();
		if (cnt >= 1) {
			String check = "success";
			json.put("check", check);
			json.put("mno", mno);
		}

		json.put("cnt", cnt);

		return json.toString();
	}

	/** 쇼핑카트 확인 */
	/**/
	/**/
	@RequestMapping(value = "/shoppingcart/check_order.do", method = RequestMethod.POST)
	@ResponseBody
	public String check_order(HttpSession session, String mid) {
		ShoppingcartVO shoppingcartVO = new ShoppingcartVO();

		int mno = this.membersproc.select_mno(mid);
		Integer rno = this.shoppingcartProc.select_rno_by_mno(mno);
		RestaurantVO restaurantvo = this.restaurantProc.read_restaurant(rno);
		Integer cart_sum = this.shoppingcartProc.cart_sum(mno);
		Integer cnt = this.shoppingcartProc.cart_count(mno);

		System.out.println("rno -? " + rno);
		System.out.println("cart_sum -? " + cart_sum);
		System.out.println("leastprice -? " + restaurantvo.getLeastprice());

		HashMap<String, Object> map = new HashMap<String, Object>();

		System.out.println("cnt ==>" + cnt);

		JSONObject json = new JSONObject();
		json.put("mno", mno);
		json.put("cnt", cnt);
		json.put("cart_sum", cart_sum);
		json.put("leastprice", restaurantvo.getLeastprice());

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

		String mid = (String) session.getAttribute("id");
		System.out.println("delete/  mid ->" + mid);
		int cnt = this.shoppingcartProc.shoppingcart_delete(scno);
		System.out.println("삭제 성공 cnt ->>" + cnt);

		mav.setViewName("redirect:/shoppingcart/openshoppingcart.do?mid=" + mid);

		return mav;
	}

}