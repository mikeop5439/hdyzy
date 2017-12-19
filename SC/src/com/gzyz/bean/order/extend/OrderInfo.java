package com.gzyz.bean.order.extend;

import com.gzyz.bean.order.Order;

public class OrderInfo extends Order{
	private int receiver_id;
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
	public int getReceiver_id() {
		return receiver_id;
	}
	public void setReceiver_id(int receiver_id) {
		this.receiver_id = receiver_id;
	}
	
	@Override
	public String toString() {
		return "OrderInfo [receiver_id=" + receiver_id + ", receiver_state="
				+ receiver_state + ", receiver_city=" + receiver_city
				+ ", receiver_district=" + receiver_district
				+ ", receiver_address=" + receiver_address + "]";
	}
}
