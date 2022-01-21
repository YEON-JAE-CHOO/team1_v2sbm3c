package dev.mvc.cate;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class CateCont {
    
    @Autowired
    @Qualifier("dev.mvc.cate.CateProc")
    private CateProcInter cateProc;

    public CateCont() {
        System.out.println("-> CateCont created.");
    }

    /** 업로드 파일 절대 경로 */
    private String uploadDir = Cate.getUploadDir();

    // 등록폼
    @RequestMapping(value = "/cate/create.do", method = RequestMethod.GET)
    public ModelAndView create() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/cate/create");

        return mav; // forward
    }

    // 등록 처리
    @RequestMapping(value = "/cate/create.do", method = RequestMethod.POST)
    public ModelAndView create(CateVO cateVO) {

        ModelAndView mav = new ModelAndView();
        // ------------------------------------------------------------------------------
        // 파일 전송 코드 시작
        // ------------------------------------------------------------------------------
        String file1 = ""; // 원본 파일명 image
        String file1saved = ""; // 저장된 파일명, image
        String thumb1 = ""; // preview image
        String uploadDir = this.uploadDir; // 파일 업로드 경로

        // 전송 파일이 없어도 file1MF 객체가 생성됨.
        // <input type='file' class="form-control" name='file1MF' id='file1MF'
        // value='' placeholder="파일 선택">
        MultipartFile mf = cateVO.getFile1MF();

        file1 = Tool.getFname(mf.getOriginalFilename()); // 원본 순수 파일명 산출
        System.out.println("-> file1: " + file1);

        long size1 = mf.getSize(); // 파일 크기

        if (size1 > 0) { // 파일 크기 체크
            // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
            file1saved = Upload.saveFileSpring(mf, uploadDir);

            if (Tool.isImage(file1saved)) { // 이미지인지 검사
                // thumb 이미지 생성후 파일명 리턴됨, width: 200, height: 150
                thumb1 = Tool.preview(uploadDir, file1saved, 200, 150);
            }

        }

        cateVO.setFile1(file1);
        cateVO.setFile1saved(file1saved);
        cateVO.setThumb1(thumb1);
        cateVO.setSize1(size1);
        // ------------------------------------------------------------------------------
        // 파일 전송 코드 종료
        // ------------------------------------------------------------------------------

        // Call By Reference: 메모리 공유, Hashcode 전달
        int cnt = this.cateProc.create(cateVO);

        // ------------------------------------------------------------------------------
        // 연속 입력을위한 PK의 return
        // ------------------------------------------------------------------------------
        System.out.println("-> cateno: " + cateVO.getCateno());
        mav.addObject("cateno", cateVO.getCateno()); // redirect parameter 적용
        // ------------------------------------------------------------------------------

        mav.addObject("cnt", cnt);

        if (cnt == 1) {

            mav.setViewName("redirect:/index.do");
        } else {
            mav.addObject("code", "create_fail");
            mav.setViewName("/cate/msg");
        }
        return mav;
    }

    // list 폼 페이지
    @RequestMapping(value = "/cate/list.do", method = RequestMethod.GET)
    public ModelAndView list() {
        ModelAndView mav = new ModelAndView();

        List<CateVO> list = this.cateProc.list_cateno_asc();
        mav.addObject("list", list);

        mav.setViewName("/cate/list");
        return mav;
    }

    // 수정하기 페이지
    @RequestMapping(value = "/cate/list_update.do", method = RequestMethod.GET)
    public ModelAndView update() {
        ModelAndView mav = new ModelAndView();

        List<CateVO> list = this.cateProc.list_cateno_asc();
        mav.addObject("list", list);

        mav.setViewName("/cate/list_update");
        return mav;
    }

    // 이름, seq 수정 폼
    @RequestMapping(value = "/cate/update_text.do", method = RequestMethod.GET)
    public ModelAndView read_update(int cateno) {

        ModelAndView mav = new ModelAndView();

        CateVO cateVO = this.cateProc.read(cateno);
        mav.addObject("cateVO", cateVO); // request 객체에 저장

        List<CateVO> list = this.cateProc.list_cateno_asc();
        mav.addObject("list", list); // request 객체에 저장

        mav.setViewName("/cate/update_text");
        return mav;
    }

    // 이름, seq 수정 처리
    @RequestMapping(value = "/cate/update_text.do", method = RequestMethod.POST)
    public ModelAndView update_text(CateVO cateVO) {

        ModelAndView mav = new ModelAndView();

        int cnt = this.cateProc.update_text(cateVO);

        mav.addObject("cnt", cnt);

        System.out.println("->" + cnt);

        mav.setViewName("/cate/list");

        return mav;
    }

    // 파일 수정 페이지
    @RequestMapping(value = "/cate/update_file.do", method = RequestMethod.GET)
    public ModelAndView update_file(int cateno) {

        ModelAndView mav = new ModelAndView();

        CateVO cateVO = this.cateProc.read(cateno);

        mav.addObject("cateVO", cateVO);

        mav.setViewName("/cate/update_file"); // /WEB-INF/views/contents/update_file.jsp

        return mav; // forward
    }

    // 파일 수정 처리
    @RequestMapping(value = "/cate/update_file.do", method = RequestMethod.POST)
    public ModelAndView update_file(CateVO cateVO) {

        ModelAndView mav = new ModelAndView();

        String uploadDir = this.uploadDir; // 파일 업로드 경로

        // 삭제할 파일 정보를 읽어옴, 기존에 등록된 레코드 저장용
        CateVO cateVO_old = cateProc.read(cateVO.getCateno());

        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("cateno", cateVO.getCateno());

        // -------------------------------------------------------------------
        // 파일 삭제 시작
        // -------------------------------------------------------------------
        // System.out.println("cateVO: " + vo.getContentsno());
        // System.out.println("file1: " + vo.getFile1());

        String file1saved = cateVO_old.getFile1saved();
        String thumb1 = cateVO_old.getThumb1();
        long size1 = 0;
        boolean sw = false;

        // 완성된 경로 C:/.kd1/deploy/team1_v2sbm3c/cate/storage/
        // String upDir = System.getProperty("user.dir") + "/"; // 절대 경로

        sw = Tool.deleteFile(uploadDir, file1saved); // Folder에서 1건의 파일 삭제
        sw = Tool.deleteFile(uploadDir, thumb1); // Folder에서 1건의 파일 삭제
        // System.out.println("sw: " + sw);
        // -------------------------------------------------------------------
        // 파일 삭제 종료
        // -------------------------------------------------------------------

        // -------------------------------------------------------------------
        // 파일 전송 코드 시작
        // -------------------------------------------------------------------
        String file1 = ""; // 원본 파일명 image

        // 완성된 경로
        // F:/ai8/ws_frame/resort_v1sbm3a/src/main/resources/static/contents/storage/
        // String upDir = System.getProperty("user.dir") +
        // "/src/main/resources/static/contents/storage/"; // 절대 경로

        // 전송 파일이 없어도 fnamesMF 객체가 생성됨.
        // <input type='file' class="form-control" name='file1MF' id='file1MF'
        // value='' placeholder="파일 선택">
        MultipartFile mf = cateVO.getFile1MF();

        file1 = mf.getOriginalFilename(); // 원본 파일명
        size1 = mf.getSize(); // 파일 크기

        if (size1 > 0) { // 파일 크기 체크
            // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
            file1saved = Upload.saveFileSpring(mf, uploadDir);

            if (Tool.isImage(file1saved)) { // 이미지인지 검사
                // thumb 이미지 생성후 파일명 리턴됨, width: 250, height: 200
                thumb1 = Tool.preview(uploadDir, file1saved, 250, 200);
            }

        } else { // 파일이 삭제만 되고 새로 올리지 않는 경우
            file1 = "";
            file1saved = "";
            thumb1 = "";
            size1 = 0;
        }

        cateVO.setFile1(file1);
        cateVO.setFile1saved(file1saved);
        cateVO.setThumb1(thumb1);
        cateVO.setSize1(size1);
        // -------------------------------------------------------------------
        // 파일 전송 코드 종료
        // -------------------------------------------------------------------

        // Call By Reference: 메모리 공유, Hashcode 전달
        int cnt = 0;
        cnt = this.cateProc.update_file(cateVO);
        System.out.println("-> cnt: " + cnt);

        mav.addObject("cateno", cateVO.getCateno());
        mav.setViewName("redirect:/cate/list.do");

        mav.addObject("cateno", cateVO_old.getCateno());
        System.out.println("-> cateno: " + cateVO_old.getCateno());

        return mav; // forward
    }

    // 삭제폼
    @RequestMapping(value = "/cate/delete.do", method = RequestMethod.GET)
    public ModelAndView delete(int cateno) {
        ModelAndView mav = new ModelAndView();

        // 삭제할 정보를 조회하여 확인
        CateVO cateVO = this.cateProc.read(cateno);

        mav.addObject("cateVO", cateVO);

        mav.setViewName("/cate/delete"); // contents/delete.jsp

        return mav;
    }

    // 삭제 처리
    @RequestMapping(value = "/cate/delete.do", method = RequestMethod.POST)
    public ModelAndView delete(CateVO cateVO) {
        ModelAndView mav = new ModelAndView();

        int cateno = cateVO.getCateno();

        int cnt = 0;
        // -------------------------------------------------------------------
        // 파일 삭제 코드 시작
        // -------------------------------------------------------------------
        // 삭제할 파일 정보를 읽어옴.
        CateVO vo = cateProc.read(cateno);
        System.out.println("cateno: " + vo.getCateno());
        System.out.println("file1: " + vo.getFile1());

        String file1saved = vo.getFile1saved();
        String thumb1 = vo.getThumb1();
        long size1 = 0;
        boolean sw = false;

        // 완성된 경로
        // F:/ai8/ws_frame/resort_v1sbm3a/src/main/resources/static/contents/storage/
        // String upDir = System.getProperty("user.dir") +
        // "/src/main/resources/static/contents/storage/"; // 절대 경로

        sw = Tool.deleteFile(uploadDir, file1saved); // Folder에서 1건의 파일 삭제
        sw = Tool.deleteFile(uploadDir, thumb1); // Folder에서 1건의 파일 삭제
        // System.out.println("sw: " + sw);
        // -------------------------------------------------------------------
        // 파일 삭제 종료 시작
        // -------------------------------------------------------------------

        cnt = this.cateProc.delete(cateno); // DBMS 삭제

        mav.addObject("cnt", cnt);

        mav.setViewName("/cate/list"); // delete_msg.jsp

        return mav; // forward
    }

}
