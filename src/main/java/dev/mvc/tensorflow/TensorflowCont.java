package dev.mvc.tensorflow;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TensorflowCont {
    public TensorflowCont() {
        System.out.println("-> TensorflowCont created.");
        
    }
 // http://localhost:9091/tensorflow/chatbot.do
    @RequestMapping(value = {"/tensorflow/chatbot.do"}, method = RequestMethod.GET)
    public ModelAndView chatbot() {
      ModelAndView mav = new ModelAndView();
      mav.setViewName("/tensorflow/chatbot");  // /WEB-INF/views/tensorflow/chatbot.jsp
      
      return mav;
    }
      
}