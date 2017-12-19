package com.gzyz.bean.order.extend;

public class TheOrderStatus {
	private int order_id;
	private int order_status;
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public int getOrder_status() {
		return order_status;
	}
	public void setOrder_status(int order_status) {
		this.order_status = order_status;
	}
	@Override
	public String toString() {
		return "TheOrderStatus [order_id=" + order_id + ", order_status="
				+ order_status + "]";
	}
	
}
