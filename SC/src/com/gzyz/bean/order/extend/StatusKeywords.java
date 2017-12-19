package com.gzyz.bean.order.extend;

public class StatusKeywords {
	private String shipping_name;
	private int order_id;
	private String shipping_code;
	private String receiver_state;
	private String receiver_city;
	private String receiver_district;
	private String receiver_address;
	private int receiver_id;
	
	public String getShipping_name() {
		return shipping_name;
	}
	public void setShipping_name(String shipping_name) {
		this.shipping_name = shipping_name;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public String getShipping_code() {
		return shipping_code;
	}
	public void setShipping_code(String shipping_code) {
		this.shipping_code = shipping_code;
	}
	public String getReceiver_state() {
		return receiver_state;
	}
	public void setReceiver_state(String receiver_state) {
		this.receiver_state = receiver_state;
	}
	public String getReceiver_city() {
		return receiver_city;
	}
	public void setReceiver_city(String receiver_city) {
		this.receiver_city = receiver_city;
	}
	public String getReceiver_district() {
		return receiver_district;
	}
	public void setReceiver_district(String receiver_district) {
		this.receiver_district = receiver_district;
	}
	public String getReceiver_address() {
		return receiver_address;
	}
	public void setReceiver_address(String receiver_address) {
		this.receiver_address = receiver_address;
	}
	public int getReceiver_id() {
		return receiver_id;
	}
	public void setReceiver_id(int receiver_id) {
		this.receiver_id = receiver_id;
	}
	
	@Override
	public String toString() {
		return "StatusKeywords [shipping_name=" + shipping_name + ", order_id="
				+ order_id + ", shipping_code=" + shipping_code
				+ ", receiver_state=" + receiver_state + ", receiver_city="
				+ receiver_city + ", receiver_district=" + receiver_district
				+ ", receiver_address=" + receiver_address + ", receiver_id="
				+ receiver_id + "]";
	}
	
}
