package dev.mvc.orders;

import java.util.HashMap;
import java.util.List;

public interface OrdersDAOInter {

	/** 주문 등록 **/
	public int create(OrdersVO ordersVO);

	/** 주문 상세 등록 **/
	public int create_detail(Orders_DetailVO odvo);

	/** 최근 생성된 ORDERS 읽기 **/
	public OrdersVO read_recent(int mno);

	/** 최근 생성된 ORDERS 읽기 by ono **/
	public OrdersVO read_recent_by_ono(int ono);

	/** by rno ORDERS 읽기 **/
	public List<OrdersVO> List_order_by_rno(int rno);

	/** 주문 목록 리스트 **/
	public List<OrdersListVO> read_order(int mno);

	/** 주문 목록 최근 **/
	public List<OrdersListVO> read_order_recent(int mno);

	/* 가장 최근 주문 번호 출력 */
	public Integer recent_order_no(int mno);

	/* 가장 최근 주문 번호에 해당하는 상세 주문 리스트 출력 */
	public List<OrdersListVO> recent_order_detail(int ono);

	/* 가장 최근 주문 번호에 해당하는 상세 주문 리스트 출력 */
	public int update_state_by_ono(int ono);

	/* Date 날짜 입력받아 총매출 출력 */
	public Integer select_totalprice_by_rno_date(HashMap<String, Object> hashMap);

	/* Rno 입력받아 총매출 출력 */
	public Integer select_totalprice_by_rno(int rno);

}
