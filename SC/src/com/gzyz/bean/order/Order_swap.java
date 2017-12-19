package com.gzyz.bean.order;

public class Order_swap {
	private int swap_id;
	private int order_id;
	private int swap_status;
	private String apply_reason;
	public int getSwap_id() {
		return swap_id;
	}
	public void setSwap_id(int swap_id) {
		this.swap_id = swap_id;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public int getSwap_status() {
		return swap_status;
	}
	public void setSwap_status(int swap_status) {
		this.swap_status = swap_status;
	}
	public String getApply_reason() {
		return apply_reason;
	}
	public void setApply_reason(String apply_reason) {
		this.apply_reason = apply_reason;
	}
	@Override
	public String toString() {
		return "Order_swap [swap_id=" + swap_id + ", order_id=" + order_id
				+ ", swap_status=" + swap_status + ", apply_reason="
				+ apply_reason + "]";
	}
	
}
