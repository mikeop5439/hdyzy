package com.gzyz.bean.order.extend;

public class OrderDateAndUsernameAndOrderId {
	private String startdate;
	private String enddate;
	private int order_id;
	private String user_name;
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	@Override
	public String toString() {
		return "OrderDateAndUsernameAndOrderId [startdate=" + startdate
				+ ", enddate=" + enddate + ", order_id=" + order_id
				+ ", user_name=" + user_name + "]";
	}
	
}
