package com.gzyz.bean.order.extend;

public class ShappingAndOrderId extends ShappingNameAndCode{
	private int order_id;

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	@Override
	public String toString() {
		return "ShappingAndOrderId [order_id=" + order_id + "]";
	}
	
}
