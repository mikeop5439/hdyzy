package com.gzyz.bean.order.extend;

public class GetOrderInfo {
	private String receiver_state;
	private String receiver_city;
	private String receiver_district;
	private String receiver_address;
	
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
	
	@Override
	public String toString() {
		return "GetOrderInfo [receiver_state=" + receiver_state
				+ ", receiver_city=" + receiver_city + ", receiver_district="
				+ receiver_district + ", receiver_address=" + receiver_address
				+ "]";
	}
	
}
