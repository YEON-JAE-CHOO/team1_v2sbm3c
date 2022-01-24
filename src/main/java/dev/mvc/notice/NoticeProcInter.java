package dev.mvc.notice;

import java.util.List;

public interface NoticeProcInter {
    /**
     * 등록
     * @param categrpVO
     * @return 등록된 레코드 갯수
     */
    public int create(NoticeVO noticeVO);
    
    /**
     * 등록 순서별 목록
     * @return
     */
    public List<NoticeVO> list_noticeno_asc();
    
    
    /**
     * 조회, 수정폼
     */
    public NoticeVO read(int noticeno);
    
//  수정처리
  public int update(NoticeVO noticeVO);
  
  
  /**
   * 삭제 처리
   * @param categrpno
   * @return 처리된 레코드 갯수
   */
  public int delete(int noticeno);
  
  /**
   * 출력 순서 상향
   * @param categrpno
   * @return 처리된 레코드 갯수
   */
  public int update_seqno_up(int noticeno);
 
  /**
   * 출력 순서 하향
   * @param categrpno
   * @return 처리된 레코드 갯수
   */
  public int update_seqno_down(int noticeno); 
  
  public int update_visible(NoticeVO noticeVO);
  
  
  
    
}
