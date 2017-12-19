package com.gzyz.bean.personcar;

import java.util.Date;

public class ApplyInvoice {
	private String apply_reason;
	private int order_id;
	public String getApply_reason() {
		return apply_reason;
	}
	public void setApply_reason(String apply_reason) {
		this.apply_reason = apply_reason;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	@Override
	public String toString() {
		return "ApplyInvoice [apply_reason=" + apply_reason + ", order_id="
				+ order_id + "]";
	}
	
	
	
	
}
