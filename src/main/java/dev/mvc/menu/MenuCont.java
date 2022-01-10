package dev.mvc.menu;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.restaurant.RestaurantProcInter;
import dev.mvc.restaurant.RestaurantVO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;


@Controller
public class MenuCont {

	@Autowired
	@Qualifier("dev.mvc.menu.MenuProc")
	private MenuProcInter menuProc = null;
	
	@Autowired
	@Qualifier("dev.mvc.restaurant.RestaurantProc")
	private RestaurantProcInter restaurantProc;

	public MenuCont() {
		System.out.println("-> MenuCont created.");
	}

	/** 업로드 파일 절대 경로 */
	private String uploadDir = Menu.getUploadDir();

	/** 페이지 오픈 & 메뉴 리스트 출력 */
	/**/
	/**/
	
	// http://localhost:9091/menu/list.do?rno=12
	@RequestMapping(value = "/menu/list.do", method = RequestMethod.GET)
	public ModelAndView testlist(int rno) {
		ModelAndView mav = new ModelAndView();

		System.out.println("rno ->" + rno);
		List<MenuVO> list = this.menuProc.testlist(rno);
		RestaurantVO restaurant = this.restaurantProc.create_shop(rno);
		System.out.println("list -->" + list);
		mav.addObject("list", list);
		mav.addObject("rno", rno);
		mav.setViewName("/menutest"); // webapp/members/list.jsp

		return mav; // forward
	}



	/** 메뉴 삭제 */
	/**/
	/**/
	@RequestMapping(value = "/menu/delete.do", method = RequestMethod.GET)
	public ModelAndView delete(int menuno, int rno) {
		ModelAndView mav = new ModelAndView();
		System.out.println("menuno _> " + menuno + "rno -> " + rno);

		int cnt = this.menuProc.delete(menuno);

		System.out.println("cnt _> " + cnt);
		if (cnt >= 1) {
			System.out.println(menuno + "  삭제 성공");
			mav.setViewName("redirect:/menu/list.do?rno=" + rno);
		} else {
			System.out.println("삭제 실패");
			String msg = "오류";
			mav.setViewName("redirect:/menu/list.do?rno=" + rno);
			mav.addObject("msg", msg);

		}

		return mav;
	}
	
	
	/** 메뉴 수정 열기 */
	/**/
	/**/
	@RequestMapping(value = "/menu/update.do", method = RequestMethod.GET)
	public ModelAndView update(int menuno, int rno) {
		ModelAndView mav = new ModelAndView();
		System.out.println("menuno _> " + menuno + "rno -> " + rno);
		
		MenuVO menuvo = this.menuProc.read(menuno);
		
		System.out.println("menuvo ->"+menuvo.toString());
		
		mav.addObject("menuvo", menuvo);
		mav.setViewName("/restaurant/update_menu");

		return mav;
	}

	@RequestMapping(value = "/restaurant/openaddmenupage.do", method = RequestMethod.GET)
	public ModelAndView insert(int rno) {
		ModelAndView mav = new ModelAndView();

		System.out.println("rno -->" + rno);

		mav.addObject("rno", rno);
		mav.setViewName("/restaurant/addmenu");

		return mav;
	}

	/** 메뉴 등록 */
	/**/
	/**/
	@RequestMapping(value = "/restaurant/addmenu.do", method = RequestMethod.POST)
	public ModelAndView register(HttpServletRequest request, MenuVO menuvo) {
		ModelAndView mav = new ModelAndView();

		// ------------------------------------------------------------------------------
		// 파일 전송 코드 시작
		// ------------------------------------------------------------------------------
		String file1 = ""; // 원본 파일명 image
		String filesaved1 = ""; // 저장된 파일명, image
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
			filesaved1 = Upload.saveFileSpring(mf, uploadDir);

			if (Tool.isImage(filesaved1)) { // 이미지인지 검사
				// thumb 이미지 생성후 파일명 리턴됨, width: 200, height: 150
				thumb1 = Tool.preview(uploadDir, filesaved1, 200, 150);
			}

		}
		menuvo.setFile1(file1);
		menuvo.setFilesaved1(filesaved1);
		menuvo.setThumb(thumb1);
		menuvo.setImagesize(size1);

		menuvo.setRno(12);
		System.out.println("menuvo의 rno ->" + menuvo.getRno());
		// ------------------------------------------------------------------------------
		// 파일 전송 코드 종료
		// ------------------------------------------------------------------------------

		int cnt = this.menuProc.insert(menuvo);

		if (cnt == 1) {
			// mav.addObject("code", "create_success");
			// cateProc.increaseCnt(contentsVO.getCateno()); // 글수 증가
			System.out.println("success ////cnt->" + cnt);
			mav.setViewName("/menutest");
		} else {
			// mav.addObject("code", "create_fail");
			System.out.println("faile /////cnt->" + cnt);
			mav.setViewName("redirect:/restaurant/openaddmenupage.do");
		}
		mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)
		return mav;
	}
	
	
	/** 메뉴 등록 */
	/**/
	/**/
	@RequestMapping(value = "/restaurant/updatemenu.do", method = RequestMethod.POST)
	public ModelAndView update_menu(HttpServletRequest request, MenuVO menuvo) {
		ModelAndView mav = new ModelAndView();

		// ------------------------------------------------------------------------------
		// 파일 전송 코드 시작
		// ------------------------------------------------------------------------------
		String file1 = ""; // 원본 파일명 image
		String filesaved1 = ""; // 저장된 파일명, image
		String thumb1 = ""; // preview image
		String uploadDir = this.uploadDir; // 파일 업로드 경로

		// 전송 파일이 없어도 file1MF 객체가 생성됨.
		// <input type='file' class="form-control" name='file1MF' id='file1MF'
		// value='' placeholder="파일 선택">
		MultipartFile mf = menuvo.getFile1MF();

		file1 = Tool.getFname(mf.getOriginalFilename()); // 원본 순수 파일명 산출
		// System.out.println("-> file1: " + file1);

		long size1 = mf.getSize(); // 파일 크기
		
		System.out.println("menuno ->"+menuvo.getMenuno());
		System.out.println("menu title ->"+menuvo.getTitle());
		System.out.println("menu price ->"+menuvo.getPrice());

		if (size1 > 0) { // 파일 크기 체크
			// 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
			filesaved1 = Upload.saveFileSpring(mf, uploadDir);

			if (Tool.isImage(filesaved1)) { // 이미지인지 검사
				// thumb 이미지 생성후 파일명 리턴됨, width: 200, height: 150
				thumb1 = Tool.preview(uploadDir, filesaved1, 200, 150);
			}

		}
		menuvo.setFile1(file1);
		menuvo.setFilesaved1(filesaved1);
		menuvo.setThumb(thumb1);
		menuvo.setImagesize(size1);
		
		menuvo.setRno(12);
		System.out.println("333333"+menuvo.toString());
		System.out.println("menuvo의 rno2 ->" + menuvo.getRno());
		// ------------------------------------------------------------------------------
		// 파일 전송 코드 종료
		// ------------------------------------------------------------------------------

		int cnt = this.menuProc.update(menuvo);

		if (cnt == 1) {
			// mav.addObject("code", "create_success");
			// cateProc.increaseCnt(contentsVO.getCateno()); // 글수 증가
			System.out.println("메뉴 수정 성공-> " + cnt);
			mav.setViewName("redirect:/menu/list.do?rno=12");
		} else {
			// mav.addObject("code", "create_fail");
			System.out.println("메뉴 수정 실패-> " + cnt);
			mav.setViewName("redirect:/restaurant/openaddmenupage.do?rno=12");
		}
		mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)
		return mav;
	}


}
