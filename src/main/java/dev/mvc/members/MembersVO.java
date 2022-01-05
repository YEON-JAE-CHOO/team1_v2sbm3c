package dev.mvc.members;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class MembersVO {
	private int mno;
	/** 아이디 */
	private String id = "";
	/** 패스워드 */
	private String pw = "";
	/** 회원 성명 */
	private String name = "";
	/** 닉네임 */
	private String nickname = "";

	/** 전화 번호 */
	private String phone = "";
	/** 우편 번호 */
	private String housecode = "";
	/** 주소 1 */
	private String address1 = "";
	/** 주소 2 */
	private String address2 = "";
	/** 가입일 */
	private String rdate = "";
	/** 등급 */
	private int reco;

}
