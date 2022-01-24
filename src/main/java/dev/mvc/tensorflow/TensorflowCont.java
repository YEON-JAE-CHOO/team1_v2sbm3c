package dev.mvc.tensorflow;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.members.MembersProcInter;
import dev.mvc.members.MembersVO;

@Controller
public class TensorflowCont {

    @Autowired
    @Qualifier("dev.mvc.members.MembersProc")
    private MembersProcInter membersProc = null;

    public TensorflowCont() {
        System.out.println("-> TensorflowCont created.");

    }

    // http://localhost:9091/tensorflow/chatbot.do
    @RequestMapping(value = { "/tensorflow/chatbot.do" }, method = RequestMethod.GET)
    public ModelAndView chatbot() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/tensorflow/chatbot"); // /WEB-INF/views/tensorflow/chatbot.jsp

        return mav;
    }

    /** 쇼핑카트 등록 */
    /**/
    /**/
    @RequestMapping(value = "/tensorflow/ajax_update.do", method = RequestMethod.POST)
    @ResponseBody
    public int ajax_update(HttpSession session, int reco_num) {
        System.out.println("recommend:" + reco_num);
        String recommend = "";
        if (reco_num == 0) {
            recommend = "한식";
        } else if (reco_num == 1) {
            recommend = "중식";
        } else if (reco_num == 2) {
            recommend = "일식";
        } else if (reco_num == 3) {
            recommend = "양식";
        } else {
            recommend = "분식";
        }
        int mno = (int) session.getAttribute("mno");
        HashMap<Object, Object> map = new HashMap<Object, Object>();
        map.put("mno", mno);
        map.put("recommend", recommend);
        int cnt = this.membersProc.update_recommend(map);
        System.out.println("selected cnt -> " + cnt);

        return cnt;
    }

}
