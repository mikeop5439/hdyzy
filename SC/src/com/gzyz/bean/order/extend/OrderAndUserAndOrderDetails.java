package com.gzyz.bean.order.extend;

import java.util.List;

import com.gzyz.bean.order.Order;
import com.gzyz.bean.order.Order_details;
import com.gzyz.bean.users.User;

public class OrderAndUserAndOrderDetails extends Order{
	private User user;
	private List<Order_details> order_details;
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<Order_details> getOrder_details() {
		return order_details;
	}
	public void setOrder_details(List<Order_details> order_details) {
		this.order_details = order_details;
	}
	@Override
	public String toString() {
		return "OrderAndUserAndOrderDetails [user=" + user + ", order_details="
				+ order_details + "]";
	}
	
}
