package dev.mvc.orders;

public class Orders_DetailVO {

	@Override
	public String toString() {
		return "Orders_DetailVO [odno=" + odno + ", ono=" + ono + ", menuno=" + menuno + "]";
	}

	public int getOdno() {
		return odno;
	}

	public void setOdno(int odno) {
		this.odno = odno;
	}

	public int getOno() {
		return ono;
	}

	public void setOno(int ono) {
		this.ono = ono;
	}

	public int getMenuno() {
		return menuno;
	}

	public void setMenuno(int menuno) {
		this.menuno = menuno;
	}

	private int odno;
	private int ono;
	private int menuno;

}
