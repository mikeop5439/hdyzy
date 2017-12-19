package com.gzyz.bean.personcar;

public class OrderIdAndUser {
	private int user_id;
	private int order_id;
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	@Override
	public String toString() {
		return "OrderIdAndUser [user_id=" + user_id + ", order_id=" + order_id
				+ "]";
	}
	
}
