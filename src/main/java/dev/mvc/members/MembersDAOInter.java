package dev.mvc.members;

import java.util.List;

public interface MembersDAOInter {
	
	public int create(MembersVO membersvo);
	
	public List<MembersVO> list();
	
	

}
