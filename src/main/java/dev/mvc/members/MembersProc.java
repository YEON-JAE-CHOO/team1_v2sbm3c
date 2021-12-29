package dev.mvc.members;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.members.MembersProc")
public class MembersProc implements MembersProcInter {

	@Autowired
	private MembersDAOInter membersDAO;

	public MembersProc() {
		System.out.println("-> MembersProc created.");
	}
	  
	@Override
	public int create(MembersVO membersvo) {
		int cnt = this.membersDAO.create(membersvo);

		return cnt;
	}

	@Override
	public List<MembersVO> list() {
		List<MembersVO> list = this.membersDAO.list();
		return list;
	}

}
