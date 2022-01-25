package dev.mvc.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

// Autowired 기능에의해 자동 할당될 때 사용되는 이름
@Component("dev.mvc.notice.NoticeProc")

public class NoticeProc implements NoticeProcInter {
	// DI: 객체가 필요한 곳에 객체를 자동으로 생성하여 할당
	// Autowired: DI 사용 선언
	// Spring이 자동으로 CategrpDAOInter를 구현하여 DAO class 생성후 객체를 만들어 할당
	@Autowired
	private NoticeDAOInter noticeDAO;

	@Override
	public int create(NoticeVO noticeVO) {
		int cnt = noticeDAO.create(noticeVO);
		return cnt;
	}

	@Override
	public List<NoticeVO> list_noticeno_asc() {
		List<NoticeVO> list = null;
		list = this.noticeDAO.list_noticeno_asc();
		return list;
	}

	@Override
	public NoticeVO read(int noticeno) {
		NoticeVO noticeVO = this.noticeDAO.read(noticeno);
		return noticeVO;
	}

	@Override
	public int update(NoticeVO noticeVO) {
		int cnt = 0;
		cnt = this.noticeDAO.update(noticeVO);
		System.out.println("수정 처리됨");

		return cnt;
	}

	@Override
	public int delete(int noticeno) {
		int cnt = 0;
		cnt = this.noticeDAO.delete(noticeno);
		return cnt;
	}

	@Override
	public int update_seqno_up(int noticeno) {
		int cnt = this.noticeDAO.update_seqno_up(noticeno);
		return cnt;
	}

	@Override
	public int update_seqno_down(int noticeno) {
		int cnt = this.noticeDAO.update_seqno_down(noticeno);
		return cnt;
	}

	@Override
	public int update_visible(NoticeVO noticeVO) {
		int cnt = 0;
		if (noticeVO.getVisible().toUpperCase().equals("Y")) {
			noticeVO.setVisible("N");
		} else {
			noticeVO.setVisible("Y");
		}
		cnt = this.noticeDAO.update_visible(noticeVO);
		return cnt;
	}

}