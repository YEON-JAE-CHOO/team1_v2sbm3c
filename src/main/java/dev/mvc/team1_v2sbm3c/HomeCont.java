package dev.mvc.team1_v2sbm3c;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.cate.CateProc;
import dev.mvc.cate.CateProcInter;
import dev.mvc.cate.CateVO;

@Controller
public class HomeCont {

    @Autowired
    @Qualifier("dev.mvc.cate.CateProc")
	private CateProcInter cateProc;
    
	public HomeCont() {
		System.out.println("-> HomeCont created.");
	}

	// http://localhost:9091
	@RequestMapping(value = { "/", "/index.do" }, method = RequestMethod.GET)
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView();

		List<CateVO> list = this.cateProc.list_cateno_asc();
		mav.addObject("list", list);
		System.out.println(list.toString());
		mav.setViewName("/index"); // /WEB-INF/views/index.jsp

		return mav;
	}
}