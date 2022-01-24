package dev.mvc.review;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.members.MembersProcInter;
import dev.mvc.members.MembersVO;
import dev.mvc.restaurant.RestaurantProcInter;
import dev.mvc.restaurant.RestaurantVO;
import dev.mvc.tool.Tool;

@Controller
public class ReviewCont {
    @Autowired
    @Qualifier("dev.mvc.review.ReviewProc")
    private ReviewProcInter reviewProc;

    @Autowired
    @Qualifier("dev.mvc.restaurant.RestaurantProc")
    private RestaurantProcInter RestuarantProc;

    @Autowired
    @Qualifier("dev.mvc.members.MembersProc")
    private MembersProcInter membersProc;

    public ReviewCont() {
        System.out.println("-> ReviewCont created.");
    }

    // 리뷰 등록
    @RequestMapping(value = "/review/create.do", method = RequestMethod.GET)
    public ModelAndView create(int rno, int mno) {
        ModelAndView mav = new ModelAndView();

        RestaurantVO restaurantVO = this.RestuarantProc.read_restaurant(rno);

        MembersVO membersVO = this.membersProc.read(mno);

        mav.addObject("restaurantVO", restaurantVO);
        mav.addObject("membersVO", membersVO);

        mav.setViewName("/review/create");

        return mav; // forward
    }

    // 리뷰 등록 처리
    @RequestMapping(value = "/review/create.do", method = RequestMethod.POST)
    public ModelAndView create(HttpServletRequest request, ReviewVO reviewVO) {
        ModelAndView mav = new ModelAndView();

        int cnt = this.reviewProc.create(reviewVO);
        System.out.println("등록 성공");

        mav.addObject("code", "create_success");
        mav.addObject("cnt", cnt);
        mav.addObject("name", reviewVO.getTitle());

        // mav.setViewName("redirect:/cate/msg.do");
        // response.sendRedirect("/cate/msg.do");

        mav.setViewName("redirect:/index.do");

        return mav; // forward
    }

    // mno=1인 사람이 작성한 리뷰 목록 /review/list_mno_asc.do?mno=1
    @RequestMapping(value = "/review/list_mno_asc.do", method = RequestMethod.GET)
    public ModelAndView list_mno_asc(int mno) {
        ModelAndView mav = new ModelAndView();

        ReviewVO reviewVO = this.reviewProc.read(mno);

        MembersVO membersVO = this.membersProc.read(mno);

        mav.addObject("reviewVO", reviewVO);

        mav.addObject("membersVO", membersVO);

        List<ReviewVO> list = this.reviewProc.list_mno_asc(mno);
        mav.addObject("list", list);

        mav.setViewName("/review/list_mno_asc");

        return mav; // forward
    }

    // rno=1인 식당이 작성한 리뷰 목록 /review/list_rno_asc.do?rno=1
    @RequestMapping(value = "/review/list_rno_asc.do", method = RequestMethod.GET)
    public ModelAndView list_rno_asc(int rno) {
        ModelAndView mav = new ModelAndView();

        RestaurantVO restaurantVO = this.RestuarantProc.read_restaurant(rno);

        mav.addObject("restaurantVO", restaurantVO);

        List<ReviewVO> list = this.reviewProc.list_rno_asc(rno);
        mav.addObject("list", list);

        mav.setViewName("/review/list_rno_asc");

        return mav; // forward
    }

    @RequestMapping(value = "/review/delete.do", method = RequestMethod.GET)
    public ModelAndView delete(int reviewno) {
        ModelAndView mav = new ModelAndView();

        // 삭제할 정보를 조회하여 확인
        ReviewVO reviewVO = this.reviewProc.read(reviewno);

        mav.addObject("reviewVO", reviewVO);

        mav.setViewName("/review/delete"); // contents/delete.jsp

        return mav;

    }

    @RequestMapping(value = "/review/delete.do", method = RequestMethod.POST)
    public ModelAndView delete(ReviewVO reviewVO) {
        ModelAndView mav = new ModelAndView();

        int reviewno = reviewVO.getReviewno();

        int cnt = 0;

        cnt = this.reviewProc.delete(reviewno); // DBMS 삭제

        mav.addObject("cnt", cnt);

        mav.setViewName("redirect:/index.do"); // delete_msg.jsp

        return mav; // forward
    }
}
