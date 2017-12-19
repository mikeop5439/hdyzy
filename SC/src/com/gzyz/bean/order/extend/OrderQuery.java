package com.gzyz.bean.order.extend;

import java.util.List;

public class OrderQuery {
	private double count;
	private List<OrderVo> orderVo;
	private int allpage;
	
	public double getCount() {
		return count;
	}
	public void setCount(double count) {
		this.count = count;
	}
	public List<OrderVo> getOrderVo() {
		return orderVo;
	}
	public void setOrderVo(List<OrderVo> orderVo) {
		this.orderVo = orderVo;
	}
	public int getAllpage() {
		return allpage;
	}
	public void setAllpage(int allpage) {
		this.allpage = allpage;
	}
	
	@Override
	public String toString() {
		return "OrderQuery [count=" + count + ", orderVo=" + orderVo
				+ ", allpage=" + allpage + "]";
	}
	
}
