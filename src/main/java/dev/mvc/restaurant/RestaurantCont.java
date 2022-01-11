package dev.mvc.restaurant;

import java.util.Iterator;
import java.util.HashMap;
import java.util.List;

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

	@Autowired
	@Qualifier("dev.mvc.cate.CateProc")
	private CateProcInter cateProc;
	
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
		List<CateVO> list = this.cateProc.list_catename();
		mav.addObject("list", list);
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
		
		System.out.println(restaurantVO.toString());
		int cnt = this.restaurantProc.create(restaurantVO); // 등록 처리
		// cnt = 0; // error test

		mav.addObject("cnt", cnt);

		if (cnt == 1) {
			System.out.println("등록 성공");

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
	public ModelAndView modification(int rno) {

		ModelAndView mav = new ModelAndView();

		RestaurantVO restaurantVO = this.restaurantProc.create_shop(rno); // 등록 처리
		mav.addObject("restaurantVO", restaurantVO);
		System.out.println(restaurantVO.toString());
		mav.setViewName("/restaurant/modification");

		return mav; // forward
	}

	@RequestMapping(value = "/restaurant/update.do", method = RequestMethod.POST)
	public ModelAndView update(RestaurantVO restaurantVO) {

		ModelAndView mav = new ModelAndView();
		System.out.println(restaurantVO.toString());
		int cnt = this.restaurantProc.update(restaurantVO);

		mav.addObject("cnt", cnt);
		mav.setViewName("/restaurant/list");

		return mav; // forward
	}
	
    @RequestMapping(value = "/restaurant/cate_list.do", method = RequestMethod.GET)
    public ModelAndView cate_list(int cateno) {
        ModelAndView mav = new ModelAndView();
        System.out.println("cateno ="+cateno);
        List<RestaurantVO> list = this.restaurantProc.cate_list(cateno);
        mav.addObject("list", list);
        for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}
        mav.setViewName("/restaurant/list");
    	
		return mav;
    
    }


	/**
	 * 추천수 Ajax 수정 처리
	 * http://localhost:9091/contents/update_recom_ajax.do?contentsno=30
	 * 
	 * @return
	 */
	@RequestMapping(value = "/restaurant/update_recom_ajax.do", method = RequestMethod.POST)
	@ResponseBody
	public String update_recom_ajax(int rno) {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

		int mno = 10; // 임의 지정 -> 회원 번호

		// 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mno", mno);
		map.put("rno", rno); 

		int cnt_read_reco = this.restaurantProc.read_reco(map);

		JSONObject json = new JSONObject();

		if (cnt_read_reco >= 1) {
			System.out.println("이미 추천한 가게");
		} else {
			RecommendationVO recommendationVO = new RecommendationVO();
			recommendationVO.setMno(mno);
			recommendationVO.setRno(rno);

			int cnt_create_reco = this.restaurantProc.create_reco(recommendationVO);
			System.out.println("cnt_create_reco ->" + cnt_create_reco);

			int cnt = this.restaurantProc.update_recom(rno); // 추천수 증가
			int recom = this.restaurantProc.create_shop(rno).getRecocnt(); // 새로운 추천수 읽음

			System.out.println("cnt ->" + cnt + "  recom -> " + recom);

			json.put("cnt", cnt);
			json.put("recom", recom);
		}

		return json.toString();
	}

}
