package com.gzyz.bean.order.extend;

import java.util.List;

import com.gzyz.bean.order.Order_invoice;

public class Order_invoiceAnadAllpage {
	private int allpage;
	private List<Order_invoice> order_invoices;
	public int getAllpage() {
		return allpage;
	}
	public void setAllpage(int allpage) {
		this.allpage = allpage;
	}
	public List<Order_invoice> getOrder_invoices() {
		return order_invoices;
	}
	public void setOrder_invoices(List<Order_invoice> order_invoices) {
		this.order_invoices = order_invoices;
	}
	@Override
	public String toString() {
		return "Order_invoiceAnadAllpage [allpage=" + allpage
				+ ", order_invoices=" + order_invoices + "]";
	}
	

	
	
}
