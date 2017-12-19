package com.gzyz.bean.order.extend;


public class ShappingNameAndCode {
	private String shipping_name;
	private String shipping_code;
	public String getShipping_name() {
		return shipping_name;
	}
	public void setShipping_name(String shipping_name) {
		this.shipping_name = shipping_name;
	}
	public String getShipping_code() {
		return shipping_code;
	}
	public void setShipping_code(String shipping_code) {
		this.shipping_code = shipping_code;
	}
	@Override
	public String toString() {
		return "ShappingNameAndCode [shipping_name=" + shipping_name
				+ ", shipping_code=" + shipping_code + "]";
	}
	
}
