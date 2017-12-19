package com.gzyz.bean.order.extend;

import java.util.List;

public class TheOrderAndCount {
	private List<OrderAndUserAndOrderDetails> orderAndUserAndOrderDetails;
	private int thecount;
	public List<OrderAndUserAndOrderDetails> getOrderAndUserAndOrderDetails() {
		return orderAndUserAndOrderDetails;
	}
	public void setOrderAndUserAndOrderDetails(
			List<OrderAndUserAndOrderDetails> orderAndUserAndOrderDetails) {
		this.orderAndUserAndOrderDetails = orderAndUserAndOrderDetails;
	}
	public int getThecount() {
		return thecount;
	}
	public void setThecount(int thecount) {
		this.thecount = thecount;
	}
	@Override
	public String toString() {
		return "TheOrderAndCount [orderAndUserAndOrderDetails="
				+ orderAndUserAndOrderDetails + ", thecount=" + thecount + "]";
	}
	
}
