package dev.mvc.menu;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;

import dev.mvc.members.MembersProcInter;
import dev.mvc.members.MembersVO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class MenuCont {

	@Autowired
	@Qualifier("dev.mvc.menu.MenuProc")
	private MenuProcInter menuProc = null;

	public MenuCont() {
		System.out.println("-> MenuCont created.");
	}

	/** 업로드 파일 절대 경로 */
	private String uploadDir = Menu.getUploadDir();

	@RequestMapping(value = "/menu/list.do", method = RequestMethod.GET)
	public ModelAndView testlist() {
		ModelAndView mav = new ModelAndView();
		List<MenuVO> list = this.menuProc.testlist();

		System.out.println("MenuVO list ->" + list);
		System.out.println("MenuVO toString ->");

		for (int i = 1; i <= list.size(); i++) {
			System.out.println("MenuVO toString ->" + list.toString());

		}

		mav.setViewName("/menutest"); // webapp/members/list.jsp

		return mav; // forward
	}

	@RequestMapping(value = "/menu/insert.do", method = RequestMethod.GET)
	public ModelAndView insert() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/menu/insert");

		return mav;
	}

	@RequestMapping(value = "/stadium/register_stadium.do", method = RequestMethod.POST)
	public ModelAndView register(HttpServletRequest request, MenuVO menuvo) {
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
		MultipartFile mf = menuvo.getFile1MF();

		file1 = Tool.getFname(mf.getOriginalFilename()); // 원본 순수 파일명 산출
		// System.out.println("-> file1: " + file1);

		long size1 = mf.getSize(); // 파일 크기

		if (size1 > 0) { // 파일 크기 체크
			// 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
			file1saved = Upload.saveFileSpring(mf, uploadDir);

			if (Tool.isImage(file1saved)) { // 이미지인지 검사
				// thumb 이미지 생성후 파일명 리턴됨, width: 200, height: 150
				thumb1 = Tool.preview(uploadDir, file1saved, 200, 150);
			}

		}
		menuvo.setFile1(file1);
		menuvo.setFile1saved(file1saved);
		menuvo.setThumb(thumb1);
		menuvo.setImagesize(size1);

		// ------------------------------------------------------------------------------
		// 파일 전송 코드 종료
		// ------------------------------------------------------------------------------

		int cnt = this.menuProc.insert(menuvo);

		if (cnt == 1) {
			// mav.addObject("code", "create_success");
			// cateProc.increaseCnt(contentsVO.getCateno()); // 글수 증가
			System.out.println("success ////cnt->" + cnt);
		} else {
			// mav.addObject("code", "create_fail");
			System.out.println("faile /////cnt->" + cnt);
		}
		mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)
		return mav;
	}

}
