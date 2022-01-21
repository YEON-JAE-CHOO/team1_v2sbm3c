package dev.mvc.orders;

public class OrdersdetailVO {
	public int getOdno() {
		return odno;
	}

	public void setOdno(int odno) {
		this.odno = odno;
	}

	public int getMenuno() {
		return menuno;
	}

	public void setMenuno(int menuno) {
		this.menuno = menuno;
	}

	public int getOno() {
		return ono;
	}

	public void setOno(int ono) {
		this.ono = ono;
	}

	private int odno;
	private int menuno;
	private int ono;

	@Override
	public String toString() {
		return "OrdersdetailVO [odno=" + odno + ", menuno=" + menuno + ", ono=" + ono + "]";
	}
}
