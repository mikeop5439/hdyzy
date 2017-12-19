package com.gzyz.bean.order.extend;

public class OrderKeywords {
	private int order_id;
	//private String user_name;
	private int nowpage;
	
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	/*public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}*/
	public int getNowpage() {
		return nowpage;
	}
	public void setNowpage(int nowpage) {
		this.nowpage = nowpage;
	}
	@Override
	public String toString() {
		return "OrderKeywords [order_id=" + order_id + ", nowpage=" + nowpage
				+ "]";
	}
	
	/*@Override
	public String toString() {
		return "OrderKeywords [order_id=" + order_id + ", user_name="
				+ user_name + ", nowpage=" + nowpage + "]";
	}*/
	
}
