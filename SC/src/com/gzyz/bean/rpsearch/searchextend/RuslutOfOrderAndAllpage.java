package com.gzyz.bean.rpsearch.searchextend;

import java.util.List;

import com.gzyz.bean.order.extend.OrderAndUserAndOrderDetails;

public class RuslutOfOrderAndAllpage {
	private List<OrderAndUserAndOrderDetails> orderAndUserAndOrderDetails;
	private int allpage;
	public List<OrderAndUserAndOrderDetails> getOrderAndUserAndOrderDetails() {
		return orderAndUserAndOrderDetails;
	}
	public void setOrderAndUserAndOrderDetails(
			List<OrderAndUserAndOrderDetails> orderAndUserAndOrderDetails) {
		this.orderAndUserAndOrderDetails = orderAndUserAndOrderDetails;
	}
	public int getAllpage() {
		return allpage;
	}
	public void setAllpage(int allpage) {
		this.allpage = allpage;
	}
	@Override
	public String toString() {
		return "RuslutOfOrderAndAllpage [orderAndUserAndOrderDetails="
				+ orderAndUserAndOrderDetails + ", allpage=" + allpage + "]";
	}
	
}
