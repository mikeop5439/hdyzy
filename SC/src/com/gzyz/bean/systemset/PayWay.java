package com.gzyz.bean.systemset;

public class PayWay {
	
	private int payway_id;
	private String payway_name;
	public int getPayway_id() {
		return payway_id;
	}
	public void setPayway_id(int payway_id) {
		this.payway_id = payway_id;
	}
	public String getPayway_name() {
		return payway_name;
	}
	public void setPayway_name(String payway_name) {
		this.payway_name = payway_name;
	}
	@Override
	public String toString() {
		return "PayWay [payway_id=" + payway_id + ", payway_name="
				+ payway_name + ", toString()=" + super.toString() + "]";
	}
	
}
