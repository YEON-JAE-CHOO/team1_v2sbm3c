package dev.mvc.recommend;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RecommendCont {
    // http://localhost:9091/tensorflow/start.do
    @RequestMapping(value = { "/recommend_food/start.do" }, method = RequestMethod.GET)
    public ModelAndView start() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/recommend_food/start"); // /WEB-INF/views/recommend_food/start.jsp

        return mav;
    }

    // http://localhost:9091/tensorflow/form1.do
    @RequestMapping(value = { "/recommend_food/form1.do" }, method = RequestMethod.GET)
    public ModelAndView form1() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/recommend_food/form1"); // /WEB-INF/views/recommend_food/form1.jsp

        return mav;
    }

    // http://localhost:9091/tensorflow/form2.do
    @RequestMapping(value = { "/recommend_food/form2.do" }, method = RequestMethod.GET)
    public ModelAndView form2() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/recommend_food/form2"); // /WEB-INF/views/recommend_food/form2.jsp

        return mav;
    }

    // http://localhost:9091/tensorflow/form3.do
    @RequestMapping(value = { "/recommend_food/form3.do" }, method = RequestMethod.GET)
    public ModelAndView form3() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/recommend_food/form3"); // /WEB-INF/views/recommend_food/form3.jsp

        return mav;
    }
    
    // http://localhost:9091/tensorflow/form3.do
    @RequestMapping(value = { "/recommend_food/form4.do" }, method = RequestMethod.GET)
    public ModelAndView form4() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/recommend_food/form4"); // /WEB-INF/views/recommend_food/form3.jsp

        return mav;
    }
    
    // http://localhost:9091/tensorflow/form3.do
    @RequestMapping(value = { "/recommend_food/form5.do" }, method = RequestMethod.GET)
    public ModelAndView form5() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/recommend_food/form5"); // /WEB-INF/views/recommend_food/form3.jsp

        return mav;
    }
    // http://localhost:9091/tensorflow/end.do
    @RequestMapping(value = {"/recommend_food/end.do"}, method = RequestMethod.GET)
    public ModelAndView end() {
      ModelAndView mav = new ModelAndView();
      mav.setViewName("/recommend_food/end");  // /WEB-INF/views/tensorflow/recommend_book/end.jsp
      
      return mav;
    }
      
}
