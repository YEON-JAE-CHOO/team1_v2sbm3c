package dev.mvc.shoppingcart;

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

import dev.mvc.menu.MenuProcInter;
import dev.mvc.menu.MenuVO;

@Controller
public class ShoppingcartCont {

	@Autowired
	@Qualifier("dev.mvc.shoppingcart.ShoppingcartProc")
	private ShoppingcartProcInter shoppingcartProc = null;

	public ShoppingcartCont() {
		System.out.println("-> ShoppingcartCont created.");
	}

	/** 장바구니 페이지 오픈 */
	// http://localhost:9091/shoppingcart/openshoppingcart.do
	@RequestMapping(value = "/shoppingcart/openshoppingcart.do", method = RequestMethod.GET)
	public ModelAndView openshoppingcart() {
		ModelAndView mav = new ModelAndView();
		
		List<Menu_Memeber_Shoppingcart_VO> list = this.shoppingcartProc.show_cart(10);

		System.out.println("shoppingcartvo -> "+ list);
		System.out.println("list size->" + list.size());
		mav.setViewName("/order/shoppingcart"); // webapp/members/list.jsp

		return mav; // forward
	}
	//목록 출력 테이블은 안 만들어놨고 만들기 전에 print로 list 출력해보려는 것입니다.
	

	//이거는 주문목록으로 가는 메서드이고 아직 처리를 앙ㄴ 했습니다.
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

}
