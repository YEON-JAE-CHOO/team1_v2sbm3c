package dev.mvc.shoppingcart;

import dev.mvc.members.MembersVO;
import dev.mvc.menu.MenuVO;

public class Join_Shoppingcart_VO {

	private MembersVO membersvo;
	private MenuVO menuvo;
	private ShoppingcartVO shoppingcartvo;

	public MembersVO getMembersvo() {
		return membersvo;
	}

	public void setMembersvo(MembersVO membersvo) {
		this.membersvo = membersvo;
	}

	public MenuVO getMenuvo() {
		return menuvo;
	}

	public void setMenuvo(MenuVO menuvo) {
		this.menuvo = menuvo;
	}

	public ShoppingcartVO getShoppingcartvo() {
		return shoppingcartvo;
	}

	public void setShoppingcartvo(ShoppingcartVO shoppingcartvo) {
		this.shoppingcartvo = shoppingcartvo;
	}

}
